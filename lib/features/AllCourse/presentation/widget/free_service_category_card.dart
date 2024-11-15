import 'package:biddabari_new/core/common/widgets/container/discount_badge.dart';
import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../data/models/CourseCategory/CourseCategoryData.dart';

class FreeServiceCategoryCard extends StatelessWidget {
  final CourseCategoryData? categoryData;
  const FreeServiceCategoryCard({super.key, this.categoryData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.pushNamed(Routes.freeCourseContentPage,extra: categoryData!.slug);
       },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0x26A8A4A4),
              blurRadius: 12,
              offset: Offset(0, 12),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl:ApiEndpoint.imageBaseUrl+categoryData!.second_image.toString(),
                placeholder: (context, url) => Skeletonizer(
                  enabled: true,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Assets.images.course.provider(),
                        fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5),),
                    ),
                  ),
                ),
                errorWidget: (context, url, error){
                  return Container(
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Assets.images.biddabariLogo.provider(), fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5),),
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
                        borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5),),
                      ),
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
                      text: "Most Recent",
                      radius: 6,
                    textSize: 8,
                    backgroundColor: Color(0xFF167F71),
                    foregroundColor: Colors.white,
                  ),
                  SizedBox(height: 8,),
                  Text(categoryData!.name??'',style: boldText(12),maxLines: 2,),
                  SizedBox(height: 6,),
                  Text("প্রতিযোগিতামূলক এই জব-মার্কেটে নিজের ক্যারিয়ারকে",style: mediumText(8,color: Color(0xFF777777)),maxLines: 2,)
                ],
              ),
            ),
            SizedBox(height: 6,),
          ],
        ),
      ),
    );
  }
}
