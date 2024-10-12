import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountBadge extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;

  const DiscountBadge({
    super.key,
    required this.text,
    this.backgroundColor = const Color(0xFFFFEEE8),
    this.foregroundColor = const Color(0xFFEB6A20),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10.sp,
          color: foregroundColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
