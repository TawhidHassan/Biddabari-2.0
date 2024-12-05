import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:biddabari_new/core/routes/route_path.dart';
import 'package:biddabari_new/features/Home/domain/entities/Home.dart';
import 'package:biddabari_new/features/Home/presentation/controller/Home_controller.dart';
import 'package:biddabari_new/features/More/presentation/widget/more_otption_card.dart';
import 'package:biddabari_new/features/profile/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import '../../../../Dependenci Injection/getx Injection/getx_dependenci_injection.dart';
import '../../../../Dependenci Injection/init_dependencies.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/service/hive_service.dart';
import '../../../../main.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

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
        title: Text('Profile '),
      ),
      body: GetBuilder<HomeController>(
        assignId: true,
        builder: (homeController) {
          return Obx(() {
            return Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  SizedBox(height: 12,),
                  GetBuilder<ProfileController>(
                    assignId: true,
                    builder: (profileController) {
                      return Obx(() {
                        return profileController.circuler.value ?
                        LoadingWidget()
                            :
                        homeController.userName.value != ""
                            ?
                        Container(
                          height: 200,
                          width: 1.0.sw,
                          child: Center(
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: AlignmentDirectional.topCenter,
                              children: [

                                Container(
                                  height: 139,
                                  width: 1.0.sw,
                                  padding: EdgeInsets.only(bottom: 12),
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            7)),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x26A8A4A4),
                                        blurRadius: 15,
                                        offset: Offset(0, 8),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: profileController.profileResponse!
                                      .value!
                                      .user==null?SizedBox(): Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        profileController.profileResponse!
                                            .value!
                                            .user!.name ?? "",
                                        style: boldText(21),),
                                      Text(
                                        profileController.profileResponse!
                                            .value!
                                            .user!.mobile ?? '',
                                        style: boldText(
                                            13, color: Color(0xff545454)),),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: -30,
                                  child: profileController.profileResponse!
                                      .value!
                                      .student==null?SizedBox():
                                  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    backgroundImage: NetworkImage(
                                        ApiEndpoint.imageBaseUrl +
                                            profileController
                                                .profileResponse
                                                .value!.student!.image.toString()),
                                    radius: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                            :
                        Container(
                          height: 200,
                          width: 1.0.sw,
                          child: Center(
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: AlignmentDirectional.topCenter,
                              children: [

                                Container(
                                  height: 139,
                                  width: 1.0.sw,
                                  padding: EdgeInsets.only(bottom: 12),
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            7)),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x26A8A4A4),
                                        blurRadius: 15,
                                        offset: Offset(0, 8),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .end,
                                    children: [
                                      Text(
                                        "You Will Find More Menu After",
                                        style: regularText(
                                            13, color: Colors.grey),),
                                      InkWell(
                                        onTap: (){
                                          context.pushNamed(Routes.loginPage);
                                        },
                                        child: Text(
                                          'Login',
                                          style: boldText(
                                              16,
                                              color: AppColors
                                                  .primaryColor),),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: -30,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                    },
                  ),
                  SizedBox(height: 12,),

                  homeController.userName.value == "" ? SizedBox() :
                  MoreOtptionCard(
                    onTap: () {
                      context.pushNamed(Routes.myCoursePage);
                    },
                    title: "My Course",
                    icon: Assets.icons.course.path,
                  ),

                  homeController.userName.value == "" ? SizedBox() :
                  MoreOtptionCard(
                    onTap: (){
                      context.pushNamed(Routes.myExamPage);
                    },
                    title: "My Exam",
                    icon: Assets.icons.exam.path,
                  ),

                  homeController.userName.value == "" ? SizedBox() :
                  MoreOtptionCard(
                    onTap: () {
                      context.pushNamed(Routes.myOrderPage);
                    },
                    title: "My Order",
                    icon: Assets.icons.freeCourse.path,
                  ),

                  homeController.userName.value == "" ? SizedBox() :
                  MoreOtptionCard(
                    onTap: () {
                      context.pushNamed(Routes.myDwonloadsPage);
                    },
                    title: "My Downloads",
                    icon: Assets.icons.review.path,
                  ),

                  homeController.userName.value == "" ? SizedBox() :
                  MoreOtptionCard(
                    onTap: () {
                      context.pushNamed(Routes.myBookPage);
                    },
                    title: "My Book",
                    icon: Assets.icons.book.path,
                  ),


                  homeController.userName.value == "" ? SizedBox() :
                  MoreOtptionCard(
                    onTap: () {
                      context.pushNamed(Routes.forgetPasswordPage,extra: true);
                    },
                    title: "Change Password",
                    icon: Assets.icons.people.path,
                  ),
                  SizedBox(height: 32,),
                  Divider(
                    height: 1,
                    color: Color(0xFFD3D3D3),
                  ),
                  SizedBox(height: 32,),

                  homeController.userName.value == "" ? SizedBox() :
                  MoreOtptionCard(
                    onTap: () {
                      context.pushNamed(Routes.profileEditPage);
                    },
                    title: "Edit Profile",
                    icon: Assets.icons.people.path,
                  ),

                  MoreOtptionCard(
                    onTap: () {
                      context.pushNamed(Routes.noticePage);
                    },
                    title: "Notices",
                    icon: Assets.icons.notice.path,
                  ),




                  homeController.userName.value == "" ? SizedBox() :
                  MoreOtptionCard(
                    onTap: () {
                      context.pushNamed(Routes.favoraiteQuestionPage);
                    },
                    title: "My Favorite Questions",
                    icon: Assets.icons.rankQus.path,
                  ),


                  MoreOtptionCard(
                    onTap: () {
                      context.pushNamed(Routes.jobPage);
                    },
                    title: "Job Circular",
                    icon: Assets.icons.job.path,
                  ),
                  MoreOtptionCard(
                    onTap: () {
                      context.pushNamed(Routes.blogPage);
                    },
                    title: "Blog",
                    icon: Assets.icons.blog.path,
                  ),

                  // homeController.userName.value == "" ? SizedBox() :
                  // MoreOtptionCard(
                  //   onTap: () {
                  //     context.pushNamed(Routes.saveIteamPage);
                  //   },
                  //   title: "Save Item",
                  //   icon: Assets.icons.saveGreenSvg.path,
                  // ),

                  MoreOtptionCard(
                    onTap: () {
                      context.pushNamed(Routes.allTeacherPage);
                    },
                    title: "Teachers",
                    icon: Assets.icons.teacher.path,
                  ),

                  MoreOtptionCard(
                    onTap: () {
                      context.pushNamed(Routes.photoGallaryListPage);
                    },
                    title: "Photo gallary",
                    icon: Assets.icons.photo.path,
                  ),

                  homeController.userName.value == "" ? SizedBox() :
                  MoreOtptionCard(
                    onTap: () {
                      context.pushNamed(Routes.affiliationPage);
                    },
                    title: "My Affiliation",
                    icon: Assets.icons.affiliate.path,
                  ),


                  // homeController.userName.value == "" ? SizedBox() :
                  // MoreOtptionCard(
                  //   onTap: () {
                  //     context.pushNamed(Routes.bookCartPage);
                  //   },
                  //   title: "Book cart",
                  //   icon: Assets.icons.bookCart.path,
                  // ),

                  // MoreOtptionCard(
                  //   title: "Language",
                  //   icon: Assets.icons.language.path,
                  // ),

                  homeController.userName.value == "" ? MoreOtptionCard(
                    onTap: () async {
                      var users = await Hive.openBox('users');
                      users.clear().then((value) {
                        context.goNamed(Routes.loginPage);
                      });
                    },
                    title: "Login",
                    icon: Assets.icons.logout.path,
                  ) :
                  MoreOtptionCard(
                    onTap: () async {
                      var users = await Hive.openBox('users');
                      users.clear().then((value)async {
                        context.goNamed(Routes.loginPage);
                      });
                    },
                    title: "Logout",
                    icon: Assets.icons.logout.path,
                  ),


                ],
              ),
            );
          });
        },
      ),
    );
  }
}
