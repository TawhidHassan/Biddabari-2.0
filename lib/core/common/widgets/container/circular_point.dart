import 'package:flutter/material.dart';

class CircularPoint extends StatelessWidget {
  final Color color;

  const CircularPoint({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: color,
          width: 0.5,
        ),
      ),
      child: Container(
        height: 14,
        width: 14,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
