import 'package:biddabari_new/features/AllCourse/data/models/course/Course.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../utils/system_util.dart';
import '../card/course_card.dart';

class ShimerGrid extends StatelessWidget {
  final int? count;
  const ShimerGrid({super.key, this.count=2});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: count!,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          childAspectRatio: SystemUtil.getChildAspectRatio(context),
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return CourseCard(
            buttonColor: 0xffffffff,
              course:Course(id: 1,banner: "",price: 12)
          );
        },
      ),
    );
  }
}