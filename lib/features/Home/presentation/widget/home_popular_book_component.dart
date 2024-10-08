import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/utils/system_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import 'category_card.dart';
import 'course_card.dart';

class HomePoularBookComponent extends StatelessWidget {
  const HomePoularBookComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'পপুলার বুকস ',
                style:boldText(16,color: Color(0xFF202244))
              ),

              Row(
                children: [
                  Text(
                    'See All',
                    style:boldText(12,color: Color(0xFF5F61F0))
                  ),
                  SizedBox(width: 12,),
                  Assets.icons.forwordArrow.svg(height: 12)
                ],
              ),
            ],
          ),
          SizedBox(height: 19,),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                childAspectRatio: SystemUtil.getChildAspectRatio(context)
            ),
            itemCount:5,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {

                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // image
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: Assets.images.course.provider(),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),

                            // best sell tag
                            if (1==1)
                              Positioned(
                                top: 5,
                                left: 5,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: AppColors.orange400,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child:  Text('Best Sell',style: boldText(12,color: Colors.white),),
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
                                child: Assets.icons.saveGreenSvg.svg(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      // category
                      Text(
                        'category',
                        style: const TextStyle(
                          color: AppColors.orange400,
                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(height: 5),

                      // title
                      Text(
                        'title',
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
                        'price'+'/-',
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
                            "12",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),

                          const SizedBox(width: 5),

                          // rating star
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 12,
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),

                          const SizedBox(width: 5),

                          // total rating count
                          Text(
                            '(12)',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
