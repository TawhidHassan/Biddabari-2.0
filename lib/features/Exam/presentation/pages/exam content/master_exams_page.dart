
import 'package:biddabari_new/core/routes/route_path.dart';
import 'package:biddabari_new/features/Exam/presentation/controller/Exam_controller.dart';
import 'package:biddabari_new/features/Exam/presentation/widget/my_exam_card.dart';
import 'package:biddabari_new/features/More/presentation/widget/my_order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/widgets/empty/empty_widget.dart';
import '../../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../../core/config/util/text_style.dart';



class MasterExamsPage extends StatelessWidget {
  final String? id;
  const MasterExamsPage({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<ExamController>().getMasterExam(int.parse(id!));
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Master Exams"),
      ),
      body: SizedBox(
        height: 1.0.sh,
        width: 1.0.sw,
        child: GetBuilder<ExamController>(
          assignId: true,
          builder: (controller) {
            return Obx(() {
              return

                controller.circuler.value?
              LoadingWidget():
              controller.masterExamReponse.value!.exams!.isEmpty?EmptyWidget():
              Container(
                height: 1.0.sh,
                width: 1.0.sw,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child:GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 8/8,
                  ),
                  itemCount: controller.masterExamReponse.value!.exams!.length,
                  itemBuilder: (context, indexx) {
                    return MyExamCard(exam: controller.masterExamReponse.value!.exams![indexx],);
                  },
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
