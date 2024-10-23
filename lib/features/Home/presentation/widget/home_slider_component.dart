import 'dart:ffi';

import 'package:biddabari_new/features/Home/presentation/controller/Home_controller.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/common/widgets/text field/search_bar.dart';
import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class HomeSliderComponent extends StatelessWidget {
  const HomeSliderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<HomeController>().getSlider();
    });
    return GetBuilder<HomeController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: AppColors.primaryBackground,
            child: Column(
              children: [
                Search(
                  readOnly: true,
                  onTap: () {},
                  suffixIcon: Container(
                    width: 31,
                    height: 31,
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(1.00, -0.02),
                        end: Alignment(-1, 0.02),
                        colors: [Color(0xFFAA076B), Color(0xFF61045F)],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Assets.icons.filter.svg(),
                  ),
                ),
                SizedBox(height: 26,),

                controller.sliderLoading.value||controller.sliderResponse.value==null?
                    LoadingWidget():
                    Column(
                      children: [
                        CarouselSlider.builder(
                          //carouselController: _carouselController,
                          itemCount: controller.sliderResponse.value!.sliderCourses!.length,
                          itemBuilder: (BuildContext context,
                              int itemIndex, int pageIndex) =>
                              CachedNetworkImage(
                                imageUrl:
                                    controller.sliderResponse.value!.sliderCourses![itemIndex].image!,
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
                                placeholder: (context, url) => LoadingWidget(),
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
                        AnimatedSmoothIndicator(
                          activeIndex: controller.sliderIndex.value,
                          count: controller.sliderResponse.value!.sliderCourses!.length,
                          effect: const ExpandingDotsEffect(
                            activeDotColor: AppColors.primaryColor,
                            dotHeight: 8,
                            dotWidth: 8,
                            expansionFactor: 3,
                            spacing: 5,
                          ),
                        ),
                      ],
                    )

              ],
            ),
          );
        });
      },
    );
  }
}
