import 'package:biddabari_new/features/Home/presentation/widget/home_category_component.dart';
import 'package:biddabari_new/features/Home/presentation/widget/home_slider_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../widget/home_popular_course_component.dart';
import '../widget/home_running_course_component.dart';
import '../widget/home_top_mentor_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: AppColors.primaryBackground,
        title: Container(
         padding: EdgeInsets.symmetric(horizontal:0 ),
         color: AppColors.primaryBackground,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(
                 'Hi, Pritom tawsif',
                 style: PoppinsSemiBoldExtra.copyWith(
                   fontSize: 16,
                 )
             ),
             SizedBox(height: 4,),
             Text(
                 'What Would you like to learn \nToday? Search Below.',
                 style: PoppinsMedium.copyWith(
                   fontSize: 12,
                   color: Color(0xCC545454),
                 )
             ),
           ],
         ),
       ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 12),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  padding: EdgeInsets.all(6),
                  decoration: ShapeDecoration(
                    shape: OvalBorder(
                      side: BorderSide(width: 1, color: AppColors.primaryColor),
                    ),

                  ),
                  child: Assets.icons.bell.svg(),
                ),
                SizedBox(width: 14,),
                InkWell(
                  onTap: (){
                    context.pushNamed(Routes.loginPage);
                  },
                  child: CachedNetworkImage(
                      imageUrl: "https://images.unsplash.com/photo-1605881528191-68f38c78e3d3?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      // imageUrl: ApiEndpoint.imageBaseUrl+controller.response.value!.myProfile!.image!,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill
                          ),
                          color: const Color(0xfff7ffff),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error)

                  ),
                ),

              ],
            ),
          )
        ],
    ),
      body: NestedScrollView(
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
            ],
          ),
        ),
      ),

    );
  }
}
