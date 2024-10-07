//==============custom text styles================
//------------------------------------------------

import 'dart:io';

import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:flutter/material.dart';

TextStyle regularText(double size, {Color color = AppColors.textClorColor}) => TextStyle(
  fontSize: size,
  color: color,
  fontWeight: FontWeight.w400,
);

TextStyle mediumText(double size, {Color color = AppColors.textClorColor}) => TextStyle(
  fontSize: size,
  color: color,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);

TextStyle semiBoldText(double size, {Color color = AppColors.textClorColor}) => TextStyle(
  fontSize: size,
  color: color,
  fontFamily: 'Poppins',
  fontWeight: Platform.isIOS?FontWeight.w500:FontWeight.w600,
);

TextStyle boldText(double size, {Color color = AppColors.textClorColor}) => TextStyle(
  fontSize: size,
  fontFamily: 'Poppins',
  color: color,
  fontWeight: FontWeight.w700,
);

TextStyle extraBoldText(double size, {Color color = AppColors.textClorColor}) => TextStyle(
  fontSize: size,
  fontFamily: 'Poppins',
  color: color,
  fontWeight: FontWeight.w900,
);