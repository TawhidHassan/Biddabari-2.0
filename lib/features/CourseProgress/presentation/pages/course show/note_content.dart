import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/config/util/text_style.dart';
import '../../../../../core/custom_assets/assets.gen.dart';
import '../../../../AllCourse/data/models/courseSectionContent/CourseSectionContent.dart';
import '../../controller/CourseProgress_controller.dart';

class NoteContentPage extends StatelessWidget {
  final CourseSectionContent? courseSectionContent;
  final bool? isive,isLink;

  const NoteContentPage({Key? key, this.courseSectionContent, this.isive=false, this.isLink=false}) : super(key: key);

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
            Text("Course Content"),
            Text(courseSectionContent!.title??'',style:semiBoldText(12,),),
          ],
        ),
      ),
      body: Container(
        height: 1.0.sh,
        padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
        child: GetBuilder<CourseProgressController>(
          assignId: true,
          builder: (controller) {
            return isive!||isLink!?
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isive!?Text("Live start time: "+courseSectionContent!.liveStartTime.toString(),style: mediumText(14),):SizedBox(),
                isive!?Text("Live end time: "+courseSectionContent!.liveEndTime.toString(),style: mediumText(14),):SizedBox(),
                SizedBox(height: 12,),
                InkWell(
                    onTap: () async {
                      await launch(
                          isLink!?courseSectionContent!.regularLink??"":courseSectionContent!.liveLink??""
                      );
                    },
                    child: Text(isLink!?courseSectionContent!.regularLink??"":courseSectionContent!.liveLink??"",style: boldText(14,color: Colors.blueAccent),))
              ],
            ):
            // Text(courseSectionContent!.liveLink??"")
            Column(
              children: [
                InteractiveViewer(
                  child: Html(
                    data:courseSectionContent!.noteContent??"",
                    onLinkTap: (url, _, __) async {
                      if (await canLaunch(url!)) {
                        await launch(
                          url,
                        );
                      }
                    },),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
