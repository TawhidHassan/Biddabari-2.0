import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/features/CourseProgress/presentation/pages/course%20show/youtube.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pod_player/pod_player.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/LocalDataBase/AddressLocal/AddressLocal.dart';
import '../../../../../core/common/data/video/LoacalVideo.dart';
import '../../../../../core/common/widgets/Button/custom_button.dart';
import '../../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../../core/config/util/text_style.dart';
import '../../../../../core/custom_assets/assets.gen.dart';
import '../../../../AllCourse/data/models/courseSectionContent/CourseSectionContent.dart';
import '../../controller/CourseProgress_controller.dart';
import '../Comment/content_comments_page.dart';


class VideoContent extends StatefulWidget {
  final CourseSectionContent? courseSectionContent;
  final bool? isCourseExam;

  const VideoContent({Key? key, this.courseSectionContent, this.isCourseExam=false}) : super(key: key);

  @override
  State<VideoContent> createState() => _VideoContentState();
}

class _VideoContentState extends State<VideoContent> {

  String? files;
  File? file;
  bool readyToGo = false;
  bool playis = false;
  bool? isEnd = false;
  int initIndex = 1;
  bool? audioFinish = true;
  bool _showOverlay = false;
  bool _isForward = false;
  bool? localVideoPlay = false;

  String? videoId;
  CourseProgressController controllerx = Get.find<CourseProgressController>();
  List<LoacalVideo> downloadsListMaps = [];
  ReceivePort _receivePort = ReceivePort();

  late final PodPlayerController controllerPod;

