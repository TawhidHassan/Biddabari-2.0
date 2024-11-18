import 'package:biddabari_new/core/common/widgets/Button/bottom_checkout_section.dart';
import 'package:biddabari_new/core/common/widgets/empty/empty_widget.dart';
import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/common/widgets/shimer%20component/shimer_grid.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/routes/route_path.dart';
import 'package:biddabari_new/core/utils/system_util.dart';
import 'package:biddabari_new/features/BookStore/presentation/controller/BookStore_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/common/widgets/card/book_card.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/common/widgets/card/category_card.dart';
import '../../../../core/common/widgets/card/course_card.dart';

class HomePoularBookComponent extends StatelessWidget {
  const HomePoularBookComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<BookStoreController>().getPopularBok();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'পপুলার বুকস ',
                        style: boldText(16, color: Color(0xFF202244))
                    ),

                    InkWell(
                      onTap: (){
                        context.goNamed(Routes.bookStorePage);
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
                controller.topBookResponse.value==null&&controller.topBookLoading.value?
                ShimerGrid():
                controller.topBookResponse.value==null?
                Column(
                  children: [
                    EmptyWidget(),
                    SizedBox(height: 80,),
                  ],
                ):
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      childAspectRatio: SystemUtil.getChildAspectRatio(context)
                  ),
                  itemCount: controller.topBookResponse.value!.products!.length,
                  itemBuilder: (context, index) {
                    return BookCard(
                      book: controller.topBookResponse.value!.products![index],
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
