import 'dart:ffi';
import 'dart:io';


import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../core/common/widgets/Button/custom_button.dart';
import '../../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../../core/config/util/text_style.dart';
import '../../../../AllCourse/data/models/courseSectionContent/CourseSectionContent.dart';
import '../../controller/CourseProgress_controller.dart';


class AssignmentContentPage extends StatelessWidget {
  final CourseSectionContent? courseSectionContent;

  const AssignmentContentPage({Key? key, this.courseSectionContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero,(){
      Get.find<CourseProgressController>().filePathList.value=[];
      Get.find<CourseProgressController>().fileList.value=[];
      Get.find<CourseProgressController>().getAssigmentTakenOrNot(courseSectionContent!.id!.toInt());
    });

    return GetBuilder<CourseProgressController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.keyboard_arrow_left)),
              centerTitle: false,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Course Content"),
                  Text(courseSectionContent!.title??'',style:semiBoldText(12,color: AppColors.textClorColor),),
                ],
              ),
            ),
            body:controller.circuler.value?LoadingWidget(): Container(
                height: 1.0.sh,
                width: 1.0.sw,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 16,
                                width: 5,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(width: 6,),
                              Text("সময়সূচী",
                                style: semiBoldText(16,),)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 12,),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                            color: AppColors.primarySlate25,
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("পরীক্ষার  নাম",
                              style: semiBoldText(16,),),
                            Text(courseSectionContent!.title ?? '',
                              style: boldText(16, color: AppColors.primaryColor),)
                          ],
                        ),
                      ),
                      SizedBox(height: 6,),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                            color: AppColors.primarySlate25,
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("পরীক্ষার ধরণ",
                              style: semiBoldText(16),),
                            Text(courseSectionContent!.contentType ?? '',
                              style: boldText(16, color: AppColors.primaryColor),)
                          ],
                        ),
                      ),

                      SizedBox(height: 6,),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                            color: AppColors.primarySlate25,
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("অ্যাসাইনমেন্ট শুরুর সময়",
                              style: semiBoldText(16,  ),),
                            Text(courseSectionContent!.assignmentStartTime??"",
                              style: boldText(16, color: AppColors.primaryColor),)
                          ],
                        ),
                      ),


                      SizedBox(height: 6,),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                            color: AppColors.primarySlate25,
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("অ্যাসাইনমেন্ট শেষের সময়",
                              style: semiBoldText(16, ),),
                            Text(
                              courseSectionContent!.assignmentEndTime??"",
                              style: boldText(16, color: AppColors.primaryColor),)
                          ],
                        ),
                      ),

                      SizedBox(height: 6,),
                      Container(
                        margin: EdgeInsets.only(bottom: 4),
                        padding: EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                          color: AppColors.primarySlate25,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("ফলাফল প্রকাশ",
                              style: semiBoldText(16, ),),
                            Text(
                              courseSectionContent!.assignmentResultPublishTime ?? '',
                              style: boldText(16, color: AppColors.primaryColor),)

                          ],
                        ),
                      ),


                      SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 16,
                                width: 5,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(width: 6,),
                              Text("বিস্তারিত",
                                style: semiBoldText(16, ),)
                            ],
                          ),
                        ],
                      ),

                      Html(data: courseSectionContent!.assignmentInstruction ??
                          ''),
                      SizedBox(height: 6,),
                      InkWell(
                        onTap: () {
                          // Navigator.pushNamed(context, PDF_CONTENT_PAGE,
                          //     arguments: {
                          //       "courseSectionContent": courseSectionContent
                          //     });
                        },
                        child: Row(
                          children: [
                            Text("অ্যাসাইনমেন্ট দেখুন", style: mediumText(14),),
                            SizedBox(width: 6,),
                            CircleAvatar(
                                backgroundColor: AppColors.primaryColor,
                                radius: 8,
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.white,
                                  size: 12,)),
                          ],
                        ),
                      ),
                      SizedBox(height: 6,),
                      controller.assigmentScriptResponse.value!.msg=="You already submitted assignment file"?
                      InkWell(
                        onTap: () {
                          // Navigator.pushNamed(context, ASSIGMENT_SCRIPT_PAGE,
                          //     arguments: {
                          //       "courseSectionContent": courseSectionContent
                          //     });
                        },
                        child: Row(
                          children: [
                            Text("See Script", style: mediumText(14),),
                            SizedBox(width: 6,),
                            CircleAvatar(
                                backgroundColor: AppColors.primaryColor,
                                radius: 8,
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.white,
                                  size: 12,)),
                          ],
                        ),
                      ):SizedBox(),
                      SizedBox(height: 12,),

                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                        ),
                        itemCount: controller.filePathList.value.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: ShapeDecoration(
                              color: Colors.blueGrey,
                              image: DecorationImage(
                                  image: FileImage(
                                      File(controller.filePathList.value[index])),
                                  fit: BoxFit.cover
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),

                            ),
                          );
                        },
                      ),
                      SizedBox(height: 12,),

                      getTime(
                          courseSectionContent!.assignmentEndTime.toString()) !=
                          "Not late" ?SizedBox():
                      controller.assigmentScriptResponse.value!.msg=="You already submitted assignment file"?SizedBox():
                      CustomButton(
                        height: 48,
                        width: 1.0.sw,
                        textColor: Colors.white,
                        borderRadius: 12,
                        title: "Upload Photo",
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 24),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: AppColors.primarySlate25)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(24),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                controller.filepicCamera();
                                                Navigator.pop(context);
                                              },
                                              child: CircleAvatar(
                                                radius: 32,
                                                child: Icon(Icons.camera_alt),
                                              ),
                                            ),
                                            SizedBox(width: 12,),
                                            InkWell(
                                              onTap: () {
                                                controller.filepic();
                                                Navigator.pop(context);
                                              },
                                              child: CircleAvatar(
                                                radius: 32,
                                                child: Icon(Icons.image),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                      SizedBox(height: 100,),
                    ],

                  ),
                )
            ),
            bottomSheet: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              height: 100,
              child:controller.examSubmitCirculer.value?LoadingWidget(): courseSectionContent!.assignmentEndTime == null
                  ? SizedBox()
                  :
              Column(
                children: [
                  controller.assigmentScriptResponse.value!.msg=="You already submitted assignment file"? Text("You already submitted assignment file",style: boldText(14),):SizedBox(),
                  SizedBox(height: 6,),
                  CustomButton(
                    color: getTime(
                        courseSectionContent!.assignmentEndTime.toString()) ==
                        "Not late"&&controller.assigmentScriptResponse.value!.msg!="You already submitted assignment file" ? AppColors.primaryColor : Colors.blueGrey,
                    height: 48,
                    width: 1.0.sw,
                    textColor: Colors.white,
                    borderRadius: 12,
                    title: getTime(
                        courseSectionContent!.assignmentEndTime.toString()) == "Not late"&&controller.assigmentScriptResponse.value!.msg!="You already submitted assignment file"
                        ? "Submit Assignment"
                        : "Assignment Has End",
                    onTap: () {
                       // print(getTime(
                       //     courseSectionContent!.assignmentEndTime.toString()));
                      if (getTime(courseSectionContent!.assignmentEndTime.toString()) == "Not late"&&controller.assigmentScriptResponse.value!.msg!="You already submitted assignment file"&&controller.filePathList.value.isNotEmpty) {
                        controller.submitAssisgment(courseSectionContent!.id,context);
                        print("ddd");
                      }else{

                      }
                      // controller.submitAssisgment(courseSectionContent!.id,context);
                    },
                  ),

                ],
              ),
            ),
          );
        });
      },
    );
  }

  String getTime(String? lastTime) {
    DateTime currentTime = DateTime.now();

    String dateString = lastTime!;
    DateTime dateTime = DateTime.parse(dateString);
    if (currentTime.isAfter(dateTime)) {
      return 'Late';
    } else {
      return 'Not late';
    }

    // return formattedTime.toString();
  }
}
