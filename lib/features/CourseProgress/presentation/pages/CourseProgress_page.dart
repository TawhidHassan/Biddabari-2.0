import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/features/CourseProgress/presentation/controller/CourseProgress_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/config/color/app_colors.dart';
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
              Skeletonizer(
                enabled: true,
                child: ListView.builder(
                  itemCount: 10,
                 itemBuilder: (context, index) {
                   return Container(
                     height: 80,
                     margin: EdgeInsets.only(bottom: 12),
                     padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 12),
                     decoration: ShapeDecoration(
                       color: Color(0xffF1F7FF),
                       shape: RoundedRectangleBorder(
                         side: BorderSide(width: 0.75, color: Color(0xFFB4BDC4)),
                         borderRadius: BorderRadius.circular(6),
                       ),
                       shadows: [
                         BoxShadow(
                           color: Color(0x26A8A4A4),
                           blurRadius: 6,
                           offset: Offset(3, 4),
                           spreadRadius: 2,
                         )
                       ],
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Expanded(
                           flex: 8,
                           child: Row(
                             children: [
                               Container(
                                 height: 50,
                                 width: 50,
                                 padding: EdgeInsets.all(12),
                                 decoration: ShapeDecoration(
                                   shape: RoundedRectangleBorder(
                                     side: BorderSide(width: 0.75, color: Color(0xFFD9D9D9)),
                                     borderRadius: BorderRadius.circular(100),
                                   ),
                                 ),
                               ),
                               SizedBox(width: 12,),
                               Expanded(
                                   child:

                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Text('ccjndjbdjddbjdc',style: boldText(16,),maxLines: 1,),
                                       Text('cdjndjbdhdbhhdbdhbdhdddddd',style: extraBoldText(14,color: Colors.green),maxLines: 1,),
                                     ],
                                   )
                               ),
                             ],
                           ),
                          ),
                         Assets.icons.forwordArrow.svg(color: Colors.grey)
                       ],
                     ),
                   );
                 }
                ),
              )
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
