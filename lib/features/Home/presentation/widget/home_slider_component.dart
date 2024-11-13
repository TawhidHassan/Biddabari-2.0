import 'dart:ffi';

import 'package:biddabari_new/core/common/widgets/Appbar/custom_appbar.dart';
import 'package:biddabari_new/core/common/widgets/empty/empty_widget.dart';
import 'package:biddabari_new/features/BookStore/data/models/book/Book.dart';
import 'package:biddabari_new/features/Home/presentation/controller/Home_controller.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/common/widgets/text field/search_bar.dart';
import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../../AllCourse/data/models/course/Course.dart';

class HomeSliderComponent extends StatelessWidget {
  const HomeSliderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.find<HomeController>().getSlider();
    return GetBuilder<HomeController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: AppColors.primaryBackground,
            child:
            Column(
              children: [
                controller.sliderLoading.value?
                Skeletonizer(
                  enabled: true,
                  child: Container(
                    height: 160,
                    width: 1.0.sw,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: Assets.images.course.provider(),
                          fit: BoxFit.fill
                        ),
                        borderRadius: BorderRadius.circular(16)
                    ),

                  ),
                )
                    :
                controller.sliderResponse.value==null&&controller.sliderLoading.value==false?
                  EmptyWidget():
                 CarouselSlider.builder(
                  //carouselController: _carouselController,
                  itemCount: controller.sliderResponse.value!.sliderCourses!.length,
                  itemBuilder: (BuildContext context,
                      int itemIndex, int pageIndex) =>
                      InkWell(
                        onTap: (){
                          print(controller.sliderResponse.value!.sliderCourses![itemIndex].parent_model_id!);
                          print(controller.sliderResponse.value!.sliderCourses![itemIndex].content_type);
                          if(controller.sliderResponse.value!.sliderCourses![itemIndex].content_type=="course"){
                            // Navigator.pushNamed(context, COURSE_DETAILS_PAGE,arguments: {
                            //   "id":controller.sliderResponse.value!.sliderCourses![itemIndex].parent_model_id.toString(),
                            //   "name":"Course Details",
                            //   "status":"course!.order_status",
                            // });
                            context.pushNamed(Routes.detailsCoursePage,extra: Course(id: num.parse(controller.sliderResponse.value!.sliderCourses![itemIndex].parent_model_id.toString())));

                          }else if(controller.sliderResponse.value!.sliderCourses![itemIndex].content_type=="book"){
                            // Navigator.pushNamed(context, BOOK_DETAILS_PAGE,arguments: {
                            //   "id":controller.sliderResponse.value!.sliderCourses![itemIndex].parent_model_id!
                            // });
                            context.pushNamed(Routes.bookDetailsPage,
                                extra:Book(id: num.parse(controller.sliderResponse.value!.sliderCourses![itemIndex].parent_model_id!.toString()))
                            );
                          }

                          },
                        child: CachedNetworkImage(
                          imageUrl: controller.sliderResponse.value!.sliderCourses![itemIndex].image!,
                          imageBuilder: (context, imageProvider) =>
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 164,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill
                                    ),
                                    color: const Color(0xfff7ffff),
                                    borderRadius: BorderRadius.circular(16)
                                ),
                                alignment: Alignment.center,
                              ),
                          placeholder: (context, url) => Skeletonizer(
                            enabled: true,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 164,
                              decoration: BoxDecoration(
                                // image: DecorationImage(
                                //     image: Assets.images.slider.provider(),
                                //     fit: BoxFit.fill
                                // ),
                                  color: const Color(0xfff7ffff),
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 164,
                                decoration: BoxDecoration(
                                    // image: DecorationImage(
                                    //     image: Assets.images.slider.provider(),
                                    //     fit: BoxFit.fill
                                    // ),
                                    color: const Color(0xfff7ffff),
                                    borderRadius: BorderRadius.circular(16)
                                ),
                                alignment: Alignment.center,
                              ),
                        ),
                      ),
                    options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      controller.sliderIndex.value=index;
                    },
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    viewportFraction: 1,
                    height: 200,
                    // autoPlay: true,
                  ),
                ),
                SizedBox(height: 16,),
                Skeletonizer(
                  enabled: controller.sliderLoading.value,
                  child: AnimatedSmoothIndicator(
                    activeIndex: controller.sliderIndex.value,
                    count:controller.sliderResponse.value==null?3: controller.sliderResponse.value!.sliderCourses!.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primaryColor,
                      dotHeight: 8,
                      dotWidth: 8,
                      expansionFactor: 3,
                      spacing: 5,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
