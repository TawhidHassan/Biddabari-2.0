import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:flutter/material.dart';


class RoutineRow extends StatelessWidget {
  const RoutineRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text('01',style: mediumText(12),),
        ),
        Expanded(
          flex: 3,
          child: Text('routine',style: boldText(12),),
        ),
        Expanded(
          flex: 3,
          child: Text('routine',style: semiBoldText(12),),
        ),
        Expanded(
          flex: 2,
          child: Text('routine',style: semiBoldText(12),),
        ),
      ],
    );
  }
}
