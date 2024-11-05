import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../core/custom_assets/assets.gen.dart';



class DwonlodedPdfShowPage extends StatefulWidget {
  final String? pdfUrl;
  const DwonlodedPdfShowPage({super.key, this.pdfUrl});

  @override
  State<DwonlodedPdfShowPage> createState() => _DwonlodedPdfShowPageState();
}

class _DwonlodedPdfShowPageState extends State<DwonlodedPdfShowPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: Padding(
              padding: EdgeInsets.all(18),
              child: Assets.icons.backArrow.svg()),
        ),
        title: Text('Pdf View'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: PDF(autoSpacing: false).fromPath(widget.pdfUrl!)
      ),
    );
  }
}
