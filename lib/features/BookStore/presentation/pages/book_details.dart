import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:biddabari_new/core/extentions/custom_extentions.dart';
import 'package:biddabari_new/features/BookStore/data/models/bookStore_model.dart';
import 'package:biddabari_new/features/BookStore/presentation/controller/BookStore_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/common/widgets/Button/custom_button.dart';
import '../../../../core/common/widgets/Button/elevated_button.dart';
import '../../../../core/common/widgets/container/discount_badge.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/extentions/service.dart';
import '../../../../core/routes/route_path.dart';
import '../../data/models/book/Book.dart';
import '../widget/book_info.dart';

class BookDetailsPage extends StatelessWidget {
  final Book? book;

  const BookDetailsPage({super.key, this.book});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<BookStoreController>().getBookDetails(book!.id.toString());
    });
    return GetBuilder<BookStoreController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return Scaffold(
            appBar: AppBar(
              title: Text("Book Details"),
              leading: InkWell(
                onTap: () {
                  context.pop();
                },
                child: Padding(
                    padding: EdgeInsets.all(18),
                    child: Assets.icons.backArrow.svg()),
              ),
            ),
            body: Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: EdgeInsets.all(12),
              child: controller.storeBookLoading.value?LoadingWidget():
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // image in the center
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 233,
                        //   child: ClipRRect(
                        //     borderRadius: BorderRadius.circular(10),
                        //     child: Image.asset(
                        //       Assets.images.course.path,
                        //       fit: BoxFit.fill,
                        //     ),
                        //   ),
                        // ),
                        CachedNetworkImage(
                          imageUrl:book!.image!,
                          placeholder: (context, url) => LoadingWidget(),
                          errorWidget: (context, url, error){
                            return Container(
                              width: 1.0.sw,
                              height: 233,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: Assets.images.course.provider(),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                          },
                          imageBuilder: (context, image) =>
                              Container(
                                width: 1.0.sw,
                                height: 233,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: image,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                        ),


                        // Discount and shipping status at the top
                        Positioned(
                          top: 10,
                          left: 0,
                          child: Row(
                            children: [
                              const SizedBox(width: 15),
                              DiscountBadge(
                                text: '-36%',
                                backgroundColor: Color(0xFf18C667),
                                foregroundColor: Colors.white,
                                radius: 12,
                              ),
                              const SizedBox(width: 15),
                              DiscountBadge(
                                text: 'Free shipping',
                                backgroundColor: Color(0xFf18C667),
                                foregroundColor: Colors.white,
                                radius: 12,
                              ),
                              const SizedBox(width: 12),
                              // LabelBadge(text: '${bookData['shipping']}'),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 12,),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: DiscountBadge(
                            text: 'Free shipping',
                            backgroundColor: Color(0xFf167F71),
                            foregroundColor: Colors.white,
                            radius: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 16,),
                  ),

                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.bookSingelResponse.value!.product!.title??"", style: boldText(18),),
                        SizedBox(height: 6,),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
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
                            SizedBox(width: 6,),
                            Text(
                              '(1 customer review)',
                              style: regularText(10, color: Color(0xFF777777)),
                            ),
                          ],
                        ),

                        SizedBox(height: 10,),
                        BookInfo(
                          bookDetails: [
                            ['লেখক', 'writer'],
                            ['প্রকাশনী', 'publication'],
                            ['বিষয়', 'subject'],
                            ['কভার', 'cover'],
                          ],
                        ),

                        const SizedBox(height: 10),

                        controller.bookSingelResponse.value!.product!.discount_amount==null?
                        Text(
                          '${controller.bookSingelResponse.value!.product!.price} BDT',
                          style: boldText(
                              18, color: AppColors.primaryColor),
                        )
                            :
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // discounted price
                            Text(
                              '${controller.bookSingelResponse.value!.product!.discount_amount} BDT',
                              style: boldText(
                                  18, color: AppColors.primaryColor),
                            ),

                            const SizedBox(width: 10),

                            // regular price
                            Text(
                              '${controller.bookSingelResponse.value!.product!.price!}BDT',
                              style: TextStyle(
                                  fontSize: 9.sp,
                                  color: Color(0xFFA9A9A9),
                                  decoration: TextDecoration.lineThrough
                              ),

                            ),

                            const SizedBox(width: 10),

                            Text(
                              '(${CustomeService().GetPercentage(NumberParsing(controller.bookSingelResponse.value!.product!.price!).parseDouble, (NumberParsing(controller.bookSingelResponse.value!.product!.discount_amount??"0.0").parseDouble))}% Char)',
                              style: semiBoldText(9.sp,
                                  color: Color(0xFFC71720)),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),


                        BookInfo(
                          bookDetails: [
                            ['অনুবাদ', 'translation'],
                            ['সম্পাদনা', 'edition'],
                            ['পৃষ্ঠা', 'page'],
                          ],
                        ),

                        const SizedBox(height: 10),

                        // heading: description

                        Text(
                          'Description',
                          style: extraBoldText(
                              14.sp, color: AppColors.primaryColor),
                        ),
                        const SizedBox(height: 5),

                        // book description
                        Html(
                          data: controller.bookSingelResponse.value!.product!.description!,
                          onLinkTap: (url, _, __) async {
                            if (await canLaunch(url!)) {
                              await launch(
                                url,
                              );
                            }
                          },
                        ),


                        SizedBox(height: 170,)
                      ],
                    ),
                  ),

                ],
              ),
            ),

            bottomSheet: Container(
              height: 138,
              width: 1.0.sw,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child:controller.storeBookLoading.value?LoadingWidget(): Column(
                children: [

                  Row(
                    children: [
                      Text(
                        '${200.000.toStringAsFixed(2)} BDT',
                        style: boldText(16, color: AppColors.primaryColor),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomButton(
                          color: AppColors.kPrimaryColorx,
                          onTap: () {},
                          title: "Add to Cart",
                          borderRadius: 50,
                          textColor: AppColors.kPrimaryColorx,
                          textSize: 14.sp,
                          height: 35.h,
                          isBorder: true,


                        ),
                      ),

                      SizedBox(width: 12,),
                      CustomElevatedButton(
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

                    ],
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
