import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal:16 ),
      color: AppColors.primaryBackground,
      child: Column(
        children: [
          Search(
            readOnly: true,
            onTap: (){},
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
              child: Assets.icons.filter.svg(),
            ),
          ),
          SizedBox(height:26 ,),
          CarouselSlider.builder (
            //carouselController: _carouselController,
            itemCount: 3,
            itemBuilder: (BuildContext context,
                int itemIndex, int pageIndex) =>
                CachedNetworkImage(
                  imageUrl: ApiEndpoint.imageBaseUrl+"https://via.placeholder.com/138x164",
                  imageBuilder: (context, imageProvider) => Container(
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
                  errorWidget: (context, url, error) =>Container(
                    width: MediaQuery.of(context).size.width,
                    height: 164,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: Assets.images.slider.provider(),
                            fit: BoxFit.fill
                        ),
                        color: const Color(0xfff7ffff),
                        borderRadius: BorderRadius.circular(16)
                    ),
                    alignment: Alignment.center,
                  ),
                ),
            options: CarouselOptions(
              onPageChanged: (index, reason) {

              },
              enableInfiniteScroll: true,
              autoPlay: true,
              viewportFraction: 1,
              height: 200,
              // autoPlay: true,
            ),
          ),
          SizedBox(height:16 ,),
          AnimatedSmoothIndicator(
            activeIndex: 1,
            count:3,
            effect: const WormEffect(
              dotHeight: 12,
              dotWidth: 12,
              activeDotColor: AppColors.primaryColor,
              dotColor: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
