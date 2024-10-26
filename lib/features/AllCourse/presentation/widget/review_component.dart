import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:biddabari_new/features/AllCourse/presentation/controller/AllCourse_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/config/color/app_colors.dart';
import '../../../../core/custom_assets/assets.gen.dart';


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
            "4.2",
            style: boldText(40),
          ),

          // rating star
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
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
                            'Sifat',
                            style: boldText(18),
                          ),

                          const SizedBox(height: 4),

                          // comment
                          Text(
                            'nice course',
                            style: regularText(14,color: Color(0xff545454)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Rating Container
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF4D81E5),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Assets.icons.star.svg(),

                    const SizedBox(width: 4),

                    Text(
                      '12',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
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
              '12 Agu 12:10 Pm',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
          ),

          const SizedBox(height: 25),

          // SEE ALL button
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/review');
            },
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // text see all
                Text(
                  'SEE ALL',
                  style: boldText(14,color: AppColors.primaryColor),
                ),

                // right icon
                Icon(
                  Icons.keyboard_arrow_right,
                  size: 24,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
