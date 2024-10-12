import 'dart:async';

import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/features/Teacher/presentation/controller/Teacher_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/card/teacher_list_card.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class AllTeacherPage extends StatelessWidget {
  const AllTeacherPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: Text('Top Mentors'),
      ),
      body: GetBuilder<TeacherController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return controller.teacherCircle.value?LoadingWidget():
            Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                  controller: controller.controllerTeacher,
                  itemCount: controller.teacherList.length +
                      (controller.teacherPagingCirculer.value ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < controller.teacherList.length) {
                      return TeacherListCard(
                        teacher: controller.teacherList[index],
                      );
                    }else{
                      Timer(const Duration(milliseconds: 30), () {
                        controller.controllerTeacher
                            .jumpTo(controller.controllerTeacher.position
                            .maxScrollExtent);
                      });
                      return const Center(
                        child: CircularProgressIndicator(),);
                    }
                  }
              ),
            );
          });
        },
      ),
    );
  }
}
