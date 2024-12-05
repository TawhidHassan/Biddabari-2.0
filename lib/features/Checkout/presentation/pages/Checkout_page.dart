import 'dart:ffi';

import 'package:biddabari_new/Dependenci%20Injection/init_dependencies.dart';
import 'package:biddabari_new/core/LocalDataBase/localdata.dart';
import 'package:biddabari_new/features/AllCourse/data/models/course/Course.dart';
import 'package:biddabari_new/features/Checkout/presentation/controller/Checkout_controller.dart';
import 'package:biddabari_new/features/Login/presentation/controller/Login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/Button/bottom_checkout_section.dart';
import '../../../../core/common/widgets/Button/elevated_button.dart';
import '../../../../core/common/widgets/container/discount_badge.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/common/widgets/text field/text_field.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../../../core/service/discount_calculate.dart';
import '../../../../core/utils/calculate_day_left.dart';
import '../../../../core/utils/system_util.dart';
import '../../../BookStore/data/models/book/Book.dart';
import '../../../Exam/data/models/Exam.dart';
import '../../../Login/data/models/Auth/LoginResponse.dart';
import '../../../Login/presentation/widget/payment_option_card.dart';
import '../widget/payment_summery_item.dart';
import 'package:flutter/services.dart';

class CheckoutPage extends StatelessWidget {
  final Course? course;
  final Exam? exam;
  final Exam? parentExam;
  final Book? book;
  final String? type;

