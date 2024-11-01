import 'package:flutter/material.dart';

import '../../../../core/common/widgets/text/rating_text.dart';


class PaymentSummeryItem extends StatelessWidget {
  final String item;
  final String? amount;
  final bool isBold;

  PaymentSummeryItem({
    super.key,
    required this.item,
    required this.amount,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingText(
          text: item,
          fontSize: 15,
          fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
          color: isBold ? Colors.black : Colors.black54,
        ),
        RatingText(
          text: '${amount}',
          fontSize: 15,
          fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
          color: isBold ? Colors.black : Colors.black54,
        ),
      ],
    );
  }
}
