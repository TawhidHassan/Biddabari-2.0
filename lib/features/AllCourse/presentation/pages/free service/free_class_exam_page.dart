import 'package:biddabari_new/core/common/widgets/Appbar/custom_appbar.dart';
import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:biddabari_new/core/routes/route_path.dart';
import 'package:biddabari_new/features/AllCourse/presentation/controller/AllCourse_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/custom_assets/assets.gen.dart';
import '../../../../../core/utils/system_util.dart';
import '../../widget/free_service_category_card.dart';

class FreeClassExamPage extends StatelessWidget {
  final String? slug;
  const FreeClassExamPage({super.key, this.slug});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<AllCourseController>().getFreeServiceContent(slug);
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
        title: Text('Free Category'),
      ),
      body: GetBuilder<AllCourseController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return
            Skeletonizer(
              enabled: controller.freeLoding.value,
              child: Container(
                height: 1.0.sh,
                width: 1.0.sw,
                padding: EdgeInsets.all(16),
                child: controller.freeServiceContentResponse!.value==null?SizedBox():
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: InkWell(
                          onTap: (){
                            context.pushNamed(Routes.freeVideoPage,extra:controller.freeServiceContentResponse!.value );
                          },
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFF1F7FF),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x266E6D6D),
                                  blurRadius: 24,
                                  offset: Offset(6, 12),
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Assets.images.freeClass.image(),
                                Text("Free Class",style: boldText(14),)
                              ],
                            ),
                          ),
                        )
                    ),
                    SizedBox(width: 12,),
                    Expanded(
                        child: InkWell(
                          onTap: (){
                            context.pushNamed(Routes.freeExamPage,extra:controller.freeServiceContentResponse!.value );
                          },
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFF1F7FF),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x266E6D6D),
                                  blurRadius: 24,
                                  offset: Offset(6, 12),
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Assets.images.freeExam.image(),
                                Text("Free Exam",style: boldText(14),)
                              ],
                            ),
                          ),
                        )
                    ),
                  ],
                )
              ),
            );
          });
        },
      ),
    );
  }
}
