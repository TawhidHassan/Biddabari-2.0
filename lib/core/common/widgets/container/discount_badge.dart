import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountBadge extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final double? radius;
  final double? textSize;

  const DiscountBadge({
    super.key,
    required this.text,
    this.backgroundColor = const Color(0xFFFFEEE8),
    this.foregroundColor = const Color(0xFFEB6A20), this.radius=0, this.textSize=10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius!)
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: textSize!.sp,
          color: foregroundColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
