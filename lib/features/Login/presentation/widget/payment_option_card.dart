import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/container/circular_point.dart';

class PaymentOptionCard extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;

  const PaymentOptionCard({
    super.key,
    required this.title,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: color,
          width: 0.8,
        ),
      ),
      child: ListTile(
        // circular point
        leading: CircularPoint(
          color: color,
        ),

        // title
        title: Text( title,style: boldText(14),),

        // logo
        trailing: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
