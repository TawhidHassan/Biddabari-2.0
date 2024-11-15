import 'package:biddabari_new/core/common/widgets/Appbar/custom_appbar.dart';
import 'package:biddabari_new/core/common/widgets/empty/empty_widget.dart';
import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/features/AllCourse/presentation/controller/AllCourse_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/widgets/shimer component/shimer_grid.dart';
import '../../../../../core/custom_assets/assets.gen.dart';
import '../../../../../core/routes/route_path.dart';
import '../../../../../core/utils/system_util.dart';
import '../../widget/free_service_category_card.dart';
import 'package:flutter/services.dart';

class FreeServicePage extends StatelessWidget {
  const FreeServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<AllCourseController>().getFreeService();
    });
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.goNamed(Routes.mainPage);
          },
          child: Padding(
              padding: EdgeInsets.all(18),
              child: Assets.icons.backArrow.svg()),
        ),
        title: Text('Free Service'),
      ),
      body: GetBuilder<AllCourseController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return
            Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: EdgeInsets.all(16),
              child:
              controller.freeLoding.value?ShimerGrid():
              controller.freeServiceResponse!.value==null&&controller.freeLoding.value==false?
              EmptyWidget():
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: SystemUtil.getChildAspectRatio(context)
                ),
                itemCount: controller.freeServiceResponse!.value!.courseCategories!.length,
                itemBuilder: (context, index) {
                  return FreeServiceCategoryCard(
                    categoryData: controller.freeServiceResponse!.value!.courseCategories![index],
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
