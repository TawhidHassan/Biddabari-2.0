import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:go_router/go_router.dart';

import '../../../config/color/app_colors.dart';
import '../../../config/util/text_style.dart';
import '../../../custom_assets/assets.gen.dart';
import '../../../routes/route_path.dart';
import '../container/discount_badge.dart';
import '../loading/loading_widget.dart';
import 'elevated_button.dart';


class BottomCheckoutSection extends StatelessWidget {
  final bool? loading,offerAvilable;
  final String? totalPrice,mainPrice,discountPercent,dayslLeft;
  final Callback? action;
  const BottomCheckoutSection({super.key, this.loading=false, this.offerAvilable, this.totalPrice, this.mainPrice, this.discountPercent, this.dayslLeft, this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 1.0.sw,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            spreadRadius: 1.5,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      child:loading!?LoadingWidget():
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${200.000.toStringAsFixed(2)} BDT',
                      style: boldText(14, color: AppColors.primaryColor),
                    ),

                    const SizedBox(width: 10),

                    // regular price
                    Text(
                      '100BDT',
                      style: TextStyle(
                          fontSize: 9,
                          color: Color(0xFFA9A9A9),
                          decoration: TextDecoration.lineThrough
                      ),

                    ),

                    const SizedBox(width: 10),
                    DiscountBadge(
                      textSize: 9,
                      text: '56% off',
                      backgroundColor: Color(0xFfFFEEE8),
                      foregroundColor: Color(0xffEB6A20),
                      radius: 0,
                    ),

                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Assets.icons.alarm.svg(),
                    SizedBox(width: 8,),
                    Text(
                      '2 days left at this price!',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFC71720),

                      ),

                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 24,),
          Expanded(
            flex: 5,
            child: CustomElevatedButton(
              onPressed: action!,
              titleText: 'এখনই কিনুন ',
              titleSize: 14,
              buttonHeight: 30.h,
              titleColor: Colors.white,
              buttonColor: AppColors.primaryColor,
              borderRdius: 100.r,
              buttonMarginLeft: 0,
              iconRight: Container(
                width: 36,
                height: 36,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(),
                ),
                child: Icon(Icons.arrow_forward_ios_sharp,
                  color: AppColors.primaryColor,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
