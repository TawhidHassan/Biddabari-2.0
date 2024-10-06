import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../custom_assets/assets.gen.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Assets.lottie.loading.lottie(height: 100.h),);
    // return Center(child: Lottie.asset("assets/lottie/loading.json",height: 100.h),);
  }
}
