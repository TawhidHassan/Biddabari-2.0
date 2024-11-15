import 'package:biddabari_new/core/common/widgets/container/discount_badge.dart';
import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:biddabari_new/features/AllCourse/data/models/course/Course.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../data/models/CourseCategory/CourseCategoryData.dart';

class FreeVideoCard extends StatelessWidget {
  final CourseCategoryData? course;
  const FreeVideoCard({super.key, this.course});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.pushNamed(Routes.freeCourseVideoPage,extra: course);
       },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0x266E6D6D),
              blurRadius: 24,
              offset: Offset(6, 12),
              spreadRadius: 2,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: CachedNetworkImage(
                imageUrl:ApiEndpoint.imageBaseUrl+course!.thumbnail!,
                placeholder: (context, url) => Skeletonizer(
                  enabled: true,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    padding: EdgeInsets.all(50),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Assets.images.course.provider(),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5),),

                    ),
                    child: Assets.icons.play.svg(),
                  ),
                ),
                errorWidget: (context, url, error){
                  return Container(
                    height: 100,
                    width: double.infinity,
                    padding: EdgeInsets.all(50),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Assets.images.course.provider(),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5),),
                    ),
                    child: Assets.icons.play.svg(),
                  );
                },
                imageBuilder: (context, image) =>
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(50),
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: image,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5),),
                      ),
                      child: Assets.icons.play.svg(),
                    ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DiscountBadge(
                            text: "Most Recent",
                            radius: 6,
                          textSize: 8,
                          backgroundColor: Color(0xFF167F71),
                          foregroundColor: Colors.white,
                        ),
                        SizedBox(height: 8,),
                        Text(course!.category_video!.title??'',style: boldText(12),maxLines: 2,),
                      ],
                    ),
                  ),
                  SizedBox(height: 12,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
