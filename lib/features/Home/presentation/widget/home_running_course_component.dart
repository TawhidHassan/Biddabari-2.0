import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/features/AllCourse/presentation/controller/AllCourse_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/common/widgets/card/category_card.dart';
import '../../../../core/common/widgets/card/course_card.dart';
import '../../../../core/utils/system_util.dart';

class HomeRunningCourseComponent extends StatelessWidget {
  const HomeRunningCourseComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<AllCourseController>().getRuningCourse();
    });
    return GetBuilder<AllCourseController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: controller.runningCourseLoading.value?
            LoadingWidget():
            Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'চলমান কোর্স সমূহ ',
                        style: boldText(16, color: Color(0xFF202244))
                    ),

                    Row(
                      children: [
                        Text(
                            'See All',
                            style: boldText(12, color: Color(0xFF5F61F0))
                        ),
                        SizedBox(width: 12,),
                        Assets.icons.forwordArrow.svg(height: 12)
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 19,),
                controller.runingCourseResponse.value==null?SizedBox():
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                    childAspectRatio: SystemUtil.getChildAspectRatio(context),
                  ),
                  itemCount: controller.runingCourseResponse.value!.courses!.length,
                  itemBuilder: (context, index) {
                    return CourseCard(
                        course:controller.runingCourseResponse.value!.courses![index]
                    );
                  },
                )
              ],
            ),
          );
        });
      },
    );
  }
}
