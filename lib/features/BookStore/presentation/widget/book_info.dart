import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/color/app_colors.dart';

class BookInfo extends StatelessWidget {
  final List<List<String>> bookDetails;

  const BookInfo({super.key, required this.bookDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(
        children: [
          // Vertical red bar on the left side
          Container(
            height: 100, // Adjust height dynamically
            color: AppColors.primaryColor,
            width: 2,
          ),

          const SizedBox(width: 15),

          // Book info column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: bookDetails.map(
              (detail) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    children: [
                      Text('${detail[0]}: ',style: mediumText(10.sp),),
                      Text(
                        detail[1],
                          style: semiBoldText(10.sp,color: AppColors.primaryColor)
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
