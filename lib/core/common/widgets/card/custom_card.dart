import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';

import '../../../../core/custom_assets/assets.gen.dart';
import '../../../config/color/app_colors.dart';
import '../../../config/util/style.dart';
import '../Button/custom_button.dart';
import '../text/custom_text.dart';
class CustomCard extends StatelessWidget {

  final String ? imgSrc;
  final String ? name;
  final String ? number;
  final double ? height;
  final double ? width;
  final Widget ? button;
  final Widget ? icon;
  final Color ? color;
  final Color ? borderColor;
  final VoidCallback ? onTap;


  const CustomCard({super.key, this.imgSrc, this.name, this.number, this.height, this.width, this.onTap, this.button, this.icon, this.color, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.center,
      height: height??70,
     width: width,

    );
  }
}
