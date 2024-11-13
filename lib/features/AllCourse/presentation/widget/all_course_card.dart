import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/routes/route_path.dart';
import 'package:biddabari_new/features/BookStore/data/models/book/Book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/common/widgets/container/discount_badge.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../data/models/CourseCategory/CourseCategoryData.dart';
import '../../data/models/course/Course.dart';



class AllCourseCard extends StatelessWidget {
  final Course? course;
  const AllCourseCard({super.key, this.course});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.detailsCoursePage,extra: course);
      },
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          shadows: [
            BoxShadow(
              color: Color(0x26807C7C),
              blurRadius: 15,
              offset: Offset(12, 12),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // image
            Expanded(
              child: Stack(
                children: [

                  CachedNetworkImage(
                    imageUrl:ApiEndpoint.imageBaseUrl+course!.banner!,
                    placeholder: (context, url) => Skeletonizer(
                      enabled: true,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Assets.images.course.provider(),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error){
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Assets.images.course.provider(),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      );
                    },
                    imageBuilder: (context, image) =>
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: image,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                  ),


                  // best sell tag


                  // offer tag
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                          color: AppColors.whiteColor,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Assets.icons.saveGreenSvg.svg(
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),


            // title
            Padding(
              padding: const EdgeInsets.only(left: 12.0,right: 12,bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course!.title??"",
                    textAlign: TextAlign.justify,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 5),

                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 12,
                    itemPadding: EdgeInsets.symmetric(
                        horizontal: 0.0),
                    itemBuilder: (context, _) =>
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  const SizedBox(height: 5),

                  // price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          course!.discount_amount!=null?
                          Text(
                            '৳ ${course!.price!}',
                            style: TextStyle(
                              color: AppColors.kPrimaryColorx,
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ):SizedBox(),
                          course!.discount_amount!=null?
                          Text(
                            '৳ ${(course!.price!-course!.discount_amount!)}',
                            style: TextStyle(
                              color: AppColors.kPrimaryColorx,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ):
                          Text(
                            '৳ ${course!.price!}',
                            style: TextStyle(
                              color: AppColors.kPrimaryColorx,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          )

                        ],
                      ),

                      DiscountBadge(
                        text: '56% off',
                        backgroundColor: 1 == 1 ? Color(
                            0xFf18C667)
                            .withOpacity(0.14) : Colors.red
                            .withOpacity(0.14),
                        foregroundColor: 1 == 1
                            ? Color(0xFf18C667)
                            : Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
