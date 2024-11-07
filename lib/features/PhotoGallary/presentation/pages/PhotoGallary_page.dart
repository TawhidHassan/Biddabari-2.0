import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/features/PhotoGallary/presentation/controller/PhotoGallary_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';

class PhotoGallaryPage extends StatelessWidget {
  const PhotoGallaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero,(){
      Get.find<PhotoGallaryController>().getPhotos();
    });
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
      title: Text('Photo Gallery List'),
     ),
      body: GetBuilder<PhotoGallaryController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                height: 1.0.sh,
                child:controller.photoCircle.value?LoadingWidget():
                RefreshIndicator(
                  onRefresh: ()async{
                    await Future.delayed(const Duration(seconds: 1));
                    Future.delayed(Duration.zero, () {
                      controller.getPhotos();
                    });
                  },
                  child:
                  GridView.custom(
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      pattern: [
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(2, 1),
                        QuiltedGridTile(1, 1),
                      ],
                    ),
                    childrenDelegate: SliverChildBuilderDelegate(
                      childCount: controller.galleryResponse.value!.galleries!.length,
                          (context, index) => InkWell(
                            onTap: (){
                              context.pushNamed(Routes.photoGallaryDetailsPage,extra:controller.galleryResponse.value!.galleries![index] );
                            },
                            child: Container(
                              padding: EdgeInsets.all(0),
                              margin: EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              child:  CachedNetworkImage(
                                imageUrl:ApiEndpoint.imageBaseUrl+controller.galleryResponse.value!.galleries![index].banner.toString(),
                                placeholder: (context, url) => LoadingWidget(),
                                errorWidget: (context, url, error){
                                  return Image.asset("assets/images/biddabari-logo.png");
                                },
                                imageBuilder: (context, image) =>  Container(
                                  height: 0,
                                  decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4) ),
                                      image: DecorationImage(
                                          image: image,
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                              ),
                            ),
                          ),
                    ),
                  )


                )
            );
          });
        },
      ),
    );
  }

}
