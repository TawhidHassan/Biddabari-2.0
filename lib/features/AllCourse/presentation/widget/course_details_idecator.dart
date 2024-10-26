import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:flutter/material.dart';

class CourseDetailsIdecator extends StatelessWidget {
  final String title,value;
  final Widget? icon;
  const CourseDetailsIdecator({super.key, required this.title, required this.value, this.icon});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                icon!,
                const SizedBox(width: 10),
                 Text(
                  title??"",
                  style: semiBoldText(14),
                ),
              ],
            ),
            Text(
              value??'',
              style: mediumText(14,color: Colors.grey,),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
