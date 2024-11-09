
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/empty/empty_widget.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../CourseProgress/presentation/controller/CourseProgress_controller.dart';
import '../widget/favoraite_question_card.dart';

class FavoraiteQuestion extends StatelessWidget {
  const FavoraiteQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<CourseProgressController>().getMyFavoraiteQuestion();
    });
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: Padding(
              padding: EdgeInsets.all(18),
              child: Assets.icons.backArrow.svg()),
        ),
        title: Text("Favorite Question"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        child: GetBuilder<CourseProgressController>(
          assignId: true,
          builder: (controller) {
            return Obx(() {
              return controller.saveQuesCirculer.value?
              LoadingWidget():
              controller.questionSaveResponse.value!.questions!.isEmpty?
                  Center(child: EmptyWidget(title: "There has no questions",)):
              RefreshIndicator(
                onRefresh: ()async{
                  await Future.delayed(const Duration(seconds: 1));
                  Future.delayed(Duration.zero, () {
                    Get.find<CourseProgressController>().getMyFavoraiteQuestion();
                  });
                },
                child: ListView.builder(
                  itemCount: controller.questionSaveResponse.value!.questions!.length,
                    itemBuilder: (context,index){
                    return FavoraiteQuestionCard(controller: controller,question:controller.questionSaveResponse.value!.questions![index].question_store ,);
                    }
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
