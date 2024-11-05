import 'package:biddabari_new/core/common/widgets/Button/bottom_checkout_section.dart';
import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:biddabari_new/features/AllCourse/data/models/course/Course.dart';
import 'package:biddabari_new/features/AllCourse/presentation/controller/AllCourse_controller.dart';
import 'package:biddabari_new/features/Main/domain/entities/Main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/common/widgets/Button/elevated_button.dart';
import '../../../../core/common/widgets/container/discount_badge.dart';
import '../../../../core/common/widgets/text/expandeable_text.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../../../core/service/discount_calculate.dart';
import '../widget/course_details_idecator.dart';
import '../widget/course_instector.dart';
import '../widget/curriculum_component.dart';
import '../widget/review_component.dart';
import '../widget/routin_component.dart';


class CourseDetailsPage extends StatelessWidget {

  final Course? course;

  const CourseDetailsPage({super.key, this.course});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<AllCourseController>().detailsCourse(course!.id!.toString());
    });
    return GetBuilder<AllCourseController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return Scaffold(
            appBar: AppBar(
              title: Text("Course Details"),
              leading: InkWell(
                onTap: () {
                  context.pop();
                },
                child: Padding(
                    padding: EdgeInsets.all(18),
                    child: Assets.icons.backArrow.svg()),
              ),

            ),
            body: Container(
              height: 1.0.sh,
              width: 1.0.sw,
              child:controller.deatilsCourseLoading.value?LoadingWidget():
              SingleChildScrollView(
                child: Column(
                  children: [
                    // SliverToBoxAdapter(
                    //     child:
                    // ),
                    Stack(
                      fit: StackFit.passthrough,
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        CachedNetworkImage(
                          imageUrl: ApiEndpoint.imageBaseUrl +
                              controller.detailsCategoryResponse.value!.course!.banner.toString(),
                          errorWidget: (context, url, error){
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child:  Container(
                                height: 300,
                                width: 1.0.sw,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: Assets.images.course.provider(),
                                        fit: BoxFit.fill
                                    )
                                ),
                              ),
                            );
                          },
                          placeholder: (context, url) =>
                              LoadingWidget(),
                          imageBuilder: (context, image) =>
                              Container(
                                height: 300,
                                width: 1.0.sw,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: image,
                                        fit: BoxFit.fill
                                    )
                                ),
                              ),
                        ),
                        Positioned(
                          top: 240,
                          child: Stack(
                            fit: StackFit.passthrough,
                            alignment: Alignment.topRight,
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 36,horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12),),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 15,
                                      spreadRadius: 1.5,
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.only(left: 16,right: 16),
                                width: 0.9.sw,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'category',
                                                style: semiBoldText(14,color: AppColors.orange400)
                                              ),
                                              Text('⭐ ${'12'}'),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  controller.detailsCategoryResponse.value!.course!.title??'',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  maxLines: 2,
                                                ),
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child: ShaderMask(
                                                    shaderCallback: (bounds) =>
                                                        const LinearGradient(
                                                          colors: [
                                                            AppColors.primaryColor,
                                                            AppColors.primaryColorDark
                                                          ],
                                                        ).createShader(
                                                          Rect.fromLTWH(
                                                              0.0, 0.0, bounds.width, bounds.height),
                                                        ),
                                                    child: Text(
                                                      controller.detailsCategoryResponse.value!
                                                          .course!.discount_amount!=null?
                                                      '৳ ${(controller.detailsCategoryResponse.value!.course!
                                                          .price! -
                                                          controller.detailsCategoryResponse.value!
                                                              .course!.discount_amount!).toString()}'
                                                          :
                                                      '৳ ${controller.detailsCategoryResponse.value!.course!.price??''}',
                                                      style: boldText(20,color: AppColors.whiteColor),
                                                      textAlign: TextAlign.right,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          const SizedBox(height: 10),

                                          // class, hours and offer
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              // time and hours
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  // video camera icon
                                                  Assets.icons.videoCamera.svg(),

                                                  const SizedBox(width: 5),

                                                  // Number of classes
                                                  Text(
                                                    '${controller.detailsCategoryResponse.value!.course!.total_class} Class',
                                                    style: semiBoldText(14)
                                                  ),

                                                  const SizedBox(width: 5),

                                                  // vertical bar
                                                   Text(
                                                    '|',
                                                    style: semiBoldText(14)
                                                  ),
                                                  const SizedBox(width: 5),


                                                  Assets.icons.clock.svg(),

                                                  const SizedBox(width: 5),

                                                  // Number of hours
                                                  Text(
                                                    '12 Hours',
                                                    style: semiBoldText(14)
                                                  ),
                                                ],
                                              ),

                                              // offer
                                              DiscountBadge(
                                                text: '${calculateDiscountPercentage(controller.detailsCategoryResponse.value!.course!
                                                    .price!.toDouble() , controller.detailsCategoryResponse.value!
                                                        .course!.discount_amount!.toDouble())}% Off',
                                                textSize: 13,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: -30,
                                right: 32,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: AppColors.primaryColor,
                                  child: Icon(Icons.video_collection_outlined,color: Colors.white,),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],

                    ),


                    const SizedBox(height: 140),
                    Container(
                      width: 0.9.sw,
                      padding: EdgeInsets.symmetric(vertical: 12,horizontal: 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12),),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 15,
                            spreadRadius: 1.5,
                            offset: Offset(5, 12)
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ///tab
                          Row(
                            children: [
                              // Curriculum Button
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    controller.isCurriculumSelected.value=true;

                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: controller.isCurriculumSelected.value
                                          ? const LinearGradient(
                                        colors: [
                                          AppColors.primaryColor,
                                          AppColors.primaryColorDark,
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      )
                                          : const LinearGradient(
                                        colors: [
                                          Color(0xFFE8F1FF),
                                          Color(0xFFE8F1FF),
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                      child: Center(
                                        child: Text(
                                          'Curriculum',
                                          style: TextStyle(
                                            color: controller.isCurriculumSelected.value
                                                ? AppColors.whiteColor
                                                : Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // Review Button
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    controller.isCurriculumSelected.value=false;
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: controller.isCurriculumSelected.value==false
                                          ? const LinearGradient(
                                        colors: [
                                          AppColors.primaryColor,
                                          AppColors.primaryColorDark,
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      )
                                          : const LinearGradient(
                                        colors: [
                                          Color(0xFFE8F1FF),
                                          Color(0xFFE8F1FF),
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                      child: Center(
                                        child: Text(
                                          'Review',
                                          style: TextStyle(
                                            color: controller.isCurriculumSelected.value==false
                                                ? AppColors.whiteColor
                                                : Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          controller.isCurriculumSelected.value?
                          CurriculumComponent(controller: controller,):
                          ReviewComponent(controller: controller,)

                        ],
                      ),
                    ),

                    controller.isCurriculumSelected.value?
                    Column(
                      children: [
                        const SizedBox(height: 32),
                        ///2nd details
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                'This course includes:',
                                style: boldText(18),
                              ),
                              const SizedBox(height: 12),
                              CourseDetailsIdecator(
                                  title: "Lifetime access",
                                  value: "",
                                icon: Assets.icons.clock.svg(),
                              ),
                              CourseDetailsIdecator(
                                  title: "30-days money-back guarantee",
                                  value: "",
                                icon: Assets.icons.doller.svg(),
                              ),
                              CourseDetailsIdecator(
                                  title: "Free exercises file & downloadable resources",
                                  value: "",
                                icon: Assets.icons.onlineCourse.svg(),
                              ),
                              CourseDetailsIdecator(
                                  title: "Shareable certificate of completion",
                                  value: "",
                                icon: Assets.icons.cup.svg(),
                              ),
                              CourseDetailsIdecator(
                                  title: "Access on mobile , tablet and TV",
                                  value: "",
                                icon: Assets.icons.tv.svg(),
                              ),
                              CourseDetailsIdecator(
                                  title: "English subtitles",
                                  value: "",
                                icon: Assets.icons.subtitle.svg(color: AppColors.orange400),
                              ),
                              CourseDetailsIdecator(
                                  title: "100% online course",
                                  value: "",
                                icon: Assets.icons.onlineCourse.svg(color: AppColors.orange400),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'Course instructor (${controller.detailsCategoryResponse.value!.course!.teachers!.length})',
                                style: boldText(18),
                              ),
                              const SizedBox(height: 12),
                              ListView.builder(
                                itemCount: controller.detailsCategoryResponse.value!.course!.teachers!.length,
                                shrinkWrap: true,
                                primary: false,
                                itemBuilder: (context, index) {
                                  return CourseInstector(
                                    teacher: controller.detailsCategoryResponse.value!.course!.teachers![index],
                                  );
                                },
                              ),
                              const SizedBox(height: 12),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: DefaultTabController(
                                  length: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        TabBar(
                                          labelStyle: boldText(16),
                                            onTap: (index){
                                             controller.selectDescription.value=index;
                                            },
                                            unselectedLabelStyle: semiBoldText(14,color: Colors.grey),
                                            tabs: [
                                              Tab(
                                                text: "Overview",
                                              ),
                                              Tab(
                                                text: "Routine",
                                              ),
                                            ]
                                        ),
                                       const SizedBox(height: 12),

                                      controller.selectDescription.value==0?
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Description',
                                            style: boldText(18),
                                          ),

                                          Html(
                                            data: controller.detailsCategoryResponse.value!.course!
                                                .description??"",
                                            onLinkTap: (url, _, __) async {
                                              if (await canLaunch(url!)) {
                                                await launch(
                                                  url,
                                                );
                                              }
                                            },
                                          ),

                                          const SizedBox(height: 12),
                                          ///Routin
                                          RoutinComponent(controller: controller,)
                                        ],
                                      ):
                                      ///Routin
                                      RoutinComponent(controller: controller,)

                                    ],
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                      ],
                    ):SizedBox(),

                    const SizedBox(height: 120),

                  ],
                ),
              ),
            ),
            bottomSheet:controller.detailsCategoryResponse.value==null?SizedBox(): BottomCheckoutSection(
              loading: controller.deatilsCourseLoading.value,
              action: (){
                context.pushNamed(Routes.checkOutPage,extra: {
                  "type":"course",
                  "course":controller.detailsCategoryResponse.value!.course!
                });
              },
              dayslLeft: "0",
              offerAvilable: true,
              mainPrice: controller.detailsCategoryResponse.value!.course!.price!.toString(),
              totalPrice:  controller.detailsCategoryResponse.value!
                  .course!.discount_amount!=null?
              (controller.detailsCategoryResponse.value!.course!
                  .price!.toDouble() - controller.detailsCategoryResponse.value!
                  .course!.discount_amount!.toDouble()).toString()
                  :
              controller.detailsCategoryResponse.value!.course!.price!.toString(),
              discountPercent: '${calculateDiscountPercentage(controller.detailsCategoryResponse.value!.course!
                  .price!.toDouble() , controller.detailsCategoryResponse.value!
                  .course!.discount_amount!.toDouble())}',
            )
          );
        });
      },
    );
  }
}
