import 'package:biddabari_new/core/common/widgets/Appbar/custom_appbar.dart';
import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../data/models/Exam.dart';

class RankUserTopCard extends StatelessWidget {
  final Exam? exam;
  const RankUserTopCard({super.key, this.exam});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 4,),

            Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: Assets.images.fram.provider(),
                ),
              ),
              child: CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(ApiEndpoint.imageBaseUrl+"${exam!.user==null?"":exam!.user!.profilePhotoPath??""}"),
              ),
            ),
            exam!.user==null? SizedBox()
              :Text(nameLenght(exam!.user!.name,7),
            style: boldText(14,color: AppColors.whiteColor),),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(((exam!.courseSectionContent!.writtenExamDurationInMinutes!=null?
                  exam!.courseSectionContent!.writtenExamDurationInMinutes??0
                      :
                  exam!.courseSectionContent!.examDurationInMinutes??0)-exam!.requiredTime!).toString()
                      +
                      "Min".toString(),style: mediumText(11,color: Colors.white),)
                ],
              ),
              SizedBox(width: 4.w,),
              Row(
                children: [
                  Text(exam!.resultMark.toString()+"/"+(exam!.courseSectionContent!=null?(int.parse(exam!.courseSectionContent!.examTotalQuestions??"0")*exam!.courseSectionContent!.examPerQuestionMark!).toString():"0"),style: boldText(11,color: Colors.white),)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String nameLenght(String? name,int? lenght){
    return name!.length>lenght!?name.substring(0,lenght-1)+"...":name;
  }
}
