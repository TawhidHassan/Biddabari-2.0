import 'package:flutter/material.dart';

class PopularCategoryCard extends StatelessWidget {
  const PopularCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 33),
      margin: EdgeInsets.only(right: 12),
      height: 30,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.00, -0.02),
          end: Alignment(-1, 0.02),
          colors: [Color(0xFFAA076B), Color(0xFF61045F)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Center(
        child: Text(
          'বিসিএস ',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
