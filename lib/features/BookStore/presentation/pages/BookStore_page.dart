import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/common/widgets/empty/empty_widget.dart';
import '../../../../core/common/widgets/text field/search_bar.dart';
import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../../AllCourse/data/models/course/Course.dart';
import '../../../Home/presentation/widget/home_slider_component.dart';
import '../../data/models/book/Book.dart';
import '../controller/BookStore_controller.dart';
import '../widget/popular_book_component.dart';

class BookStorePage extends StatelessWidget {
  const BookStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              context.goNamed(Routes.mainPage);
            },
            child: Padding(
                padding: EdgeInsets.all(18),
                child: Assets.icons.backArrow.svg()),
          ),
        title: Text('Book Store'),
     ),
      body:  NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(child: SizedBox(height: 12.h,)),
            SliverToBoxAdapter(child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Search(
                readOnly: true,
                onTap: (){
                  print("object");
                  context.pushNamed(Routes.searchPage,extra: "Product");
                },
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
            ),),
            SliverToBoxAdapter(child: SizedBox(height: 12.h,)),
            SliverToBoxAdapter(
                child: GetBuilder<BookStoreController>(
                  assignId: true,
                  builder: (controller) {
                    return Obx(() {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        color: AppColors.primaryBackground,
                        child:
                        Column(
                          children: [
                            controller.storeBookLoading.value?
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
                            controller.storeBookResponse.value==null&&controller.storeBookLoading.value==false?
                            EmptyWidget():
                            CarouselSlider.builder(
                              //carouselController: _carouselController,
                              itemCount: controller.storeBookResponse.value!.product_sliders!.length,
                              itemBuilder: (BuildContext context,
                                  int itemIndex, int pageIndex) =>
                                  InkWell(
                                    onTap: (){
                                      print(controller.storeBookResponse.value!.product_sliders![itemIndex].parent_model_id!);
                                      print(controller.storeBookResponse.value!.product_sliders![itemIndex].content_type);
                                      if(controller.storeBookResponse.value!.product_sliders![itemIndex].content_type=="course"){
                                        // Navigator.pushNamed(context, COURSE_DETAILS_PAGE,arguments: {
                                        //   "id":controller.sliderResponse.value!.product_sliders![itemIndex].parent_model_id.toString(),
                                        //   "name":"Course Details",
                                        //   "status":"course!.order_status",
                                        // });
                                        context.pushNamed(Routes.detailsCoursePage,extra: Course(id: num.parse(controller.storeBookResponse.value!.product_sliders![itemIndex].parent_model_id.toString())));

                                      }else if(controller.storeBookResponse.value!.product_sliders![itemIndex].content_type=="book"){
                                        // Navigator.pushNamed(context, BOOK_DETAILS_PAGE,arguments: {
                                        //   "id":controller.sliderResponse.value!.product_sliders![itemIndex].parent_model_id!
                                        // });
                                        context.pushNamed(Routes.bookDetailsPage,
                                            extra:Book(id: num.parse(controller.storeBookResponse.value!.product_sliders![itemIndex].parent_model_id!.toString()))
                                        );
                                      }

                                    },
                                    child: CachedNetworkImage(
                                      imageUrl:ApiEndpoint.imageBaseUrl +controller.storeBookResponse.value!.product_sliders![itemIndex].image!,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: 164,
                                            margin: EdgeInsets.only(right: 8),
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
                              enabled: controller.storeBookLoading.value,
                              child: AnimatedSmoothIndicator(
                                activeIndex: controller.sliderIndex.value,
                                count:controller.storeBookResponse.value==null?3: controller.storeBookResponse.value!.product_sliders!.length,
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
                )
            ),

          ];
        },
        body: Container(
          height: 1.0.sh,
          width: 1.0.sw,
          color: AppColors.primaryBackground,
          child: RefreshIndicator(
            onRefresh: ()async{
              Future.delayed(Duration(seconds: 1),(){});
              Get.find<BookStoreController>().getStoreBok();

            },
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: StorePoularBookComponent()
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
