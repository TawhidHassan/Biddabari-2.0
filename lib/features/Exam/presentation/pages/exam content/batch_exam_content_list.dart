
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import '../../../../../core/common/widgets/empty/empty_widget.dart';
import '../../../../../core/custom_assets/assets.gen.dart';
import '../../../../../core/routes/route_path.dart';
import '../../../../CourseProgress/presentation/controller/CourseProgress_controller.dart';
import '../../../../CourseProgress/presentation/widget/course_content_card.dart';
import '../../../data/models/BatchExam/BatchExamSection.dart';


class BatchExamContentListPage extends StatelessWidget {
  final BatchExamSection? batchExamSection;
  const BatchExamContentListPage({Key? key, this.batchExamSection}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
        title: Text(batchExamSection!.title!),
      ),
      body: Container(
        height: 1.0.sh,
        width: 1.0.sw,
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
        child: GetBuilder<CourseProgressController>(
          assignId: true,
          builder: (controller) {
            return batchExamSection!.batch_exam_section_contents!.isEmpty?EmptyWidget(): ListView.builder(
                itemCount:batchExamSection!.batch_exam_section_contents!.length,
                itemBuilder: (context, index) {
                  return CourseContentCard(
                    onTap: (){
                      Logger().w(batchExamSection!.batch_exam_section_contents![index].hasClassXm!);
                      if(batchExamSection!.batch_exam_section_contents![index].hasClassXm!=null&&batchExamSection!.batch_exam_section_contents![index].hasClassXm!=0){
                        context.pushNamed(Routes.classExamPage,extra: {
                          "courseSectionContent":batchExamSection!.batch_exam_section_contents![index],
                          "isCourseExam":false
                        },
                        );

                      }
                      else if(batchExamSection!.batch_exam_section_contents![index].contentType=="video"){
                       context.pushNamed(Routes.videoContentPage,extra: {
                         "courseSectionContent":batchExamSection!.batch_exam_section_contents![index],
                         "isCourseExam":true
                       },
                       );
                      }
                     else if(batchExamSection!.batch_exam_section_contents![index].contentType=="note"){
                       context.pushNamed(Routes.noteContentPage,extra: {
                        "courseSectionContent":batchExamSection!.batch_exam_section_contents![index],
                        "isive":false,
                        "isLink":false
                        },
                      );

                      }
                     else if(batchExamSection!.batch_exam_section_contents![index].contentType=="pdf"){
                        context.pushNamed(Routes.pdfContentPage,extra: batchExamSection!.batch_exam_section_contents![index]);
                      }
                     else if(batchExamSection!.batch_exam_section_contents![index].contentType=="exam"){
                        context.pushNamed(Routes.examContentPage,extra:{
                          "courseSectionContent":batchExamSection!.batch_exam_section_contents![index],
                          "isCourseExam":true
                        });

                      }
                      else if(batchExamSection!.batch_exam_section_contents![index].contentType=="written_exam"){
                        print(batchExamSection!.batch_exam_section_contents![index].examDurationInMinutes);
                        context.pushNamed(Routes.writtenExamContentPage,extra:{
                          "courseSectionContent":batchExamSection!.batch_exam_section_contents![index],
                          "isCourseExam":true
                        });
                      }

                    },
                    title: batchExamSection!.batch_exam_section_contents![index].title!,
                    subTitle: batchExamSection!.batch_exam_section_contents![index].contentType=="written_exam"?
                    "Written Exam"
                        :
                    batchExamSection!.batch_exam_section_contents![index].contentType??"",
                  );
                }
            );
          },
        ),
      ),
    );
  }
}
