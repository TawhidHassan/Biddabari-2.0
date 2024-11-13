import 'dart:async';

import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/common/widgets/shimer%20component/shimer_list.dart';
import 'package:biddabari_new/features/Blog/presentation/controller/Blog_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/custom_assets/assets.gen.dart';
import '../widget/blog_card.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<BlogController>().getBlog();
      Get.find<BlogController>().onInit();
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
        title: Text('Blogs'),
      ),
      body: GetBuilder<BlogController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return controller.blogCircle.value?Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ShimerList(),
            ):
            Container(
              height: 1.0.sw,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                  controller: controller.controller,
                  itemCount: controller.listCopy.length +
                      (controller.blogPagingCirculer.value ? 1 : 0),
                  itemBuilder: (context,index){
                 if (index < controller.listCopy.length) {
                   return BlogCard(
                     blog: controller.listCopy[index],
                   );
                 }else{
                   Timer(const Duration(milliseconds: 30), () {
                     controller.controller
                         .jumpTo(controller.controller.position
                         .maxScrollExtent);
                   });
                   return const Center(
                     child: CircularProgressIndicator(),);
                 }
              }),
            );
          });
        },
      ),
    );
  }
}
