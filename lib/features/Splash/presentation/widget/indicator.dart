import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/common/widgets/Button/elevated_button.dart';
import '../../../../core/config/color/app_colors.dart';

class Indicator extends StatelessWidget {

  Function()? onPressed;
  int? selectedIndex;
  int? itemCount;
  int? index;
  Indicator(
      {super.key,
       this.onPressed,
       this.selectedIndex,
       this.itemCount,  this.index}
      );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          width: 100,
          child: ListView.builder(
              itemCount: itemCount,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                    height: 15.h,
                    width: 15.h,
                    margin: EdgeInsets.only(right: 4.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == selectedIndex
                            ? AppColors.primaryColor
                            : AppColors.primarySlate600),
                  )),
        ),
        Container(
          constraints: BoxConstraints(),
          child: CustomElevatedButton(
            onPressed: onPressed!,
            titleText: index==2?'Get Started':'',
            titleSize: 14,
            titleColor: Colors.white,
            buttonColor: AppColors.primaryColor,
            borderRdius: 100.r,
            iconRight: Container(
              width: 36,
              height: 36,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: ShapeDecoration(
                color:index==2?Colors.white: Colors.transparent,
                shape: OvalBorder(),
              ),
              child: Icon(Icons.arrow_forward_ios_sharp,color:index==2?AppColors.primaryColor: Colors.white,),
            ) ,
          ),
        )
      ],
    );
  }
}
