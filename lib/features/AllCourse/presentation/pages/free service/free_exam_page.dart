import 'package:biddabari_new/core/common/widgets/empty/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/custom_assets/assets.gen.dart';
import '../../../data/models/CourseCategory/CourseCategoryResponse.dart';
import '../../widget/free_service_exam_card.dart';
import '../../widget/free_video_card.dart';

class FreeExamPage extends StatelessWidget {
  final CourseCategoryResponse? courseCategoryResponse;
  const FreeExamPage({super.key, this.courseCategoryResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: Padding(
              padding: EdgeInsets.all(18),
              child: Assets.icons.backArrow.svg()),
        ),
        title: Text('Free Exam'),
      ),
      body:  Container(
        height: 1.0.sh,
        width: 1.0.sw,
        padding: EdgeInsets.all(16),
        child: courseCategoryResponse==null?EmptyWidget():
        courseCategoryResponse!.free_exams!.isEmpty?
            EmptyWidget(title: "There has no exam",):
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              childAspectRatio: 4/4
          ),
          itemCount:courseCategoryResponse!.free_exams!.length,
          itemBuilder: (context, index) {
            return FreeServiceExamCard(
              categoryData: courseCategoryResponse!.free_exams![index],
            );
          },
        ),
      ),
    );
  }
}
