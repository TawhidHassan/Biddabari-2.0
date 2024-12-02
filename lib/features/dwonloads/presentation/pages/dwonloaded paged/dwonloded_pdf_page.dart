import 'dart:io';

import 'package:biddabari_new/features/dwonloads/presentation/controller/dwonloads_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../core/common/data/video/LoacalVideo.dart';
import '../../../../../core/common/widgets/empty/empty_widget.dart';
import '../../widget/pdf_dwonload_card.dart';


class DwonlodedPdfPage extends StatefulWidget {
  const DwonlodedPdfPage({super.key});

  @override
  State<DwonlodedPdfPage> createState() => _DwonlodedPdfPageState();
}

class _DwonlodedPdfPageState extends State<DwonlodedPdfPage> {


  List<LoacalVideo> downloadsListMaps = [];
  File? file;
  Directory? externalDir;
  List<DownloadTask>? getTasks;
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero,(){
      Get.find<DwonloadsController>().fetchAddressList();
    });
    task();

    super.initState();
  }

  Future task() async {
    externalDir = await getExternalStorageDirectory();
    getTasks = await FlutterDownloader.loadTasks();
    Logger().w(getTasks!.length);
    getTasks!.forEach((_task) {
      if(_task.filename!.contains(".pdf")){
        downloadsListMaps.add(LoacalVideo(_task.status.index, _task.progress, _task.taskId, _task.filename, _task.savedDir));
      }
    });
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: downloadsListMaps.isEmpty?
      Column(
        children: [
          SizedBox(height: 200,),
          Center(child: EmptyWidget(title: "There has no downloaded PDF" ,)),
        ],
      ):
      ListView.builder(
          itemCount: downloadsListMaps.length,
          itemBuilder: (context,index){
            file=File(externalDir!.path+"/"+downloadsListMaps[index].filename!);
            return PdfDwonloadCard(
              index: index,
              filename:downloadsListMaps[index].filename ,
              path: file!.path,
              onDelete: (){
                print(downloadsListMaps[index].filename);
                _showMyDialog(index);
              },
            );
          }),
    );
  }

  Future<void> _showMyDialog(int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Video'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Do you want to delete this video.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
                // Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Sure'),
              onPressed: () {
                FlutterDownloader.remove(taskId: getTasks![index!].taskId, shouldDeleteContent: true);
                getTasks!.removeAt(index!);
                Logger().w( getTasks!.length);
                task();

                setState(() {
                  downloadsListMaps.removeAt(index);
                });

                Navigator.pop(context);
                Navigator.pop(context);


              },
            ),
          ],
        );
      },
    );
  }
}
