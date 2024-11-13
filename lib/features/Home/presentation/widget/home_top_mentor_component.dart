import 'package:biddabari_new/core/common/data/user/User.dart';
import 'package:biddabari_new/core/common/widgets/empty/empty_widget.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/routes/route_path.dart';
import 'package:biddabari_new/features/Home/presentation/widget/popular_course_card.dart';
import 'package:biddabari_new/features/Teacher/data/models/Teacher/Teacher.dart';
import 'package:biddabari_new/features/Teacher/presentation/controller/Teacher_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/common/widgets/card/teacher_card.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/common/widgets/card/category_card.dart';
import '../../../../core/common/widgets/card/course_card.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeTopMentorComponent extends StatelessWidget {
  const HomeTopMentorComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<TeacherController>().getAllTeacher();
    });
    return GetBuilder<TeacherController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'টপ মেন্টোর ',
                        style: boldText(16, color: Color(0xFF202244))
                    ),

                    InkWell(
                      onTap: (){
                        context.pushNamed(Routes.allTeacherPage);
                      },
                      child: Row(
                        children: [
                          Text(
                              'See All',
                              style: boldText(12, color: Color(0xFF5F61F0))
                          ),
                          SizedBox(width: 12,),
                          Assets.icons.forwordArrow.svg(height: 12)
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 19,),
                controller.teacherCircle.value==false&& controller.teacherResponse.value==null?
                Column(
                  children: [
                    EmptyWidget(),
                    SizedBox(height: 32,),
                  ],
                ):

                Container(
                  height: 250,
                  width: 1.0.sw,
                  child:
                  controller.teacherCircle.value?
                  Skeletonizer(
                    enabled: true,
                    child: ListView.builder(
                      itemCount:10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return TeacherCard(teacher:null);
                      },
                    ),
                  )
                      :
                  ListView.builder(
                    itemCount:controller.teacherList.length +
                        (controller.teacherPagingCirculer.value ? 1 : 0),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return TeacherCard(teacher: controller.teacherList[index],);
                    },
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
