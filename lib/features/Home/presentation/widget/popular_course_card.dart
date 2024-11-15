import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class PopularCourseCard extends StatelessWidget {
  const PopularCourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:280 ,
      margin: EdgeInsets.only(right:16 ),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        shadows: [
          BoxShadow(
            color: Color(0x26A8A4A4),
            blurRadius: 15,
            offset: Offset(0, 8),
            spreadRadius: 0,)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: CachedNetworkImage(
              imageUrl:"jdid",
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
                );
              },
              imageBuilder: (context, image) =>
                  Container(
                    height: 300,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4) ),
                        image: DecorationImage(
                            image: image,
                            fit: BoxFit.fill
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
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'BCS',
                          style: boldText(12,color:AppColors.orange400 ),
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          padding: EdgeInsets.all(6),
                          margin: EdgeInsets.only(top:8,right: 8 ),
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side: BorderSide(width: 1, color: Color(0xFF167F71)),
                            ),
                          ),
                          child: Assets.icons.saveGreenSvg.svg(color: Color(0xFF167F71),height: 12,width: 12),
                        ),
                      ],
                    ),
                    SizedBox(height: 7,),
                    Text(
                      '48th BCS Foundation To..',
                      style: boldText(16),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text(
                          '850/-',
                          style: TextStyle(
                            color: Color(0xFF5F61F0),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 2,),
                        Text(
                          '|',
                          style: boldText(14),
                        ),
                        SizedBox(width: 16,),
                        Assets.icons.star.svg(),
                        SizedBox(width: 3,),
                        Text(
                          '4.2',
                          style: extraBoldText(11),
                        ),
                        SizedBox(width: 16,),
                        Text(
                          '|',
                          style: boldText(14),
                        ),
                        SizedBox(width: 16,),
                        Text(
                          '7830 Std',
                          style: TextStyle(
                            color: Color(0xFF202244),
                            fontSize: 11,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      ],
                    )


                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
