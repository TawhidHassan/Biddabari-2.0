import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../../core/custom_assets/assets.gen.dart';
import '../../../data/models/CourseCategory/CourseCategoryResponse.dart';
import '../../controller/AllCourse_controller.dart';
import '../../widget/free_video_card.dart';

class FreeVideoPage extends StatelessWidget {
  final CourseCategoryResponse? courseCategoryResponse;
  const FreeVideoPage({super.key, this.courseCategoryResponse});

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
        title: Text('Free Video'),
      ),
      body:  Container(
        height: 1.0.sh,
        width: 1.0.sw,
        padding: EdgeInsets.all(16),
        child: courseCategoryResponse==null?SizedBox():
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              childAspectRatio: 4/4
          ),
          itemCount:courseCategoryResponse!.free_class_videos!.length,
          itemBuilder: (context, index) {
            return FreeVideoCard(
              course: courseCategoryResponse!.free_class_videos![index],
            );
          },
        ),
      ),
    );
  }
}
