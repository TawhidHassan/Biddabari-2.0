
import 'package:biddabari_new/features/Exam/data/models/Question/Question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
              Skeletonizer(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView.builder(
                        itemCount: 12,
                        itemBuilder: (context,index){
                          return Container(
                            margin: EdgeInsets.only(bottom: 12),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("dhbdhdbhdbdhb dhdbhd dhbdh dhbdg d dg dgd gd dg "),
                                SizedBox(height: 12,),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  margin: EdgeInsets.only(bottom: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.grey.shade200)
                                  ),
                                  child: Text("dhbdhdbhjd ndjndjdbdhbdhdb "),
                                ),Container(
                                  padding: EdgeInsets.all(4),
                                  margin: EdgeInsets.only(bottom: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.grey.shade200)
                                  ),
                                  child: Text("dhbdhdbhjd ndjndjdbdhbdhdb "),
                                ),Container(
                                  padding: EdgeInsets.all(4),
                                  margin: EdgeInsets.only(bottom: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.grey.shade200)
                                  ),
                                  child: Text("dhbdhdbhjd ndjndjdbdhbdhdb "),
                                ),Container(
                                  padding: EdgeInsets.all(4),
                                  margin: EdgeInsets.only(bottom: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.grey.shade200)
                                  ),
                                  child: Text("dhbdhdbhjd ndjndjdbdhbdhdb "),
                                ),

                              ],
                            ),
                          );
                        }
                    ),
                  )
              ):
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
