import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../core/common/widgets/container/discount_badge.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../controller/ClassRoom_controller.dart';

class ClassRoomAjkerClass extends StatelessWidget {
  const ClassRoomAjkerClass({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ClassRoomController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return controller.myClassLoading.value?
          LoadingWidget()
              :
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: 3,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/course_content');
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Card(
                    color: AppColors.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        // image
                        Expanded(
                          flex: 1,
                          child: AspectRatio(
                            // Adjust the aspect ratio to control the image height
                            aspectRatio: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: Assets.images.teacher.provider(),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Other details
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // approved or not


                                // category
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      "category",
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFFF6B00),
                                      ),
                                    ),
                                    DiscountBadge(
                                      text: 1 == 1
                                          ? 'Approved'
                                          : 'Not Approved',
                                      backgroundColor: 1 == 1 ? Color(
                                          0xFf18C667)
                                          .withOpacity(0.14) : Colors.red
                                          .withOpacity(0.14),
                                      foregroundColor: 1 == 1
                                          ? Color(0xFf18C667)
                                          : Colors.red,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                // title
                                Text("47th BCS Special Care Live Batch-4",
                                  style: semiBoldText(16),),

                                const SizedBox(height: 6),

                                // rating
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("4.0", style: regularText(
                                        11, color: Color(0xFF888C94)),),
                                    const SizedBox(width: 8),
                                    RatingBar.builder(
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 22,
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
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
      },
    );
  }
}
