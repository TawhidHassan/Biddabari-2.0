import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/features/Notice/presentation/controller/Notice_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/custom_assets/assets.gen.dart';
import '../widget/notice_card.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<NoticeController>().getNotice();
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
        title: Text('Notices'),
      ),
      body: GetBuilder<NoticeController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return controller.noticeLoading.value?LoadingWidget():
            Container(
              height: 1.0.sw,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: controller.noticeResponse!.value!.notices!.length,
                  itemBuilder: (context,index){
                return NoticeCard(
                  notice: controller.noticeResponse!.value!.notices![index],
                );
              })
            );
          });
        },
      ),
    );
  }
}
