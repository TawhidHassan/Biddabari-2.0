import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/features/Home/presentation/controller/Home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/config/util/text_style.dart';
import 'category_card.dart';

class HomeCategoryComponent extends StatelessWidget {
  const HomeCategoryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<HomeController>().getcatgeoryList();
    });
    return GetBuilder<HomeController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: controller.categoryLoading.value?
            LoadingWidget()
                :
            Column(
              children: [
                SizedBox(height: 26,),
                controller.categoryResponse.value==null?SizedBox():
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      childAspectRatio: 4 / 4
                  ),
                  itemCount: controller.categoryResponse.value!.courseCategories!.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                        image: controller.categoryResponse.value!.courseCategories![index].image??"",
                        name:controller.categoryResponse.value!.courseCategories![index].name,
                        total: "12",
                        id: controller.categoryResponse.value!.courseCategories![index].id,
                        slug: controller.categoryResponse.value!.courseCategories![index].slug
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
