import 'dart:ffi';

import 'package:biddabari_new/features/Checkout/presentation/controller/Checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/Button/elevated_button.dart';
import '../../../../core/common/widgets/container/discount_badge.dart';
import '../../../../core/common/widgets/text field/text_field.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../../Login/presentation/widget/payment_option_card.dart';
import '../widget/payment_summery_item.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      assignId: true,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Check out"),
            leading: InkWell(
              onTap: () {
                context.pop();
              },
              child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Assets.icons.backArrow.svg()),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("48th BCS Foundation To Advance Live Batch",
                    style: boldText(18),),
                  SizedBox(height: 6,),
                  Text(
                    'NTRCA বা শিক্ষক নিবন্ধন (কলেজ, স্কুল, স্কুল পর্যায়-২) প্রিলি. পরীক্ষায় পাশ করতে বিগত বিসিএস এবং গত ৫-১০ বছরের নন-ক্যাডার পরীক্ষাযর বাছাইকৃত প্রশ্নগুলো পড়ে মনে রাখতে পারলেই পাশ হয়ে যায়। তবে, বিসিএস সহ',
                    style: regularText(10, color: Color(0xFF777777)),
                  ),
                  SizedBox(height: 6,),
                  DiscountBadge(
                    text: 'Duration 5 Days',
                    backgroundColor: Color(0xFf167F71),
                    foregroundColor: Colors.white,
                    radius: 4,
                  ),
                  SizedBox(height: 6,),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 16,
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
                      SizedBox(width: 6,),
                      Text(
                        '(1 customer review)',
                        style: regularText(10, color: Color(0xFF777777)),
                      ),
                    ],
                  ),
                  SizedBox(height: 6,),
                  Container(
                    width: 1.0.sw,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CheckOut Summary", style: boldText(16),),
                        SizedBox(height: 18,),

                        Text(
                          'Your Name',
                          style: semiBoldText(14),
                        ),
                        SizedBox(height: 8,),
                        CustomTextField(
                          inputFormatters: [
                          ],
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Please enter your name";
                            }
                          },
                          hintText: "Enter your name",
                          isPrefixIcon: false,
                          paddingLeft: 16,

                        ),
                        const SizedBox(height: 5),
                        // note
                        Text(
                          "আপনার এই নাম এ কোর্সটি রেজিস্টার করা হবে",
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),


                        SizedBox(height: 18,),
                        Text(
                          'Phone No.',
                          style: semiBoldText(14),
                        ),
                        SizedBox(height: 8,),
                        CustomTextField(
                          inputFormatters: [
                          ],
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Please enter your name";
                            }
                          },
                          hintText: "Enter your name",
                          isPrefixIcon: false,
                          paddingLeft: 16,

                        ),
                        const SizedBox(height: 5),
                        // note
                        Text(
                          "এই নাম্বারটি হবে আপনার রেজিস্ট্রেশন নম্বর ",
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),


                        SizedBox(height: 18,),
                        Text(
                          'Confirm Phone No.',
                          style: semiBoldText(14),
                        ),
                        SizedBox(height: 8,),
                        CustomTextField(
                          inputFormatters: [
                          ],
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Please enter your name";
                            }
                          },
                          hintText: "Enter your name",
                          isPrefixIcon: false,
                          paddingLeft: 16,

                        ),
                        const SizedBox(height: 5),
                        // note
                        Text(
                          "এই নাম্বারটি হবে আপনার রেজিস্ট্রেশন নম্বর ",
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),


                        const SizedBox(height: 20),

                        // bkash method
                        GestureDetector(
                          onTap: () {
                            controller.selectBkashMethod();
                            controller.paymentMethod.value = 'bkash';
                          },
                          child: PaymentOptionCard(
                            title: 'বিকাশ পেমেন্ট মেথড',
                            color: controller.isBkashMethodSelected
                                ? AppColors.primaryColor
                                : Colors.grey,
                            icon: Icons.payment,
                          ),
                        ),

                        const SizedBox(height: 15),

                        // Other payment method
                        GestureDetector(
                          onTap: () {
                            controller.selectOtherMethod();
                            controller.paymentMethod.value = 'others';
                          },
                          child: PaymentOptionCard(
                            title: 'অন্যান্য পেমেন্ট মেথড',
                            color: controller.isOtherMethodSelected
                                ? AppColors.primaryColor
                                : Colors.grey,
                            icon: Icons.payment,
                          ),
                        ),

                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                  Text("Payment Summary", style: boldText(16),),
                  SizedBox(height: 18,),
                  Card(
                    color: AppColors.whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          PaymentSummeryItem(
                            item: 'Sub Total',
                            amount: 8999,
                          ),

                          const SizedBox(height: 10),

                          PaymentSummeryItem(
                            item: 'Fee & Delivery',
                            amount: 120,
                          ),

                          const Divider(
                            height: 25,
                            thickness: 0.3,
                            color: Colors.black54,
                          ),

                          PaymentSummeryItem(
                            item: 'Total',
                            amount: 8999,
                            isBold: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                ],
              ),
            ),
          ),
          bottomSheet: Container(
            height: 85,
            width: 1.0.sw,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
            child: Row(
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${200.000.toStringAsFixed(2)} BDT',
                          style: boldText(16,color: AppColors.primaryColor),
                        ),

                        const SizedBox(width: 10),

                        // regular price
                        Text(
                          '100BDT',
                          style: TextStyle(
                              fontSize: 9,
                              color: Color(0xFFA9A9A9),
                              decoration:TextDecoration.lineThrough
                          ),

                        ),

                        const SizedBox(width: 10),
                        DiscountBadge(
                          textSize: 9,
                          text:'56% off',
                          backgroundColor: Color(0xFfFFEEE8),
                          foregroundColor:  Color(0xffEB6A20),
                          radius: 0,
                        ),

                      ],
                    ),

                    SizedBox(height: 6,),
                    Row(
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
                    SizedBox(height: 12,),
                  ],
                ),
                SizedBox(width: 14,),
                Expanded(
                  child: CustomElevatedButton(
                    onPressed: () {
                      context.pushNamed(Routes.checkOutPage);
                    },
                    titleText: 'এখনই কিনুন ',
                    titleSize: 14,
                    buttonHeight: 30.h,
                    titleColor: Colors.white,
                    buttonColor: AppColors.primaryColor,
                    borderRdius: 100.r,
                    buttonMarginLeft: 52,
                    iconRight: Container(
                      width: 36,
                      height: 36,
                      margin: EdgeInsets.symmetric(horizontal: 10),
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
          ),
        );
      },
    );
  }
}
