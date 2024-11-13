import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:biddabari_new/features/ClassRoom/presentation/controller/ClassRoom_controller.dart';
import 'package:biddabari_new/features/Home/presentation/controller/Home_controller.dart';
import 'package:biddabari_new/features/profile/presentation/controller/profile_controller.dart';
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
import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import 'ajker_class.dart';
import 'ajker_exam.dart';
import 'class_my_course.dart';
import 'package:flutter/services.dart';

class ClassRoomPage extends StatelessWidget {
  const ClassRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<ClassRoomController>().getMyCourse();
    });
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: AppColors.whiteColor,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
        leading: InkWell(
          onTap: () {
            context.goNamed(Routes.mainPage);
          },
          child: Padding(
              padding: EdgeInsets.all(18),
              child: Assets.icons.backArrow.svg()),
        ),
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
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                              color: Color(0x26A8A4A4),
                              blurRadius: 15,
                              offset: Offset(0, 8),
                              spreadRadius: 0,
                             )
                           ],
                          ),
                          child: Column(
                            children: [
                              Assets.images.authentication.image(height: 200.h,width: 200.w),
                              SizedBox(height: 6,),
                              Text("You are not Login, access your course \nplease login first", style: boldText(
                                  16, color: AppColors.textClorColor),textAlign: TextAlign.center,),
                              SizedBox(height: 8,),
                              InkWell(
                                  onTap: () {
                                    context.pushNamed(Routes.loginPage);
                                    // Navigator.pushNamedAndRemoveUntil(context, );
                                  },
                                  child: Text("Click To Login >",
                                      style: extraBoldText(16, color: Colors.blueAccent))),
                            ],
                          ),
                        )
                      ],
                    ),
                  ) :
                  CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          color: Colors.white,
                          child: GetBuilder<ProfileController>(
                            assignId: true,
                            builder: (profileController) {
                              return Obx(() {
                                return profileController.circuler.value ?
                                LoadingWidget()
                                    :
                                profileController.profileResponse!
                                    .value!
                                    .user==null?SizedBox():
                                Column(
                                  children: [
                                    Center(
                                      child: CircleAvatar(
                                        radius: 62.r,
                                          backgroundImage: NetworkImage(
                                              ApiEndpoint.imageBaseUrl +
                                                  profileController.profileResponse.value!.student!.image.toString())
                                      ),
                                    ),

                                    const SizedBox(height: 6),
                                    // name
                                    Text( profileController.profileResponse!
                                        .value!
                                        .user!.name ?? "", style: boldText(21),),
                                    Text("Graphic Designer At Google",
                                      style: boldText(
                                          13, color: Color(0xFF545454)),),

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
                                                    12,
                                                    color: Color(
                                                        0xFF545454)),
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
                                                    12,
                                                    color: Color(
                                                        0xFF545454)),
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
                                                    12,
                                                    color: Color(
                                                        0xFF545454)),
                                              ),
                                            ],
                                          ),


                                          // completed
                                        ],
                                      ),
                                    ),

                                  ],
                                );
                              });
                            },
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Obx(() {
                            return
                            Column(
                              children: [
                                SizedBox(height: 21,),
                                SizedBox(
                                  height: 42,
                                  width: 1.0.sw,
                                  child: Row(
                                    // direction: Axis.vertical,
                                    // alignment: WrapAlignment.spaceBetween,
                                    // runAlignment: WrapAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            controller.onTapTab(0);
                                          },
                                          child: HorizontalCategoryCard(
                                            height: 38,
                                            active: controller.tabIndex.value ==
                                                0,
                                            title: "My Course",),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            controller.onTapTab(1);
                                          },
                                          child: HorizontalCategoryCard(
                                            height: 38,
                                            active: controller.tabIndex.value ==
                                                1,
                                            title: "Ajker Class",),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            controller.onTapTab(2);
                                          },
                                          child: HorizontalCategoryCard(
                                            textSize: 12.sp,
                                            height: 38,
                                            active: controller.tabIndex.value ==
                                                2,
                                            title: "Ajker Exam",),
                                        ),
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