  YoutubePlayerController? youtubeController;
  @override
  void initState() {

    // TODO: implement initState
    Logger().w( widget.courseSectionContent!.videoLink.toString().split("v=")[1]);
    youtubeController = YoutubePlayerController(
      initialVideoId: widget.courseSectionContent!.videoLink.toString().split("v=")[1],
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        readyToGo = true;
      });
    });
    controllerx.playOneline.value = false;
    task();

    super.initState();

    _bindBackgroundIsolate();

    ///register a send port for the other isolates
    // IsolateNameServer.registerPortWithName(
    //     _receivePort.sendPort, "downloading");
    // Logger().w(_receivePort.sendPort);


    FlutterDownloader.registerCallback(downloadCallback);

    ///Listening for the data is comming other isolataes
    // _receivePort.listen((message) async {
    //   Future.delayed(Duration.zero,(){
    //     controllerx.updatePrgress(message[2],message[0]);
    //   });
    //
    //   Logger().w(message[2]);
    //   Logger().e(message[1]);
    //   Logger().i(message[0]);
    // });
  }


  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloading');
  }

  void _bindBackgroundIsolate() {
    final isSuccess = IsolateNameServer.registerPortWithName(
        _receivePort.sendPort, 'downloading');
    Logger().i('regPort: $isSuccess');

    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }

    ///Listening for the data is comming other isolataes
    Logger().i('before listen');

    _receivePort.listen((dynamic message) {
      Future.delayed(Duration.zero, () {
        controllerx.updatePrgress(message[2], message[0]);
      });

      if (message[2] == 100) {
        Get.find<CourseProgressController>().addAddress(
            AddressLocal(
             name:  widget.courseSectionContent!.title??"",
             number:  widget.courseSectionContent!.title!+widget.courseSectionContent!.id.toString(),
            address: Get.find<CourseProgressController>().courseContentDetails.value!.course!.title??''));
        Navigator.pop(context);
      }
      Logger().w(message[2]);
      Logger().e(message[1]);
      Logger().i(message[0]);
    }, onError: (err) {
      Logger().w(err);
    },
        onDone: () {
          Logger().w("Done");

        });
  }


  @pragma('vm:entry-point')
  static void downloadCallback(id,
      status,
      progress,) {
    Logger().i('Callback on background isolate: '
        'task ($id) is in status ($status) and progress ($progress)');

    IsolateNameServer.lookupPortByName('downloading')
        ?.send([id, status, progress]);
  }

  // static downloadingCallback(id, status, progress) {
  //   ///Looking up for a send port
  //   // SendPort? sendPort = IsolateNameServer.lookupPortByName("downloading");
  //   IsolateNameServer.lookupPortByName('downloading')
  //       ?.send([id, status, progress]);
  //   ///ssending the data
  //   // sendPort!.send([id, status, progress]);
  // }


  Future task() async {
    List<DownloadTask>? getTasks = await FlutterDownloader.loadTasks();
    getTasks!.forEach((_task) {
      Map _map = Map();
      _map['status'] = _task.status.index;
      _map['progress'] = _task.progress;
      _map['id'] = _task.taskId;
      _map['filename'] = _task.filename;
      _map['savedDirectory'] = _task.savedDir;
      // Logger().d("local lenght: "+downloadsListMaps.length.toString());
      downloadsListMaps.add(LoacalVideo(
          _task.status.index, _task.progress, _task.taskId, _task.filename,
          _task.savedDir));
    });


    if (downloadsListMaps
        .where((element) =>
    element.filename == widget.courseSectionContent!.id.toString())
        .isNotEmpty) {
      List<FileSystemEntity> _directories = Directory(downloadsListMaps
          .where((element) =>
      element.filename == widget.courseSectionContent!.id.toString())
          .first
          .savedDirectory!).listSync(followLinks: true);
      final externalDir = await getExternalStorageDirectory();

      file = File(
          externalDir!.path + "/" + widget.courseSectionContent!.id.toString());

      controllerPod = PodPlayerController(
        podPlayerConfig: PodPlayerConfig(
          autoPlay: false,
          videoQualityPriority:[1080, 720, 360], // Set default quality (low, medium, high) if available
        ),
        playVideoFrom: PlayVideoFrom.file(
            file!
      ),
    )..initialise();

    } else {
      youtubeController = YoutubePlayerController(
        initialVideoId: widget.courseSectionContent!.videoLink.toString().split("v=")[1],
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    }

    setState(() {});
  }


  @override
  void dispose() {
    // TODO: implement dispose
    controllerPod.pause();
    controllerPod.dispose();

    _unbindBackgroundIsolate();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Logger().e(downloadsListMaps
        .where((element) =>
    element.filename == widget.courseSectionContent!.id.toString())
        .isNotEmpty);
    return PopScope(
        child: GetBuilder<CourseProgressController>(
          assignId: true,
          builder: (controller) {
            return controller.videoFullScrren.value?
            YoutubeXpoPlayer(
              controller: controller,
              youtubeController: youtubeController,
            ):
            Scaffold(
              // floatingActionButton: FloatingActionButton.extended(
              //   onPressed: () =>
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => OfflineDownloads(),
              //         ),
              //       ),
              //   label: Text('Downloads'),
              // ),
              appBar:controller.videoFullScrren.value?null: AppBar(
                leading: InkWell(
                    onTap: ()async {
                      await SystemChrome.setPreferredOrientations(
                          [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
                      context.pop();
                      youtubeController!.pause();
                      youtubeController!.dispose();
                    },
                    child: Padding(
                        padding: EdgeInsets.all(18),
                        child: Assets.icons.backArrow.svg())),
                centerTitle: false,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Course Content"),
                    Text(widget.courseSectionContent!.title ?? "",style:semiBoldText(12),),
                  ],
                ),


                actions: [
                  downloadsListMaps
                      .where((element) =>
                  element.filename == widget.courseSectionContent!.id.toString())
                      .isNotEmpty ?
                  Container(
                    margin: EdgeInsets.only(right: 24),
                    child: InkWell(
                        onTap: () async {
                          // final status = await Permission.storage.request();
                          Get.snackbar(
                              "Already Downloaded The video", "Now You Can Play This",
                              colorText: Colors.white,
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8));
                          controllerx.playOneline.value = true;
                          youtubeController = YoutubePlayerController(
                            initialVideoId: widget.courseSectionContent!.videoLink.toString().split("v=")[1],
                            flags: YoutubePlayerFlags(
                              autoPlay: false,
                              mute: false,
                            ),
                          );
                          setState(() {

                          });

                        },
                        child: Icon(Icons.play_circle_outline_sharp,
                          color: Colors.redAccent,)),
                  )
                      :
                  Container(
                    margin: EdgeInsets.only(right: 24),
                    child: InkWell(
                        onTap: () async {
                          // final status = await Permission.storage.request();
                          youtubeController!.pause();
                          controllerPod.pause();
                          // controllerPod.dispose();
                          controller.downloadCirculer.value = true;
                          controller.downloadProgress.value = 0;
                          controllerx.playOneline.value = false;
                          controller.update();
                          getDownloadUrl(videoId!).then((value) async {
                            final externalDir = await getExternalStorageDirectory();
                            final id = await FlutterDownloader.enqueue(
                              headers: {
                                HttpHeaders.connectionHeader: 'keep-alive',
                              },
                              url: value,
                              savedDir: externalDir!.path,
                              fileName: widget.courseSectionContent!.id!
                                  .toString(),
                              showNotification: true,
                              openFileFromNotification: true,
                            ).then((value) {
                              // controllerx.downloadCirculer.value = false;
                              // controllerx.downloadProgress.value = 0;
                              // controllerx.update();
                              // Logger().i(value);
                            });
                          });
                        },
                        child: Assets.icons.dwonload2.svg( )),
                  )

                ],
              ),
              body: Container(
                  height: 1.0.sh,
                  width: 1.0.sw,
                  color: controller.videoFullScrren.value?Colors.black:Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: !readyToGo ? Center(child: LoadingWidget(),) :
                  Obx(() {
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        controllerx.playOneline.value == true ?
                        YoutubeXpoPlayer(
                          controller: controller,
                          youtubeController: youtubeController,
                        )
                            :
                        controller.downloadCirculer.value ?
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            LoadingWidget(),
                            LinearProgressIndicator(
                              color: AppColors.kPrimaryColorx,
                              value: controller.downloadProgress.value / 100,
                            ),
                            Text("Download progress: " +
                                controller.downloadProgress.value.toString() +
                                "%",
                              style: boldText(16, color: AppColors.kPrimaryColorx),
                            ),
                            SizedBox(height: 12,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  child:
                                  Icon(Icons.close, size: 26, color: Colors.red),
                                  onTap: () {
                                    controller.downloadCirculer.value = false;
                                    controller.downloadProgress.value = 0;
                                    controller.update();
                                    var index = downloadsListMaps.indexWhere((
                                        element) =>
                                    element.id == controller.downloadId.value);
                                    Logger().w(index);
                                    downloadsListMaps.removeAt(index);
                                    FlutterDownloader.remove(
                                        taskId: controller.downloadId.value);
                                    youtubeController = YoutubePlayerController(
                                      initialVideoId: widget.courseSectionContent!.videoLink.toString().split("v=")[1],
                                      flags: YoutubePlayerFlags(
                                        autoPlay: false,
                                        mute: false,
                                      ),
                                    );
                                    setState(() {

                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        )
                            :
                        downloadsListMaps
                            .where((element) =>
                        element.filename ==
                            widget.courseSectionContent!.id.toString())
                            .isNotEmpty ?
                        downloadsListMaps
                            .where((element) =>
                        element.filename ==
                            widget.courseSectionContent!.id.toString())
                            .first
                            .status != 3 ?
                        Column(
                          children: [
                            Text("Do you want to continue download?"),
                            GestureDetector(
                              child: Icon(Icons.play_arrow,
                                  size: 24, color: Colors.blue),
                              onTap: () {
                                controller.downloadCirculer.value = true;
                                controller.downloadProgress.value = 0;
                                controller.update();
                                FlutterDownloader.retry(taskId: downloadsListMaps
                                    .where((element) =>
                                element.filename ==
                                    widget.courseSectionContent!.id.toString())
                                    .first
                                    .id!).then(
                                      (newTaskID) =>
                                      changeTaskID(downloadsListMaps
                                          .where((element) =>
                                      element.filename ==
                                          widget.courseSectionContent!.id
                                              .toString())
                                          .first
                                          .id!, newTaskID!),
                                );
                              },
                            ),
                            SizedBox(height: 16,),
                            GestureDetector(
                              child:
                              Icon(Icons.close, size: 24, color: Colors.red),
                              onTap: () {
                                controller.downloadCirculer.value = false;
                                controller.downloadProgress.value = 0;
                                controller.update();
                                var index = downloadsListMaps.indexWhere((
                                    element) =>
                                element.filename ==
                                    widget.courseSectionContent!.id.toString());
                                // Logger().w(index);
                                downloadsListMaps.removeAt(index);
                                FlutterDownloader.remove(taskId: downloadsListMaps
                                    .where((element) =>
                                element.filename ==
                                    widget.courseSectionContent!.id.toString())
                                    .first
                                    .id!);
                              },
                            )
                          ],
                        )
                            :
                        Column(
                          children: [
                            controllerPod.isInitialised
                                ?
                            PodVideoPlayer(
                            controller: controllerPod)
                            :
                            SizedBox(
                                height: 80,
                                width: 80,
                                child: CircularProgressIndicator())
                          ],
                        )
                            :

                        YoutubeXpoPlayer(
                          controller: controller,
                          youtubeController: youtubeController,
                        ),
                        // SizedBox(
                        //   height:MediaQuery.of(context).orientation == Orientation.landscape?350:200,
                        //   child: YoutubePlayerBuilder(
                        //     onEnterFullScreen: (){
                        //       controller.videoFullScrren.value=true;
                        //     },
                        //     onExitFullScreen: (){
                        //       controller.videoFullScrren.value=false;
                        //     },
                        //     player: YoutubePlayer(
                        //       thumbnail: SizedBox(),
                        //       showVideoProgressIndicator: true,
                        //       progressColors: ProgressBarColors(
                        //           backgroundColor: kPrimaryColorx.withOpacity(
                        //               0.40),
                        //           bufferedColor: kPrimaryColorx,
                        //           playedColor: kPrimaryColorx,
                        //           handleColor: kPrimaryColorx),
                        //       controller: _controller!,
                        //     ),
                        //     builder: (context, player) {
                        //       return ListView(
                        //         shrinkWrap: true,
                        //         children: [
                        //           player,
                        //           SizedBox(),
                        //         ],
                        //       );
                        //     },
                        //   ),
                        // ),
                        SizedBox(height: 16,),
                        widget.courseSectionContent!.hasClassXm!=0&&widget.courseSectionContent!.classXmStatus!="0"?
                        CustomButton(
                          color: Colors.blueAccent,
                          height: 48,
                          width: 1.0.sw,
                          textColor: Colors.white,
                          borderRadius: 12,
                          title: "See Class Test Answer",
                          onTap: () {
                            print(widget.courseSectionContent!.id.toString());
                            // Navigator.pushNamed(
                            //     context, SEE_ANSWER_PAGE, arguments: {
                            //   "id": widget.courseSectionContent!.id.toString(),
                            //   "isCourseExam": widget.isCourseExam,
                            //   "iswriitenExam": false,
                            //   "hasClassXm":widget.courseSectionContent!.hasClassXm!.toInt(),
                            //   "isClassExam":true
                            // });
                          },
                        )
                            :SizedBox(),
                        SizedBox(height: 16,),

                        Get.find<CourseProgressController>().videoFullScrren.value?SizedBox():
                        CourseContentCommentPage(
                          id: widget.courseSectionContent!.id.toString(),
                          type: "course_content",
                          page: false,
                        )
                      ],
                    );
                  })
              ),
            );
          },
        ),
        canPop: false,
        onPopInvoked: (didPop) async {
          if (didPop) {
            return;
          }
          // final bool? shouldPop = await _showBackDialog();
          // print("object");

          await SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
          if(youtubeController!=null){
            youtubeController!.pause();
            youtubeController!.dispose();
          }

          context.pop();

        });
  }


  void changeTaskID(String taskid, String newTaskID) {
    LoacalVideo task = downloadsListMaps.firstWhere(
          (element) => element.id == taskid,

    );
    task.id = newTaskID;
    setState(() {});
  }


  Future<String> getDownloadUrl(String videoId) async {
    var youtube = YoutubeExplode();
    var video = await youtube.videos.get(videoId);
    var streamManifest = await youtube.videos.streamsClient.getManifest(
        videoId);
    var audioOnlyStreams = streamManifest.muxed;
    var audioStream = audioOnlyStreams.first;

    Logger().w(audioStream.url.toString());
    return audioStream.url.toString();
  }


  Widget downloadStatus(int _status) {
    return _status == 4
        ? Text('Download canceled')
        : _status == 3
        ? Text('Download completed')
        : _status == 4
        ? Text('Download failed')
        : _status == 5
        ? Text('Download paused')
        : _status == 2
        ? Text('Downloading..')
        : Text('Download waiting');
  }

// Widget buttons(DownloadTaskStatus _status, String taskid, int index) {
//   void changeTaskID(String taskid, String newTaskID) {
//     Map task = downloadsListMaps.firstWhere(
//           (element) => element['taskId'] == taskid,
//
//     );
//     task['taskId'] = newTaskID;
//     setState(() {});
//   }
//
//   return _status == DownloadTaskStatus.canceled
//       ? GestureDetector(
//     child: Icon(Icons.cached, size: 20, color: Colors.green),
//     onTap: () {
//       FlutterDownloader.retry(taskId: taskid).then((newTaskID) {
//         changeTaskID(taskid, newTaskID!);
//       });
//     },
//   )
//       : _status == DownloadTaskStatus.failed
//       ? GestureDetector(
//     child: Icon(Icons.cached, size: 20, color: Colors.green),
//     onTap: () {
//       FlutterDownloader.retry(taskId: taskid).then((newTaskID) {
//         changeTaskID(taskid, newTaskID!);
//       });
//     },
//   )
//       : _status == DownloadTaskStatus.paused
//       ? Row(
//     mainAxisSize: MainAxisSize.min,
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: <Widget>[
//       GestureDetector(
//         child: Icon(Icons.play_arrow,
//             size: 20, color: Colors.blue),
//         onTap: () {
//           FlutterDownloader.resume(taskId: taskid).then(
//                 (newTaskID) => changeTaskID(taskid, newTaskID!),
//           );
//         },
//       ),
//       GestureDetector(
//         child: Icon(Icons.close, size: 20, color: Colors.red),
//         onTap: () {
//           FlutterDownloader.cancel(taskId: taskid);
//         },
//       )
//     ],
//   )
//       : _status == DownloadTaskStatus.running
//       ? Row(
//     mainAxisSize: MainAxisSize.min,
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: <Widget>[
//       GestureDetector(
//         child: Icon(Icons.pause,
//             size: 20, color: Colors.green),
//         onTap: () {
//           FlutterDownloader.pause(taskId: taskid);
//         },
//       ),
//       GestureDetector(
//         child:
//         Icon(Icons.close, size: 20, color: Colors.red),
//         onTap: () {
//           FlutterDownloader.cancel(taskId: taskid);
//         },
//       )
//     ],
//   )
//       : _status == DownloadTaskStatus.complete
//       ? GestureDetector(
//     child:
//     Icon(Icons.delete, size: 20, color: Colors.red),
//     onTap: () {
//       downloadsListMaps.removeAt(index);
//       FlutterDownloader.remove(
//           taskId: taskid, shouldDeleteContent: true);
//       setState(() {});
//     },
//   )
//       : Container();
// }

}