  const CheckoutPage({super.key, this.course, this.type, this.exam, this.parentExam, this.book});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<CheckoutController>().onInit();
      Get.find<CheckoutController>().getDeliveryAddress();
      Get.find<CheckoutController>().circuler.value=false;

    });
    return GetBuilder<CheckoutController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
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
                margin: EdgeInsets.only(bottom: 200),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    type == "course" ?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(course!.title ?? '',
                          style: boldText(18),),
                        SizedBox(height: 6,),
                        Text(
                          course!.title ?? '',
                          style: regularText(10, color: Color(0xFF777777)),
                        ),
                        SizedBox(height: 6,),
                        course!.discount_end_date==null?SizedBox():
                        DiscountBadge(
                          text: 'Duration ${DayLeftcalculate(course!.discount_end_date??"0")} Days',
                          backgroundColor: Color(0xFf167F71),
                          foregroundColor: Colors.white,
                          radius: 4,
                        ),
                        SizedBox(height: 6,),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: 4.5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 16,
                              ignoreGestures: true,
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
                            // Text(
                            //   '(1 customer review)',
                            //   style: regularText(10, color: Color(0xFF777777)),
                            // ),
                          ],
                        ),
                      ],
                    ) :
                    type == "exam" ?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(exam!.packageTitle ?? '',
                          style: boldText(18),),
                        SizedBox(height: 6,),
                        Text(
                          exam!.packageTitle ?? '',
                          style: regularText(10, color: Color(0xFF777777)),
                        ),
                        SizedBox(height: 6,),
                        exam!.discountEndDate==null?SizedBox():
                        DiscountBadge(
                          text: 'Duration ${DayLeftcalculate(exam!.discountEndDate??"0")} Days',
                          backgroundColor: Color(0xFf167F71),
                          foregroundColor: Colors.white,
                          radius: 4,
                        ),
                        SizedBox(height: 6,),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: 4.5,
                              minRating: 1,
                              ignoreGestures: true,
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
                      ],
                    )
                        :
                    type == "product" ?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(book!.title ?? '',
                          style: boldText(18),),
                        SizedBox(height: 6,),
                        Text(
                          book!.title ?? '',
                          style: regularText(10, color: Color(0xFF777777)),
                        ),
                        SizedBox(height: 6,),
                        book!.discount_end_date==null?SizedBox():
                        DiscountBadge(
                          text: 'Duration ${DayLeftcalculate(book!.discount_end_date)} Days',
                          backgroundColor: Color(0xFf167F71),
                          foregroundColor: Colors.white,
                          radius: 4,
                        ),
                        SizedBox(height: 6,),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: 4.5,
                              minRating: 1,
                              ignoreGestures: true,
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
                            // Text(
                            //   '(1 customer review)',
                            //   style: regularText(10, color: Color(0xFF777777)),
                            // ),
                          ],
                        ),
                      ],
                    ):SizedBox(),


                    SizedBox(height: 16,),
                    Container(
                      width: 1.0.sw,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Form(
                        key: controller.loginGlobalkey,
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
                              textEditingController: controller
                                  .nameTextController,
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
                              "আপনার এই নামে রেজিস্টার করা হবে",
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
                              textEditingController: controller
                                  .mobileTextController,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r"[0-9]")),
                                CustomTextInputFormatter(),
                                // FilteringTextInputFormatter.allow(RegExp(r'^01[7835]\d*')),
                                LengthLimitingTextInputFormatter(11),
                              ],
                              validator: (text) {
                                if (text!.isEmpty) {
                                  return "Please enter your phone";
                                }
                              },
                              hintText: "Enter your phone",
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
                              textEditingController: controller
                                  .mobileConfirmTextController,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r"[0-9]")),
                                CustomTextInputFormatter(),
                                // FilteringTextInputFormatter.allow(RegExp(r'^01[7835]\d*')),
                                LengthLimitingTextInputFormatter(11),
                              ],
                              validator: (text) {
                                if (text!.isEmpty) {
                                  return "Please enter your phone";
                                }
                              },
                              hintText: "Enter your phone",
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

                            type == "product"?
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 18,),
                                Text(
                                  'Address',
                                  style: semiBoldText(14),
                                ),
                                SizedBox(height: 8,),
                                CustomTextField(
                                  textEditingController: controller
                                      .delievrAddressTextController,
                                  validator:type == "product"? (text) {
                                    if (text!.isEmpty) {
                                      return "Please enter your delivery address";
                                    }
                                  }:null,
                                  hintText: "Enter your delivery address",
                                  isPrefixIcon: false,
                                  paddingLeft: 16,

                                ),
                                const SizedBox(height: 5),
                                // note
                                Text(
                                  "এই আপনার ডেলিভারি ঠিকানা",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ):SizedBox(),


                            const SizedBox(height: 20),

                            // bkash method
                            GestureDetector(
                              onTap: () {
                                controller.paymentType.value = "বিকাশ";
                              },
                              child: PaymentOptionCard(
                                title: 'বিকাশ পেমেন্ট মেথড',
                                color: controller.paymentType.value == "বিকাশ"
                                    ? AppColors.primaryColor
                                    : Colors.grey,
                                icon: Image.asset("assets/images/bkashLogo.png"),
                              ),
                            ),

                            const SizedBox(height: 15),

                            // Other payment method
                            GestureDetector(
                              onTap: () {
                                controller.paymentType.value = "ডিজিটাল";
                              },
                              child: PaymentOptionCard(
                                title: 'অন্যান্য পেমেন্ট মেথড',
                                color: controller.paymentType.value == "ডিজিটাল"
                                    ? AppColors.primaryColor
                                    : Colors.grey,
                                icon: Image.asset("assets/images/sslLogo.png"),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),
                    Text("Payment Summary", style: boldText(16),),
                    SizedBox(height: 18,),
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12)
                      ),

                      child: type=="course"?
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          PaymentSummeryItem(
                            item: 'Sub Total',
                            amount: course!.discount_amount != null ?
                            (course!.price!.toDouble() - course!.discount_amount!.toDouble()).toString()
                                :
                            course!.price!.toString(),
                          ),

                          const SizedBox(height: 10),

                          PaymentSummeryItem(
                            item: 'Fee & Delivery',
                            amount: "0.0",
                          ),

                          const Divider(
                            height: 25,
                            thickness: 0.3,
                            color: Colors.black54,
                          ),

                          PaymentSummeryItem(
                            item: 'Total',
                            amount: course!.discount_amount != null ?
                            (course!.price!.toDouble() - course!.discount_amount!.toDouble()).toString()
                                :
                            course!.price!.toString(),
                            isBold: true,
                          ),
                        ],
                      )
                      :
                      type=="exam"?
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          PaymentSummeryItem(
                            item: 'Sub Total',
                            amount: exam!.discountAmount != null ?
                            (exam!.price!.toDouble() - exam!.discountAmount!.toDouble()).toString()
                                :
                            exam!.price!.toString(),
                          ),

                          const SizedBox(height: 10),

                          PaymentSummeryItem(
                            item: 'Fee & Delivery',
                            amount: "0.0",
                          ),

                          const Divider(
                            height: 25,
                            thickness: 0.3,
                            color: Colors.black54,
                          ),

                          PaymentSummeryItem(
                            item: 'Total',
                            amount: exam!.discountAmount != null ?
                            (exam!.price!.toDouble() - exam!.discountAmount!.toDouble()).toString()
                                :
                            exam!.price!.toString(),
                            isBold: true,
                          ),
                        ],
                      )
                      :
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          PaymentSummeryItem(
                            item: 'Sub Total',
                            amount: book!.discount_amount != null ?
                            (num.parse(book!.price!).toDouble() - num.parse(book!.discount_amount!).toDouble()).toString()
                                :
                            book!.price!.toString(),
                          ),

                          const SizedBox(height: 10),

                          PaymentSummeryItem(
                            item: 'Fee & Delivery',
                            amount: "0.0",
                          ),

                          const Divider(
                            height: 25,
                            thickness: 0.3,
                            color: Colors.black54,
                          ),

                          PaymentSummeryItem(
                            item: 'Total',
                            amount: book!.discount_amount != null ?
                            (num.parse(book!.price!).toDouble() - num.parse(book!.discount_amount!).toDouble()).toString()
                                :
                            book!.price!.toString(),
                            isBold: true,
                          ),

                        ],
                      )
                    ),
                  ],

                ),
              ),
            ),
            bottomSheet:controller.circuler.value?SizedBox(
                height: 100,
                width: 1.0.sw,
                child: LoadingWidget()):
                type=="course"?
              BottomCheckoutSection(
              loading: false,
              action: () {
                if (controller.loginGlobalkey.currentState!.validate()) {
                  controller.circuler.value=true;
                  controller.login(context, "course",course,exam,parentExam,book).then((onValue){
                  });
                }
              },
              dayslLeft: "0",
              offerAvilable: true,
              mainPrice: course!.price!.toString(),
              totalPrice: course!.discount_amount != null ?
              (course!.price!.toDouble() - course!.discount_amount!.toDouble()).toString()
                  :
              course!.price!.toString(),
              discountPercent: '${calculateDiscountPercentage(course!
                  .price!.toDouble(), course!.discount_amount!.toDouble())}',
            ):
                type=="exam"?
                BottomCheckoutSection(
                  loading: false,
                  action: () {
                    if (controller.loginGlobalkey.currentState!.validate()) {
                      controller.circuler.value=true;
                      controller.login(context, "batch_exam",course,exam!,parentExam,book).then((onValue){

                      });
                    }
                  },
                  dayslLeft: "0",
                  offerAvilable: true,
                  mainPrice: exam!.price!.toString(),
                  totalPrice: exam!.discountAmount != null ?
                  (exam!.price!.toDouble() - exam!.discountAmount!.toDouble()).toString()
                      :
                  exam!.price!.toString(),
                  discountPercent: '${calculateDiscountPercentage(exam!
                      .price!.toDouble(), exam!.discountAmount!.toDouble())}',
                ):
                type == "product" ?
                BottomCheckoutSection(
                  loading: false,
                  action: () {
                    if (controller.loginGlobalkey.currentState!.validate()) {
                      controller.circuler.value=true;
                      controller.login(context, "product",course,exam,parentExam,book).then((onValue){

                      });
                    }
                  },
                  dayslLeft: "0",
                  offerAvilable: true,
                  mainPrice: book!.price!.toString(),
                  totalPrice: book!.discount_amount != null ?
                  (double.parse(book!.price??"0.0") - double.parse(book!.discount_amount??"0.0")).toString()
                      :
                  book!.price!.toString(),
                  discountPercent: '${calculateDiscountPercentage(
                     double.parse(book!.price??"0.0"), double.parse(book!.discount_amount??"0.0"))}',
                ):
                SizedBox(),
          );
        });
      },
    );
  }



}
