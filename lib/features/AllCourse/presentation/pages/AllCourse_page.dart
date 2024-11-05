import 'package:biddabari_new/features/AllCourse/presentation/controller/AllCourse_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/text field/search_bar.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../../BookStore/presentation/widget/popular_book_component.dart';
import '../../../Home/presentation/widget/home_slider_component.dart';
import '../widget/all_course_component.dart';

class AllCoursePage extends StatelessWidget {
  const AllCoursePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.goNamed(Routes.mainPage);
          },
          child: Padding(
              padding: EdgeInsets.all(18),
              child: Assets.icons.backArrow.svg()),
        ),
        title: Text('All Course'),
      ),
      body:  NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(child: SizedBox(height: 12.h,)),
            SliverToBoxAdapter(child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Search(
                readOnly: true,
                onTap: (){
                  print("object");
                  context.pushNamed(Routes.searchPage,extra: "Course");
                },
                suffixIcon: Container(
                  width: 31,
                  height: 31,
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(1.00, -0.02),
                      end: Alignment(-1, 0.02),
                      colors: [Color(0xFFAA076B), Color(0xFF61045F)],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: Assets.icons.filter.svg(),
                ),
              ),
            ),),
            SliverToBoxAdapter(child: SizedBox(height: 12.h,)),
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