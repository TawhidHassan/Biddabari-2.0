import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/features/BookStore/data/models/book/Book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/color/app_colors.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../Home/presentation/widget/home_slider_component.dart';
import '../controller/BookStore_controller.dart';
import '../widget/my_book_card.dart';
import '../widget/popular_book_component.dart';

class MyBookPage extends StatelessWidget {
  const MyBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<BookStoreController>().getMyBook();
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
        title: Text('My Bok'),
      ),
      body: GetBuilder<BookStoreController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return controller.myBookLoading.value?LoadingWidget():
            NestedScrollView(
              headerSliverBuilder: (BuildContext context,
                  bool innerBoxIsScrolled) {
                return [
                ];
              },
              body: Container(
                height: 1.0.sh,
                width: 1.0.sw,
                padding: EdgeInsets.symmetric(horizontal: 16),
                color: AppColors.primaryBackground,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.mybookResponse.value!.products!.length,
                          itemBuilder: (context,index){
                            return MyBookCard(book: controller.mybookResponse.value!.products![index],);
                           }
                        )
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
