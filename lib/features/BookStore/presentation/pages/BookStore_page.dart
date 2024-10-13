import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/color/app_colors.dart';
import '../../../Home/presentation/widget/home_slider_component.dart';
import '../widget/popular_book_component.dart';

class BookStorePage extends StatelessWidget {
  const BookStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Bok Store'),
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
                  child: StorePoularBookComponent()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
