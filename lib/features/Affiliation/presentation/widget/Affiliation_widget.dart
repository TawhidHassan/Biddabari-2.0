import 'package:biddabari_new/core/common/widgets/Appbar/custom_appbar.dart';
import 'package:biddabari_new/core/common/widgets/container/discount_badge.dart';
import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:biddabari_new/features/Affiliation/presentation/controller/Affiliation_controller.dart';
import 'package:biddabari_new/features/AllCourse/data/models/course/Course.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import 'package:flutter/services.dart';

import '../../data/models/Affiliate/AffilitaeResponse.dart';

class AffiliationCourseCard extends StatelessWidget {
  final Course? course;
  final AffilitaeResponse? response;
  const AffiliationCourseCard({super.key, this.course, this.response});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()async{
        if(response!.affiliateRegister!=null){
          Clipboard.setData(ClipboardData(text: ApiEndpoint.baseUrl+"course-details/${course!.title}?rc=${response!.affiliateRegister!.affiliate_code}")).then((value){
            Get.snackbar("Copied", ApiEndpoint.baseUrl+"course-details/${course!.title}?rc=${response!.affiliateRegister!.affiliate_code}",backgroundColor: Colors.green,colorText: Colors.white);
          });
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
              imageUrl:course!.banner!,
              placeholder: (context, url) => Skeletonizer(
                enabled: true,
                child: Container(
                  height: 130.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Assets.images.course.provider(),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5),),
                  ),
                ),
              ),
              errorWidget: (context, url, error){
                return Container(
                  height: 130.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Assets.images.course.provider(),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5),),
                  ),
                );
              },
              imageBuilder: (context, image) =>
                  Container(
                    height: 130.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5),),
                    ),
                  ),
            ),
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8,),
                  Text(course!.title??'',style: boldText(14.sp),maxLines: 2,),
                  SizedBox(height: 6,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DiscountBadge(
                        text: "Copy Link",
                        radius: 6,
                        textSize: 8,
                        backgroundColor:AppColors.primaryColor.withAlpha(12),
                        foregroundColor: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
