import 'package:biddabari_new/core/common/widgets/Appbar/custom_appbar.dart';
import 'package:biddabari_new/core/common/widgets/container/discount_badge.dart';
import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:biddabari_new/features/AllCourse/data/models/course/Course.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';

class AffiliationCourseCard extends StatelessWidget {
  final Course? course;
  const AffiliationCourseCard({super.key, this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
      ),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          CachedNetworkImage(
            imageUrl:course!.banner!,
            placeholder: (context, url) => LoadingWidget(),
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
    );
  }
}