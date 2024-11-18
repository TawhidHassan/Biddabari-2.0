import 'package:biddabari_new/core/common/widgets/Button/custom_button.dart';
import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/routes/route_path.dart';
import 'package:biddabari_new/features/Blog/data/models/Blog/Blog.dart';
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
import '../../../../core/utils/format_date.dart';




class BlogCard extends StatelessWidget {
  final Blog?  blog;

  const BlogCard({super.key, this.blog,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.blogDetailsPage,extra: blog! );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // image
            Expanded(
              flex: 4,
              child: CachedNetworkImage(
                imageUrl:blog!.image!,
                placeholder: (context, url) => Skeletonizer(
                  enabled: true,
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Assets.images.course.provider(),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                errorWidget: (context, url, error){
                  return Container(
                    height: 110,
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
                      height: 110,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: image,
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
              ),
            ),
            const SizedBox(width: 10),

            // title
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.only(right: 18,top: 12,bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DiscountBadge(
                      radius: 6,
                      textSize: 8,
                      text: blog!.blog_category!.name??"",
                      backgroundColor: Color(0xFFEB6A20)
                          .withOpacity(0.20),
                      foregroundColor: Color(0xFFEB6A20),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      blog!.title??'',
                      textAlign: TextAlign.justify,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(

                            style: semiBoldText(8),
                            children:[
                              // WidgetSpan(
                              //   child: CircleAvatar(
                              //     radius: 6,
                              //   ),
                              // ),
                              // WidgetSpan(
                              //   child:SizedBox(width: 6,),
                              // ),
                              // TextSpan(text: 'Pritomtaw.. ', style: TextStyle(color: Color(0xff777777))),
                              // WidgetSpan(
                              //   child:SizedBox(width: 6,),
                              // ),
                              // TextSpan(text: ' | ', style: TextStyle(color: Color(0xff777777))),
                              // WidgetSpan(
                              //   child:SizedBox(width: 6,),
                              // ),
                              WidgetSpan(
                                child: Icon(Icons.calendar_month,color: AppColors.primaryColor,size: 12,),
                              ),
                              WidgetSpan(
                                child:SizedBox(width: 6,),
                              ),
                              TextSpan(text: getCustomFormattedDateTime(blog!.updated_at??'','yyy-MMM-dd').toString(), style: TextStyle(color: Color(0xff777777))),
                              WidgetSpan(
                                child:SizedBox(width: 6,),
                              ),
                              TextSpan(text: ' | ', style: TextStyle(color: Color(0xff777777))),
                              WidgetSpan(
                                child:SizedBox(width: 6,),
                              ),
                              WidgetSpan(
                                child:SizedBox(width: 6,),
                              ),
                              WidgetSpan(
                                child: Icon(Icons.watch_later_outlined,color: AppColors.primaryColor,size: 12,),
                              ),
                              WidgetSpan(
                                child:SizedBox(width: 6,),
                              ),
                              TextSpan(text:  getCustomFormattedDateTime(blog!.updated_at??'','h:mm a').toString(), style: TextStyle(color: Color(0xff777777))),


                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomButton(
                          height: 30,
                           width: 100,
                           onTap: null,
                           isBorder: true,
                          textColor: AppColors.primaryColor,
                          title: "Read more",
                        )

                      ],
                    ),

                    // price
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
