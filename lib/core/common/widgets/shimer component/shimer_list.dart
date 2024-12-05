import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../features/AllCourse/data/models/Student/CourseOrder.dart';
import '../../../../features/ClassRoom/presentation/widget/class_room_course.dart';
import '../../../config/color/app_colors.dart';
import '../../../config/util/text_style.dart';
import '../../../custom_assets/assets.gen.dart';

class ShimerList extends StatelessWidget {
  final int? listCount;
  const ShimerList({super.key, this.listCount=10});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: listCount,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
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
                    child:Container(
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
                    )
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
                                "categorynsjsnjns",
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFFF6B00),
                                ),
                              ),

                            ],
                          ),
                          const SizedBox(height: 6),
                          // title
                          Text("djk djhd jhdsjknsjdnjdndjndjndjdnjd d",
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
                                itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
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
          );
        },
      ),
    );
  }
}
