import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/features/AllCourse/data/models/course/Course.dart';
import 'package:biddabari_new/features/Main/domain/entities/Main.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class CourseCard extends StatelessWidget {
final Course? course;
  const CourseCard({Key? key, this.course ,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // Navigator.pushNamed(context, CATGEGORY_COURSE_PAGE,arguments: {
        //   "id":id!.toString(),
        //   "name":name,
        //   "slug":slug
        // });
      },
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: CachedNetworkImage(
                imageUrl:course!.banner!,
                placeholder: (context, url) => LoadingWidget(),
                errorWidget: (context, url, error){
                  return Container(
                    height: 300,
                    width: 1.0.sw,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4) ),
                        image: DecorationImage(
                            image: Assets.images.course.provider(),
                            fit: BoxFit.fill
                        )
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 24,
                        height: 24,
                        padding: EdgeInsets.all(6),
                        margin: EdgeInsets.only(top:8,right: 8 ),
                        decoration: ShapeDecoration(
                          shape: OvalBorder(
                            side: BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        child: Assets.icons.saveGreenSvg.svg(color: Colors.white,height: 12,width: 12),
                      ),
                    ),
                  );
                },
                imageBuilder: (context, image) =>
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4) ),
                          image: DecorationImage(
                              image: image,
                              fit: BoxFit.cover
                          )
                      ),
                      child: Container(
                        width: 19,
                        height: 19,
                        decoration: ShapeDecoration(
                          shape: OvalBorder(
                            side: BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                ,
              ),
            ),
            SizedBox(height: 8,),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      course!.title??"",
                      style:boldText(16,color: AppColors.textClorColor),
                      textAlign: TextAlign.start,
                      maxLines: 2, // Set a limit for lines
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4,),
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
                    SizedBox(height: 6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            course!.discount_amount!=null?
                            Text(
                              '৳ ${course!.price!}',
                              style: TextStyle(
                                color: Color(0xFFC71720),
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
                                color: Color(0xFF191919),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ):
                            Text(
                              '৳ ${course!.price!}',
                              style: TextStyle(
                                color: Color(0xFF191919),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            )

                          ],
                        ),
                        SizedBox(width: 32,),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'View Details',
                                style: TextStyle(
                                  color: Color(0xFFEB6A20),
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 4,),
                              Container(
                                height: 20,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                                decoration: ShapeDecoration(
                                  color: Color(0xFFEB6A20),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x26A8A4A4),
                                      blurRadius: 15,
                                      offset: Offset(0, 8),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'Buy Now',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ]
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}
