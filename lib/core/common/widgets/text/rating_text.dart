import 'dart:ui';

import 'package:flutter/material.dart';

class RatingText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final bool isLineThrough;

  const RatingText({
    super.key,
    required this.text,
    this.fontSize = 12,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black54,
    this.isLineThrough = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        decoration: isLineThrough ? TextDecoration.lineThrough : null,
        fontWeight: fontWeight
      ),
    );
  }
}
