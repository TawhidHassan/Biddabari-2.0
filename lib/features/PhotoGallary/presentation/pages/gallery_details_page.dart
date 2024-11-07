
import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/features/PhotoGallary/presentation/controller/PhotoGallary_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common/widgets/Image/full_image.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../data/models/Gallary/Gallary.dart';

class GallaryDetailsPage extends StatelessWidget {
  final Gallary? gallary;
  const GallaryDetailsPage({Key? key, this.gallary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<PhotoGallaryController>().getGalleryDetails(gallary!.id);
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
        title: Text(gallary!.title??""),
      ),
      body: GetBuilder<PhotoGallaryController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
                height: 1.0.sh,
                child:controller.photoCircle.value?LoadingWidget():
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
                    childCount: controller.galleryDetailsResponse.value!.gallery!.gallery_images!.length,
                        (context, index) => InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ImageFullScreen(image:ApiEndpoint.imageBaseUrl+controller.galleryDetailsResponse.value!.gallery!.gallery_images![index].imageUrl!)),
                        );
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
                          imageUrl:ApiEndpoint.imageBaseUrl+controller.galleryDetailsResponse.value!.gallery!.gallery_images![index].imageUrl!,
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


            );
          });
        },
      ),
    );
  }
}
