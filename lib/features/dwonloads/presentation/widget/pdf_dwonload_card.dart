import 'dart:io';

import 'package:biddabari_new/core/common/widgets/Button/bottom_checkout_section.dart';
import 'package:biddabari_new/features/BookStore/presentation/controller/BookStore_controller.dart';
import 'package:biddabari_new/features/dwonloads/presentation/controller/dwonloads_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_downloader/src/models.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/LocalDataBase/AddressLocal/AddressLocal.dart';
import '../../../../core/routes/route_path.dart';


class PdfDwonloadCard extends StatefulWidget {
  final String? path;
  final String? filename;
  final int?index;
  final VoidCallback ? onDelete;

  const PdfDwonloadCard(
      {super.key, this.path, this.filename, this.index, this.onDelete});

  @override
  State<PdfDwonloadCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<PdfDwonloadCard> {

  AddressLocal? pdfLocal;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {

              context.pushNamed(Routes.dwonloadedPdfShowPage,extra: {
                "pdfUrl":widget.path
              });
            },
            child: ListTile(
                isThreeLine: false,
                title: Container(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Expanded(child: Text(widget.filename ?? "")),
                      InkWell(
                        onTap: widget.onDelete!,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.delete, color: Colors.redAccent,),
                            ]
                        ),
                      ),
                    ],
                  ),
                ),
                // Text(widget.filename??""),
                subtitle: GetBuilder<DwonloadsController>(
                  assignId: true,
                  builder: (controller) {
                    return Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.addressList!.where((test) =>
                          test.number == widget.filename!).toList()[0]
                              .address ??
                              ""),
                          Text(controller.addressList!.where((test) =>
                          test.number == widget.filename!).toList()[0].name ??
                              ""),
                          Text("PDF"),
                        ],
                      );
                    });
                  },
                )

            ),
          ),

          SizedBox(height: 10)
        ],
      ),
    );
  }

}
