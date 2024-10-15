import 'package:biddabari_new/features/AllCourse/presentation/controller/AllCourse_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/config/color/app_colors.dart';
import '../../../BookStore/presentation/widget/popular_book_component.dart';
import '../../../Home/presentation/widget/home_slider_component.dart';
import '../widget/all_course_component.dart';

class AllCoursePage extends StatelessWidget {
  const AllCoursePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('All Course'),
      ),
      body:  NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(child: SizedBox(height: 28.h,)),
            ///search bar
            ///home slider top part
            SliverToBoxAdapter(
                child: HomeSliderComponent()
            ),

          ];
        },
        body: Container(
          height: 1.0.sh,
          width: 1.0.sw,
          color: AppColors.primaryBackground,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: AllCourseComponent()
              ),
            ],
          ),
        ),
      ),
    );
  }
}