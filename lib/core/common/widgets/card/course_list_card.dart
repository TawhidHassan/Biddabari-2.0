import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/features/AllCourse/data/models/course/Course.dart';
import 'package:biddabari_new/features/Main/domain/entities/Main.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../config/util/text_style.dart';
import '../../../custom_assets/assets.gen.dart';
import '../../../routes/route_path.dart';

class CourseListCard extends StatelessWidget {
final Course? course;
  const CourseListCard({Key? key, this.course ,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.pushNamed(Routes.detailsCoursePage,extra: course);
      },
      child: Container(
        height: 100,
        margin: EdgeInsets.only(bottom: 6,top: 8),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          shadows: [
            BoxShadow(
              color: Color(0x26A8A4A4),
              blurRadius: 15,
              offset: Offset(0, 8),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl:ApiEndpoint.imageBaseUrl+course!.banner!,
                placeholder: (context, url) => LoadingWidget(),
                errorWidget: (context, url, error){
                  return Container(
                    height: 100,
                    width: 1.0.sw,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4) ),
                        image: DecorationImage(
                            image: Assets.images.course.provider(),
                            fit: BoxFit.fill
                        )
                    )
                  );
                },
                imageBuilder: (context, image) =>
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4) ),
                          image: DecorationImage(
                              image: image,
                              fit: BoxFit.cover
                          )
                      ),
                    )
                ,
              ),
            ),
            SizedBox(height: 8,),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            course!.title??"",
                            style:boldText(14,color: AppColors.textClorColor),
                            textAlign: TextAlign.start,
                            maxLines: 2, // Set a limit for lines
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // SizedBox(width: 12,),
                        // Container(
                        //   width: 24,
                        //   height: 24,
                        //   padding: EdgeInsets.all(6),
                        //   margin: EdgeInsets.only(top:8,right: 8 ),
                        //   decoration: ShapeDecoration(
                        //     shape: OvalBorder(
                        //       side: BorderSide(width: 1, color: Colors.green),
                        //     ),
                        //   ),
                        //   child: Assets.icons.saveGreenSvg.svg(color: Colors.green,height: 12,width: 12),
                        // ),
                      ],
                    ),

                    SizedBox(height: 6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            course!.discount_amount!=null?
                            Text(
                              '৳ ${course!.price!}',
                              style: TextStyle(
                                color: Color(0xFFC71720),
                                fontSize: 8,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ):SizedBox(),
                            course!.discount_amount!=null?
                            Text(
                              '৳ ${(course!.price!-course!.discount_amount!)}',
                              style: TextStyle(
                                color: Color(0xFF191919),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ):
                            Text(
                              '৳ ${course!.price!}',
                              style: TextStyle(
                                color: Color(0xFF191919),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            )

                          ],
                        ),

                      ]
                    ),
                    SizedBox(height: 4,),
                    RatingBar.builder(
                      initialRating: 4.5,
                      ignoreGestures: true,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 11,
                      itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
