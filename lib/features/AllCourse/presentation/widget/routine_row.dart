import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:biddabari_new/features/AllCourse/data/models/routine_model.dart';
import 'package:flutter/material.dart';


class RoutineRow extends StatelessWidget {
  final RoutineModel? routineModel;
  final int? index;
  const RoutineRow({super.key, this.routineModel,this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text('${index!+1}',style: mediumText(12),),
        ),
        Expanded(
          flex: 3,
          child: Text("${routineModel!.content_name}",style: boldText(12),maxLines: 1,),
        ),
        Expanded(
          flex: 3,
          child: Text("${routineModel!.day}",style: semiBoldText(12),),
        ),
        Expanded(
          flex: 2,
          child: Text('${routineModel!.date_time!.split(" ").first.toString()}',style: semiBoldText(12),),
        ),
      ],
    );
  }
}
