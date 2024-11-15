import 'package:biddabari_new/core/common/widgets/empty/empty_widget.dart';
import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/features/ClassRoom/presentation/controller/ClassRoom_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../core/common/widgets/container/discount_badge.dart';
import '../../../../core/common/widgets/shimer component/shimer_list.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../widget/class_room_course.dart';

class ClassRoomMyCourse extends StatelessWidget {
  const ClassRoomMyCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassRoomController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return controller.myClassCourseLoading.value?
          ShimerList()
              :
          controller.courseMyResponse.value==null&&controller.myClassCourseLoading.value==false?EmptyWidget()
              :
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: controller.courseMyResponse.value!.courseOrders!.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return ClassRoomCourse(
                courseOrder: controller.courseMyResponse.value!.courseOrders![index],
              );
            },
          );
        });
      },
    );
  }
}
