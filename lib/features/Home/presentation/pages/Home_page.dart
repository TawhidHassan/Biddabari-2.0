import 'package:biddabari_new/features/Home/presentation/widget/home_category_component.dart';
import 'package:biddabari_new/features/Home/presentation/widget/home_slider_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common/widgets/text field/search_bar.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../widget/home_custom_appbar.dart';
import '../widget/home_popular_book_component.dart';
import '../widget/home_popular_course_component.dart';
import '../widget/home_running_course_component.dart';
import '../widget/home_top_mentor_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: HomeCustomAppbar(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(child: SizedBox(height: 28.h,)),
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
            SliverToBoxAdapter(child: SizedBox(height: 16.h,)),
            ///search bar
            ///home slider top part
            ///
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
                child: HomeCategoryComponent(),
              ),

              SliverToBoxAdapter(
                  child: HomeRunningCourseComponent()
              ),

              SliverToBoxAdapter(
                  child: HomePopularCourseComponent()
              ),
              SliverToBoxAdapter(
                  child: HomeTopMentorComponent()
              ),
              SliverToBoxAdapter(
                  child: HomePoularBookComponent()
              ),
            ],
          ),
        ),
      ),

    );
  }
}
