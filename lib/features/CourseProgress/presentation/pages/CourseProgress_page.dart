import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/features/CourseProgress/presentation/controller/CourseProgress_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../widget/course_content_card.dart';

class CourseProgressPage extends StatelessWidget {
  final String? name, id;

  const CourseProgressPage({super.key, this.name, this.id});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<CourseProgressController>().getCourseContent(id);
    });
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
        title:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Course Content List"),
            Text(name??'',style:semiBoldText(12),),
          ],
        ),
      ),
      body: GetBuilder<CourseProgressController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: controller.circuler.value ?
              LoadingWidget()
                  :
              ListView.builder(
                itemCount: controller.courseContentDetails.value!.course!
                    .course_sections!.length,
                itemBuilder: (context, index) {
                  return CourseContentCard(
                    onTap: (){
                      context.pushNamed(
                          Routes.courseContentListPage,
                          extra: controller.courseContentDetails.value!
                              .course!.course_sections![index]
                      );
                    },
                    title: controller.courseContentDetails.value!
                        .course!.course_sections![index].title??"",
                  );
                },
              ),
            );
          });
        },
      ),
    );
  }
}
