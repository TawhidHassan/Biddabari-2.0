import 'package:biddabari_new/core/common/widgets/Appbar/custom_appbar.dart';
import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/features/Exam/presentation/controller/Exam_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/common/widgets/Button/bottom_checkout_section.dart';
import '../../../../core/common/widgets/container/discount_badge.dart';
import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../../../core/service/discount_calculate.dart';
import '../../../AllCourse/presentation/widget/course_details_idecator.dart';
import '../../../AllCourse/presentation/widget/review_component.dart';
import '../widget/exam_pacakage.dart';

class ExamDetailsPage extends StatelessWidget {
  final int? id;
  final String? enrolle;

  const ExamDetailsPage({super.key, this.id, this.enrolle = "false"});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<ExamController>().getExamDetails(id!);
    });
    return GetBuilder<ExamController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return Scaffold(
            appBar: AppBar(
              title: Text("Batch Exam Details"),
              leading: InkWell(
                onTap: () {
                  context.pop();
                },
                child: Padding(
                    padding: EdgeInsets.all(18),
                    child: Assets.icons.backArrow.svg()),
              ),
            ),
            body: controller.examLoading.value ?
            LoadingWidget()
                :
            Container(
              height: 1.0.sh,
              width: 1.0.sw,
              child: SingleChildScrollView(
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
                              controller.examDetailsResponse.value!.exam!.banner.toString(),
                          errorWidget: (context, url, error){
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Image.asset("assets/images/biddabari-logo.png"),
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
                          top: 250,
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
                                          // Row(
                                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //   children: [
                                          //     Text(
                                          //         'category',
                                          //         style: semiBoldText(14,color: AppColors.orange400)
                                          //     ),
                                          //     Text('⭐ ${'12'}'),
                                          //   ],
                                          // ),
                                          const SizedBox(height: 10),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  controller.examDetailsResponse.value!.exam!.title??'',
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
                                                      '৳ ${controller.packageSelected.value!=null?controller.packageSelected.value!
                                                          .discountAmount!=null?
                                                      (controller.packageSelected.value!
                                                          .price!.toDouble() - controller.packageSelected.value!
                                                          .discountAmount!.toDouble()).toString():"":""}',
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
                                                  Assets.icons.exam2.svg(color: AppColors.orange400),

                                                  const SizedBox(width: 5),

                                                  // Number of classes
                                                  Text(
                                                      '${controller.examDetailsResponse.value!.exam!.packageDurationInDays??"0"} Day',
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
                                                      '${(controller.examDetailsResponse.value!.exam!.packageDurationInDays??0)*24} Hours',
                                                      style: semiBoldText(14)
                                                  ),
                                                ],
                                              ),

                                              // offer
                                              DiscountBadge(
                                                text: '${controller.packageSelected.value==null?0.0:(calculateDiscountPercentage(controller.packageSelected.value!
                                                  .price!.toDouble() , controller.packageSelected.value!
                                                  .discountAmount!.toDouble()))}% Off',
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
                            ],
                          ),
                        ),

                      ],

                    ),


                    const SizedBox(height: 100),
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
                                          'Packages',
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 24),
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

                              ],
                            ),
                          ):
                          Column(
                            children: [
                              SizedBox(height: 8,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 16,
                                              width: 5,
                                              color: AppColors.kPrimaryColorx,
                                            ),
                                            SizedBox(width: 6,),
                                            Text("Select Packages", style: semiBoldText(16,),)
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4,),
                                    GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 12.0,
                                        mainAxisSpacing: 12.0,
                                        childAspectRatio: 5.5 / 8,
                                      ),
                                      itemCount: controller.examDetailsResponse.value!
                                          .exam!.batchExamSubscriptions!.length,
                                      itemBuilder: (context, indexx) {
                                        return ExamPackageCard(
                                          index: indexx,
                                          controller: controller,
                                          image: controller.examDetailsResponse.value!
                                              .exam!.banner ?? "",
                                          exam: controller.examDetailsResponse.value!
                                              .exam!.batchExamSubscriptions![indexx],
                                        );
                                      },
                                    ),
                                    SizedBox(height: 65,),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    controller.isCurriculumSelected.value?
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 0),
                          ///2nd details
                          Html(
                            data: controller.examDetailsResponse.value!
                                .exam!.description!,
                            onLinkTap: (url, _, __) async {
                              if (await canLaunch(url!)) {
                                await launch(
                                  url,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ):SizedBox(),


                    const SizedBox(height: 120),

                  ],
                ),
              ),
            ),

              bottomSheet:controller.packageSelected.value==null?
              BottomCheckoutSection(
                buttonText: "Select Package",
                dayslLeft: "0",
                totalPrice: "0.0",
                mainPrice: "0.0",
                discountPercent: "0.0",
                loading: controller.examLoading.value,
                action: (){
                  // context.pushNamed(Routes.checkOutPage);
                },

              )
                  :
              BottomCheckoutSection(
                dayslLeft: controller.packageSelected.value!.discountEndDate!,
                offerAvilable: true,
                mainPrice: controller.packageSelected.value!.price!.toString(),
                totalPrice:  controller.packageSelected.value!
                    .discountAmount!=null?
                (controller.packageSelected.value!
                    .price!.toDouble() - controller.packageSelected.value!
                    .discountAmount!.toDouble()).toString()
                    :
                controller.packageSelected.value!.price!.toString(),
                discountPercent: '${calculateDiscountPercentage(controller.packageSelected.value!
                    .price!.toDouble() , controller.packageSelected.value!
                    .discountAmount!.toDouble())}',
                loading: controller.examLoading.value,
                action: (){
                  context.pushNamed(Routes.checkOutPage,extra: {
                    "type":"exam",
                    "course":null,
                    "exam":controller.packageSelected.value!,
                    "parentExam":controller.examDetailsResponse.value!.exam!
                  });
                },
              )


          );
        });
      },
    );
  }
}
