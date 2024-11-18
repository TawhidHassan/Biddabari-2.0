import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/routes/route_path.dart';
import 'package:biddabari_new/features/BookStore/data/models/book/Book.dart';
import 'package:biddabari_new/features/Exam/data/models/Exam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../config/color/app_colors.dart';
import '../../../config/util/text_style.dart';
import '../../../custom_assets/assets.gen.dart';
import '../loading/loading_widget.dart';

class ExamCard extends StatelessWidget {
  final Exam? exam;
  const ExamCard({super.key, this.exam});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.examDetailsPage,extra:{
          "id":exam!.id,
          "enrolle":"false"
          }
        );
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0x266E6D6D),
              blurRadius: 24,
              offset: Offset(1, 12),
              spreadRadius: 2,
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
                    imageUrl:ApiEndpoint.imageBaseUrl+exam!.banner!,
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
                  if (1 == 1)
                    Positioned(
                      top: 5,
                      left: 5,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.orange400,
                          borderRadius: BorderRadius.circular(
                              3),
                        ),
                        child: Text(
                          'Best Sell', style: boldText(
                            12, color: Colors.white),),
                      ),
                    ),

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

            // category
            // Text(
            //   'category',
            //   style: const TextStyle(
            //     color: AppColors.orange400,
            //     fontSize: 12,
            //   ),
            // ),

            const SizedBox(height: 5),

            // title
            Text(
              exam!.title??"",
              textAlign: TextAlign.justify,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 5),

            // price
            Text(
              'price' + '/-${exam!.price}',
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),

            // rating bar
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // rating
                Text(
                  "4.7",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(width: 5),

                // rating star
                RatingBar.builder(
                  initialRating: 4.5,
                  minRating: 1,
                  ignoreGestures: true,
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

                // const SizedBox(width: 5),
                //
                // // total rating count
                // Text(
                //   '(12)',
                //   style: const TextStyle(
                //     fontSize: 12,
                //     color: Colors.black54,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
