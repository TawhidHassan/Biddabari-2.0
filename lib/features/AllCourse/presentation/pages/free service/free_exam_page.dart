import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/custom_assets/assets.gen.dart';
import '../../../data/models/CourseCategory/CourseCategoryResponse.dart';

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
    );
  }
}
