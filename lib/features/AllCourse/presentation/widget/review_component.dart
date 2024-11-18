import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:biddabari_new/features/AllCourse/presentation/controller/AllCourse_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:logger/logger.dart';

import '../../../../core/config/color/app_colors.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/utils/format_date.dart';


class ReviewComponent extends StatelessWidget {
  final AllCourseController? controller;
  const ReviewComponent({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12,),
          // average course rating
          Text(
            "4.5",
            style: boldText(40),
          ),

          // rating star
          RatingBar.builder(
            initialRating: 4.5,
            minRating: 1,
            ignoreGestures: true,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 24,
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

          const SizedBox(height: 25),

          // image, name, rating and comment
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller!.detailsCategoryResponse.value!.reviews!.length,
              itemBuilder: (context,index){
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // image
                          CircleAvatar(
                            child: Text(("${controller!.detailsCategoryResponse.value!.reviews![index].name??"B"}")[0]
                              ,style: boldText(24),),
                            radius:32,
                          ),

                          const SizedBox(width: 10),

                          // name and comment
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                // name
                                Text(
                                  '${controller!.detailsCategoryResponse.value!.reviews![index].name??"Biddabari"}',
                                  style: boldText(18),
                                ),

                                const SizedBox(height: 4),

                                // comment
                                Text(
                                  '${controller!.detailsCategoryResponse.value!.reviews![index].message}',
                                  style: regularText(14,color: Color(0xff545454)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 5),

                // comment time
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    formatDateBydMMMYYYY(controller!.detailsCategoryResponse.value!.reviews![index].created_at!),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            );
          }),



        ],
      ),
    );
  }
}
