import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/features/CourseProgress/presentation/controller/CourseProgress_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/empty/empty_widget.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../../AllCourse/data/models/courseSection/CourseSection.dart';
import '../widget/course_content_card.dart';

class CourseContentListPage extends StatelessWidget {
  final CourseSection? courseSection;
  const CourseContentListPage({super.key, this.courseSection});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
            padding: EdgeInsets.all(18),
          child: Assets.icons.backArrow.svg())
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Course Content List"),
            Text(courseSection!.title??'',style:semiBoldText(12),),
          ],
        ),
      ),
      body: Container(
        height: 1.0.sh,
        width: 1.0.sw,
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
        child: GetBuilder<CourseProgressController>(
          assignId: true,
          builder: (controller) {
            return courseSection!.course_section_contents!.isEmpty?EmptyWidget(): ListView.builder(
                itemCount:courseSection!.course_section_contents!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){

                    },
                    child:CourseContentCard(
                      onTap: (){
                        if(courseSection!.course_section_contents![index].contentType=="note"){
                          context.pushNamed(Routes.noteContentPage,extra: {
                            "courseSectionContent":courseSection!.course_section_contents![index],
                            "isive":false,
                            "isLink":false
                           },
                          );
                        }
                        else if(courseSection!.course_section_contents![index].contentType=="pdf"){
                          context.pushNamed(Routes.pdfContentPage,extra: courseSection!.course_section_contents![index]
                          );
                        }
                        else if(courseSection!.course_section_contents![index].contentType=="live"){
                          context.pushNamed(Routes.noteContentPage,extra: {
                            "courseSectionContent":courseSection!.course_section_contents![index],
                            "isive":true,
                            "isLink":false
                          },
                          );

                        }
                        else if(courseSection!.course_section_contents![index].contentType=="link"){
                          context.pushNamed(Routes.noteContentPage,extra: {
                            "courseSectionContent":courseSection!.course_section_contents![index],
                            "isive":false,
                            "isLink":true
                          },
                          );
                        }
                        else if(courseSection!.course_section_contents![index].contentType=="assignment"){
                          context.pushNamed(Routes.assismentContentPage,extra:courseSection!.course_section_contents![index]);

                        }
                      },
                      title: courseSection!.course_section_contents![index].title??"",
                      subTitle: courseSection!.course_section_contents![index].contentType??"",
                    ),
                  );
                }
            );
          },
        ),
      ),
    );
  }
}
