import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:biddabari_new/features/AllCourse/presentation/controller/AllCourse_controller.dart';
import 'package:biddabari_new/features/AllCourse/presentation/widget/routine_row.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/color/app_colors.dart';

class RoutinComponent extends StatelessWidget {
  final AllCourseController? controller;
  const RoutinComponent({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: const EdgeInsets.only(
          left: 10, right: 10, top: 20),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey.withOpacity(0.5),
            width: 1.2),
        borderRadius: BorderRadius.circular(6),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              spreadRadius: 1.5,
              offset: Offset(5, 12)
          ),
        ],
      ),
      child: Column(
        children: [
          // column heading
          Row(
            children: [
              // heading
              Expanded(
                flex: 1,
                child: Text('#',
                    style: boldText(18)),
              ),

              Expanded(
                flex: 3,
                child: Text('Topic',
                    style:  boldText(18)),
              ),

              Expanded(
                flex: 3,
                child: Text('Date',
                    style: boldText(18)),
              ),

              Expanded(
                flex: 2,
                child: Text('Time',
                    style:  boldText(18)),
              ),
            ],
          ),

          Divider(
            color: Colors.grey.withOpacity(0.5),
            thickness: 1.2,
            height: 40,
          ),

          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                const EdgeInsets.only(bottom: 20.0),
                child: RoutineRow()
              );
            },
          ),
        ],
      ),
    );
  }
}
