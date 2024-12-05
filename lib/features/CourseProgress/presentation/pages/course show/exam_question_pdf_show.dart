import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import '../../../../../core/config/Strings/api_endpoint.dart';

// class ExamQuestionPdfShow extends StatelessWidget {
//   final String? url;
//   const ExamQuestionPdfShow({super.key, this.url});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Exam Question"),
//       ),
//       body: PDF(autoSpacing: false).cachedFromUrl(
//         ApiEndpoint.imageBaseUrl + url!,
//         placeholder: (double progress) =>
//             Center(child: Text('$progress %')),
//         errorWidget: (dynamic error) =>
//             Center(child: Text(error.toString())),
//       ),
//     );
//   }
// }



import 'dart:io';
import 'dart:isolate';
import 'dart:ui';


import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/LocalDataBase/AddressLocal/AddressLocal.dart';
import '../../../../../core/common/data/video/LoacalVideo.dart';
import '../../../../../core/config/Strings/api_endpoint.dart';
import '../../../../../core/config/util/text_style.dart';
import '../../../../../core/custom_assets/assets.gen.dart';
import '../../../../AllCourse/data/models/courseSectionContent/CourseSectionContent.dart';
import '../../controller/CourseProgress_controller.dart';

class ExamQuestionPdfShow extends StatefulWidget {
  final CourseSectionContent? courseSectionContent;
  final String? url;

  const ExamQuestionPdfShow({Key? key, this.courseSectionContent, this.url}) : super(key: key);

  @override
  State<ExamQuestionPdfShow> createState() => _PdfContentPageState();
}

class _PdfContentPageState extends State<ExamQuestionPdfShow> {


  ReceivePort _port = ReceivePort();
  int progress=0;
  bool dwonloaingStrat=false;
  bool fileExits=false;

  List<LoacalVideo> downloadsListMaps = [];
  List<DownloadTask>? getTasks;

  Future task() async {
    getTasks = await FlutterDownloader.loadTasks();
    Logger().w(getTasks!.length.toString()+"   jsjssjnsjs");

    getTasks!.forEach((_task) {
      Logger().e("message");
      if(_task.filename!.contains(".pdf")){
        downloadsListMaps.add(LoacalVideo(_task.status.index, _task.progress, _task.taskId, _task.filename, _task.savedDir));
        Logger().i("message");
      }
    });
    setState(() {
      String urll=widget.url!;
      Logger().w(urll.split("/")[8]);
      downloadsListMaps.forEach((action){
        Logger().d(action!.filename);
      });
      final result=  downloadsListMaps.where((pdf)=>pdf!.filename==urll.split("/")[8]);
      if(result.isNotEmpty){
        fileExits=true;
        Logger().d(fileExits);
      }else{
        fileExits=false;
        Logger().d(fileExits);
      }
    });

  }

  @override
  void initState() {
    super.initState();
    task();
    Get.find<CourseProgressController>().showToast.value==0;
    Get.find<CourseProgressController>().fetchAddressList();
    Future.delayed(Duration.zero,(){
      Get.find<CourseProgressController>().dwonloadsatart.value = false;
    });

    ///check file exit or not



    IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      // DownloadTaskStatus status = DownloadTaskStatus();
      Future.delayed(Duration(milliseconds: 500),(){


        Logger().w(progress);
        setState((){
          dwonloaingStrat=true;
          progress = data[2];
          if(progress==100){
            // Get.find<CourseProgressController>().saveAdress(
            //     widget.courseSectionContent!.title??"",
            //     widget.courseSectionContent!.title!+widget.courseSectionContent!.id.toString()+".pdf",
            //     Get.find<CourseProgressController>().courseContentDetails.value!.course!.title??'');

            Get.find<CourseProgressController>().addAddress(
                AddressLocal(name: widget.courseSectionContent!.title??"",
                    number: widget.courseSectionContent!.title!+widget.courseSectionContent!.id.toString()+".pdf" ,
                    address: Get.find<CourseProgressController>().courseContentDetails.value!.course!.title??'' )
            );

            if(Get.find<CourseProgressController>().showToast.value==0){
              Fluttertoast.showToast(
                  msg: "PDF Downloaded Successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
              Get.find<CourseProgressController>().showToast.value==1;
            }


            dwonloaingStrat=false;
          }
        });
      });

    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @pragma('vm:entry-point')
  static void downloadCallback(String id, int status, int progress) {
    final SendPort? send = IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
                padding: EdgeInsets.all(18),
                child: Assets.icons.backArrow.svg())),
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Exam PDF Question"),

          ],
        ),

        actions: [
          // courseSectionContent!.canDownloadPdf!=null&& courseSectionContent!.canDownloadPdf!.toInt()==1?
          Container(
            margin: EdgeInsets.only(right: 24),
            child: InkWell(
                onTap: () async {
                  // final Uri url = Uri.parse(
                  //     courseSectionContent!.pdfLink!=null?
                  //     courseSectionContent!.pdfLink!
                  //         :
                  //     BASE_URL_IMAGE +
                  //     (courseSectionContent!.contentType == "assignment"
                  //         ? courseSectionContent!.assignmentQuestion ?? ""
                  //         : courseSectionContent!.pdfFile ?? ""));
                  // if (!await launchUrl(url)) {
                  // throw Exception('Could not launch ');
                  // }


                  if(fileExits){
                    Get.snackbar("Already downloaded", "Check download list",backgroundColor: Colors.green,colorText: Colors.white);
                  }else
                  if(progress!=100){
                    savePdfFile(widget.courseSectionContent!.title!+widget.courseSectionContent!.id.toString(),
                        widget.url!);
                  }else{
                    Get.snackbar("Already downloaded", "Check download list",backgroundColor: Colors.green,colorText: Colors.white);
                  }

                },
                child:Assets.icons.dwonload2.svg()),
          )
          // :SizedBox()
        ],
      ),
      body: Container(
        height: 1.0.sh,
        width: 1.0.sw,
        // padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: GetBuilder<CourseProgressController>(
          assignId: true,
          builder: (controller) {
            return Obx(() {
              return  Container(
                  child:controller.dwonloadsatart.value||dwonloaingStrat?
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Progress: ${progress}",style: boldText(16,color: AppColors.primaryColor),),
                        Text("Wait until your pdf download completed"),
                      ],
                    ),
                  ):
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Container(
                          width: 1.0.sw,
                          height: 80,
                          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)),
                              border: Border.all(color: AppColors.primarySlate300)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pdf",style: boldText(14),),
                              Text(widget.courseSectionContent!.title??'',style: boldText(11,color: AppColors.primaryColor),),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 1.0.sw,
                            height: 1.0.sh,
                            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12)),

                            ),
                            child: PDF(autoSpacing: false).cachedFromUrl(
                              widget.url!,
                              placeholder: (double progress) =>
                                  Center(child: Text('$progress %')),
                              errorWidget: (dynamic error) =>
                                  Center(child: Text(error.toString())),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )

              );
            });
          },
        ),
      ),
    );
  }

  Future savePdfFile(String fileName, String url) async {
    try {
      final externalDir = await getExternalStorageDirectory();

      final downlodFileTask = await FlutterDownloader.enqueue(
        url: url,
        headers: {
          HttpHeaders.connectionHeader: 'keep-alive',
        },
        fileName: fileName+".pdf",
        savedDir:externalDir!.path,
        showNotification: true, // show download progress in status bar
        openFileFromNotification: true,
      );

    } catch (e) {
      throw Exception('Error saving PDF file: $e');
    }
  }
}
