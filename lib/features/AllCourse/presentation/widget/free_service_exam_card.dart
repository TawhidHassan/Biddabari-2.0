import 'package:biddabari_new/core/common/widgets/container/discount_badge.dart';
import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:biddabari_new/features/Home/presentation/controller/Home_controller.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../data/models/CourseCategory/CourseCategoryData.dart';

class FreeServiceExamCard extends StatelessWidget {
  final CourseCategoryData? categoryData;

  const FreeServiceExamCard({super.key, this.categoryData});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      assignId: true,
      builder: (homeController) {
        return InkWell(
          onTap: () {
            if(homeController.userName.value == ""){
              Fluttertoast.showToast(
                  msg: "Please login first",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }else{
            if (categoryData!.category_exam!.is_master_exam == 1) {
              context.pushNamed(Routes.masterExamPage,
                  extra: categoryData!.category_exam!.id.toString());
            } else {
              context.pushNamed(Routes.myExamSectionPage,
                  extra: categoryData!.category_exam!.id.toString());
            }
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
            ),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                CachedNetworkImage(
                  imageUrl: ApiEndpoint.imageBaseUrl +
                      categoryData!.category_exam!.banner!,
                  placeholder: (context, url) => LoadingWidget(),
                  errorWidget: (context, url, error) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Assets.images.course.provider(),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(topRight: Radius
                            .circular(5), topLeft: Radius.circular(5),),
                      ),
                    );
                  },
                  imageBuilder: (context, image) =>
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: image,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(topRight: Radius
                              .circular(5), topLeft: Radius.circular(5),),
                        ),
                      ),
                ),
                SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DiscountBadge(
                        text: "Take this exam",
                        radius: 6,
                        textSize: 8,
                        backgroundColor: Color(0xFF167F71),
                        foregroundColor: Colors.white,
                      ),
                      SizedBox(height: 8,),
                      Text(categoryData!.category_exam!.title ?? '',
                        style: boldText(12), maxLines: 2,),
                      SizedBox(height: 6,),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
