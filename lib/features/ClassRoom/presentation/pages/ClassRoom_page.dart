import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:biddabari_new/features/ClassRoom/presentation/controller/ClassRoom_controller.dart';
import 'package:biddabari_new/features/Home/presentation/controller/Home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/container/discount_badge.dart';
import '../../../../core/common/widgets/container/horizontal_category.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import 'ajker_class.dart';
import 'ajker_exam.dart';
import 'class_my_course.dart';

class ClassRoomPage extends StatelessWidget {
  const ClassRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<ClassRoomController>().getMyCourse();
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text('Dashboard'),
      ),
      body: GetBuilder<HomeController>(
        assignId: true,
        builder: (homeController) {
          return GetBuilder<ClassRoomController>(
            assignId: true,
            builder: (controller) {
              return Obx(() {
                return Container(
                  height: 1.0.sh,
                  width: 1.0.sw,

                  child: homeController.userName.value == "" ?
                  Container(
                    height: 1.0.sh,
                    width: 1.0.sw,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("You are not Login", style: boldText(
                            14, color: AppColors.textClorColor)),
                        SizedBox(height: 8,),
                        InkWell(
                            onTap: () {
                              context.pushNamed(Routes.loginPage);
                              // Navigator.pushNamedAndRemoveUntil(context, );
                            },
                            child: Text("Click To Login",
                                style: boldText(14, color: Colors.blueAccent))),
                      ],
                    ),
                  ) :
                  CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Center(
                                child: CircleAvatar(
                                  radius: 62.r,
                                  backgroundImage: Assets.images.teacher
                                      .provider(),
                                ),
                              ),

                              const SizedBox(height: 6),
                              // name
                              Text("Sifat", style: boldText(21),),
                              Text("Graphic Designer At Google",
                                style: boldText(13, color: Color(0xFF545454)),),

                              const SizedBox(height: 18),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [

                                    // total course
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '12',
                                          style: boldText(17),
                                        ),
                                        Text(
                                          'Total Course',
                                          style: semiBoldText(
                                              12, color: Color(0xFF545454)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '12',
                                          style: boldText(17),
                                        ),
                                        Text(
                                          'Completed',
                                          style: semiBoldText(
                                              12, color: Color(0xFF545454)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '12',
                                          style: boldText(17),
                                        ),
                                        Text(
                                          'Ongoing',
                                          style: semiBoldText(
                                              12, color: Color(0xFF545454)),
                                        ),
                                      ],
                                    ),


                                    // completed
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Obx(() {
                            return controller.myClassCourseLoading.value ?
                            LoadingWidget()
                                :
                            Column(
                              children: [
                                SizedBox(height: 21,),
                                SizedBox(
                                  height: 42,
                                  width: 1.0.sw,
                                  child: Wrap(
                                    direction: Axis.vertical,
                                    alignment: WrapAlignment.spaceBetween,
                                    runAlignment: WrapAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.onTapTab(0);
                                        },
                                        child: HorizontalCategoryCard(
                                          height: 38,
                                          active: controller.tabIndex.value ==
                                              0,
                                          title: "My Course",),
                                      ), InkWell(
                                        onTap: () {
                                          controller.onTapTab(1);
                                        },
                                        child: HorizontalCategoryCard(
                                          height: 38,
                                          active: controller.tabIndex.value ==
                                              1,
                                          title: "Ajker Class",),
                                      ), InkWell(
                                        onTap: () {
                                          controller.onTapTab(2);
                                        },
                                        child: HorizontalCategoryCard(
                                          height: 38,
                                          active: controller.tabIndex.value ==
                                              2,
                                          title: "Ajker Exam",),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 12,),

                                controller.tabIndex.value == 0 ?
                                ClassRoomMyCourse()
                                    :
                                controller.tabIndex.value == 1 ?
                                ClassRoomAjkerClass()
                                    :
                                ClassRoomAjkerExam(),

                              ],
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                );
              });
            },
          );
        },
      ),
    );
  }
}
