import 'package:biddabari_new/core/common/widgets/empty/empty_widget.dart';
import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/utils/system_util.dart';
import 'package:biddabari_new/features/BookStore/presentation/controller/BookStore_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/card/book_card.dart';
import '../../../../core/common/widgets/shimer component/shimer_grid.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/common/widgets/card/category_card.dart';
import '../../../../core/common/widgets/card/course_card.dart';

class StorePoularBookComponent extends StatelessWidget {
  const StorePoularBookComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<BookStoreController>().getStoreBok();
    });
    return GetBuilder<BookStoreController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child:
            Column(
              children: [
                controller.storeBookLoading.value?
                ShimerGrid():
                controller.storeBookResponse.value==null&&controller.storeBookLoading.value==false?
                EmptyWidget():
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      childAspectRatio: SystemUtil.getChildAspectRatio(context)
                  ),
                  itemCount: controller.storeBookResponse.value!.products!.length,
                  itemBuilder: (context, index) {
                    return BookCard(
                      book: controller.storeBookResponse.value!.products![index],
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
