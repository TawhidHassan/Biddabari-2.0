import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/common/widgets/container/discount_badge.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../AllCourse/data/models/Student/CourseOrder.dart';

class ClassRoomCourse extends StatelessWidget {
  final CourseOrder? courseOrder;
  const ClassRoomCourse({super.key, this.courseOrder});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.courseContentPage,extra: {
          "name":courseOrder!.course!.title!.toString(),
          "id":courseOrder!.course!.id.toString(),
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Card(
          color: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          child: Row(
            children: [
              // image
              Expanded(
                flex: 1,
                child:courseOrder==null?Container(
                  width: 106,
                  height: 121.70,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: Assets.images.course.provider(),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight:  Radius.circular(10),
                    )
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x26A8A4A4),
                        blurRadius: 15,
                        offset: Offset(0, 8),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ):

                CachedNetworkImage(
                    imageUrl:courseOrder?.course==null?"": ApiEndpoint.imageBaseUrl +courseOrder!.course!.banner.toString(),
                    placeholder: (context, url) => Skeletonizer(
                      enabled: true,
                      child: Container(
                        width: 106,
                        height: 121.70,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: Assets.images.course.provider(),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight:  Radius.circular(10),
                          )
                          ),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error){
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Image.asset("assets/images/biddabari-logo.png"),
                      );
                    },
                    imageBuilder: (context, image) =>Container(
                      width: 106,
                      height: 121.70,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: image,
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                          topRight:  Radius.circular(10),
                         )
                        ),
                      ),
                    )),
              ),

              // Other details
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // approved or not


                      // category
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(
                            "category",
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFF6B00),
                            ),
                          ),
                          DiscountBadge(
                            text: 1 == 1
                                ? 'Approved'
                                : 'Not Approved',
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
                      const SizedBox(height: 6),
                      // title
                      Text(courseOrder?.course==null?"":courseOrder?.course!.title??"",
                        maxLines: 2,
                        style: semiBoldText(16),),

                      const SizedBox(height: 6),

                      // rating
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("4.0", style: regularText(
                              11, color: Color(0xFF888C94)),),
                          const SizedBox(width: 8),
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 22,
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
