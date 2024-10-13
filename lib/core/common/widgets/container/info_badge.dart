import 'package:flutter/material.dart';

import '../../../config/color/app_colors.dart';

class InfoBadge extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double verticalPadding;
  final double horizontalPadding;

  const InfoBadge({
    super.key,
    required this.text,
    this.color = const Color(0xFF167F71),
    this.fontWeight = FontWeight.w500,
    this.verticalPadding = 3,
    this.horizontalPadding = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
