import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import '../../../../core/custom_assets/assets.gen.dart';
import '../../data/models/book/Book.dart';

class BookReadMorePage extends StatelessWidget {
  final Book? book;
  const BookReadMorePage({Key? key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger().w(ApiEndpoint.imageBaseUrl+book!.featured_pdf.toString());
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
        title: Text(book!.title??''),
      ),
      body: Container(
        height: 1.0.sh,
        width: 1.0.sw,
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
        child:book!.featured_pdf!=null? Container(
            child: PDF(fitEachPage: true,autoSpacing: false,pageFling: false,).cachedFromUrl(
              ApiEndpoint.imageBaseUrl+book!.featured_pdf!,
              placeholder: (double progress) => Center(child: Text('$progress %')),
              errorWidget: (dynamic error) => Center(child: Text(error.toString())),
            )

        ):SizedBox(),
      ),
    );
  }
}
