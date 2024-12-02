
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../data/models/Exam.dart';

class RankingCard extends StatelessWidget {
  final Exam? exam;
  final String? index;
  final num? examTime;
  const RankingCard({Key? key, this.exam, this.index,  this.examTime=100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      width: 1.0.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 60,
              width: 60,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Assets.images.fram.provider(),
                ),
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(ApiEndpoint.imageBaseUrl+exam!.user!.profilePhotoPath.toString()),
              ),
            ),
          ),

          SizedBox(width: 12,),
          Expanded(
            flex: 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   exam!.user!=null? Text(nameLenght(exam!.user!.name??"",16),style: boldText(16,),):SizedBox(),
                   Row(
                     children: [
                       Assets.icons.stopWatch.svg(),
                       SizedBox(width: 6,),
                       Text((examTime!-exam!.requiredTime!).toString()+" Min".toString(),style: mediumText(11),)
                     ],
                   ),
                 ],
               ),

               Row(
                 children: [
                   Row(
                     children: [
                       Text("Total Provided Answer: ",style: semiBoldText(12,color: Color(0xFF777777)),),
                       Text(exam!.total_provided_ans.toString(),style: mediumText(11,color: AppColors.kPrimaryColorx),)
                     ],
                   ),
                 ],
               ),
               Row(
                 children: [
                   Text("Right Answer: ",style: semiBoldText(12,color: Color(0xFF777777)),),
                   Text(exam!.total_right_ans.toString(),style: mediumText(11,color:AppColors.kPrimaryColorx),)
                 ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Row(
                     children: [
                       Text("Wrong Answer: ",style: semiBoldText(12,color: Color(0xFF777777)),),
                       Text(exam!.total_wrong_ans.toString(),style: mediumText(11,color: AppColors.kPrimaryColorx),)
                     ],
                   ),

                   Row(
                     children: [
                       Assets.icons.rankQus.svg(),
                       SizedBox(width: 6,),
                       exam!.courseSectionContent!=null? Text(exam!.resultMark.toString()+"/"+(int.parse(exam!.courseSectionContent!.examTotalQuestions??"0")*exam!.courseSectionContent!.examPerQuestionMark!).toString(),style: boldText(11,color: Colors.blueAccent),):SizedBox()
                     ],
                   ),
                 ],
               ),
             ],
                         ),
          ),


        ],
      ),

    );
  }

  String nameLenght(String? name,int? lenght){
    return name!.length>lenght!?name.substring(0,lenght-1)+"...":name;
  }
}
