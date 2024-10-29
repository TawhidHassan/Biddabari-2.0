
import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../../core/config/util/text_style.dart';
import '../../../../AllCourse/data/models/courseSectionContent/CourseSectionContent.dart';
import '../../controller/CourseProgress_controller.dart';



class AssigmentScripPage extends StatelessWidget {
  final CourseSectionContent? courseSectionContent;

  const AssigmentScripPage({Key? key, this.courseSectionContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(ApiEndpoint.imageBaseUrl + courseSectionContent!.contentType!);
    Future.delayed(Duration.zero, () {
      Get.find<CourseProgressController>().getAssigmentScript(
          courseSectionContent!.id!);
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.keyboard_arrow_left)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Course Content"),
            Text(courseSectionContent!.title??'',style:semiBoldText(12,color: AppColors.textClorColor),),
          ],
        ),
      ),
      body: Container(
        height: 1.0.sh,
        width: 1.0.sw,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: GetBuilder<CourseProgressController>(
          assignId: true,
          builder: (controller) {
            return Obx(() {
              return controller.circuler.value?LoadingWidget():
              controller.assigmentScriptResponse.value!.sectionContent!.featured_pdf==""?
                  Center(child: Text("Please Submit you Assignment First",style: boldText(16),),)
                  :
              Container(
                  child: PDF().cachedFromUrl(
                    ApiEndpoint.imageBaseUrl + controller.assigmentScriptResponse.value!.sectionContent!.featured_pdf!,
                    placeholder: (double progress) =>
                        Center(child: Text('$progress %')),
                    errorWidget: (dynamic error) =>
                        Center(child: Text(error.toString())),
                  )

              );
            });
          },
        ),
      ),
    );
  }
}
