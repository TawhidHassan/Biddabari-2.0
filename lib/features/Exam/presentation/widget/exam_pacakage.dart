import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/config/util/text_style.dart';
import '../../data/models/Exam.dart';
import '../controller/Exam_controller.dart';

class ExamPackageCard extends StatelessWidget {
  final Exam? exam;
  final ExamController? controller;
  final String? image;
  final int? index;
  const ExamPackageCard({Key? key, this.exam, this.image, this.controller, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller!.selectExamPackage(index,exam);
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color:index==controller!.selectedExamIndex.value?AppColors.kPrimaryColorx: Colors.black12),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl:ApiEndpoint.imageBaseUrl+image!,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error){
                return Image.asset("assets/images/biddabari-logo.png");
              },
              imageBuilder: (context, image) =>  Container(
                height: 80,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4) ),
                    image: DecorationImage(
                        image: image,
                        fit: BoxFit.fill
                    )
                ),
              ),
            ),
            SizedBox(height: 6,),
            FittedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  exam!.packageTitle==null?Text(""):
                  Text(exam!.packageTitle!.length>18?exam!.packageTitle!.substring(0,15)+"..":exam!.packageTitle ??"",style: boldText(16),),
                  SizedBox(height: 6,),
                  Text("Duration: "+exam!.packageDurationInDays.toString()+"Days",style: mediumText(12),),
                  SizedBox(height: 4,),
                  Text((exam!.discountAmount!=null||exam!.discountAmount!=""?"Regular Price: ":"Price: ")+exam!.price.toString(),style: mediumText(12),),
                  exam!.discountAmount!=null||exam!.discountAmount!=""?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4,),
                      Text("Discount: "+exam!.discountAmount.toString()+"Tk",style: mediumText(12,),),
                      SizedBox(height: 4,),
                      Text("Current Price: "+(exam!.price-exam!.discountAmount).toString()+"Tk",style: mediumText(12),),
                      SizedBox(height: 4,),
                      Text("Valid Till: "+exam!.discountEndDate!,style: mediumText(12,color:isCurrentTimeValid(
                          exam!.discountStartDate!,exam!.discountEndDate!)?AppColors.textClorColor:Colors.redAccent),),
                    ],
                  ):SizedBox(),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }


  bool isCurrentTimeValid(String startDateStr, String endDateStr) {
    final DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");
    DateTime startDate = dateFormat.parse(startDateStr);
    DateTime endDate = dateFormat.parse(endDateStr);
    DateTime currentTime = DateTime.now();

    return currentTime.isAfter(startDate) && currentTime.isBefore(endDate);
  }
}
