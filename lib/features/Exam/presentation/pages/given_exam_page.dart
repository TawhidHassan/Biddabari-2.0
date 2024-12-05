import 'dart:io';
import 'package:flutter/services.dart';

import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:flip_board/flip_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import 'dart:math';

import '../../../../core/common/widgets/Button/custom_button.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../../CourseProgress/presentation/controller/CourseProgress_controller.dart';
import '../widget/question_card.dart';
class GivenExamPage extends StatefulWidget {
  final String?id;
  final int?hasExam;
  final bool? isCourseExam;
  final bool? iswriitenExam;
  GivenExamPage({Key? key, this.id, this.hasExam, this.isCourseExam, this.iswriitenExam=false}) : super(key: key);

  @override
  State<GivenExamPage> createState() => _GivenExamPageState();
}

class _GivenExamPageState extends State<GivenExamPage> {
  var quesController= Get.find<CourseProgressController>();

  bool isValueGreaterThanComparison(int _value,_comparisonValue) {
    return _value > _comparisonValue;
  }

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero,(){
      Get.find<CourseProgressController>().onInit();
      Get.find<CourseProgressController>().getMyFavoraiteQuestion();
      Get.find<CourseProgressController>().fileList.value=[];
      Get.find<CourseProgressController>().getExamQuestions(widget.id!,widget.hasExam!,widget.isCourseExam!).then((value) {
        if(quesController.questionResponse.value!.exam!.contentType=="written_exam"){

          int lastMinute= getDifferentTime(quesController.questionResponse.value!.exam!.writtenEndTime);
          if(quesController.questionResponse.value!.exam!.writtenIsStrict==1&&lastMinute<int.parse(quesController.questionResponse.value!.exam!.writtenExamDurationInMinutes!)&&lastMinute>0){

            // Get.find<CourseProgressController>().currentTime.value=0;
            Get.find<CourseProgressController>().startTimer(lastMinute,widget.id!,context,widget.hasExam==0,widget.isCourseExam!);
            Logger().w("run this");
          }else{
            Logger().w("message");
            // Get.find<CourseProgressController>().currentTime.value=0;
            Get.find<CourseProgressController>().startTimer(int.parse(quesController.questionResponse.value!.exam!.writtenExamDurationInMinutes!),widget.id!,context,widget.hasExam==0,widget.isCourseExam!);
          }


        }else{
          int lastMinute= getDifferentTime(quesController.questionResponse.value!.exam!.examEndTime);
          Logger().i(quesController.questionResponse.value!.exam!.examEndTime);
          Logger().i(lastMinute);
          if(quesController.questionResponse.value!.exam!.examIsStrict==1&&lastMinute<quesController.questionResponse.value!.exam!.examDurationInMinutes!&&lastMinute>0){

            // Get.find<CourseProgressController>().currentTime.value=0;
            Get.find<CourseProgressController>().startTimer(lastMinute,widget.id!,context,widget.hasExam==0,widget.isCourseExam!);
            Logger().i("run this");
          }else{
            Logger().w("message");
            // Get.find<CourseProgressController>().currentTime.value=0;
            Get.find<CourseProgressController>().startTimer(quesController.questionResponse.value!.exam!.hasClassXm==1?quesController.questionResponse.value!.exam!.classExamDurationInMinutes!:quesController.questionResponse.value!.exam!.examDurationInMinutes!,widget.id!,context,widget.hasExam==0,widget.isCourseExam!);
          }
        }


      });
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // Logger().e(isValueGreaterThanComparison(10,20));

    return GetBuilder<CourseProgressController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.whiteColor,
              systemOverlayStyle: SystemUiOverlayStyle(
                // Status bar color
                statusBarColor: AppColors.whiteColor,
                // Status bar brightness (optional)
                statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
                statusBarBrightness: Brightness.dark, // For iOS (dark icons)
              ),
              leading: InkWell(
                  onTap: () {
                    // controller.submitExam(id, context,hasExam==0,isCourseExam!);
                    // Navigator.pop(context);

                    showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: SizedBox(
                              height: 140,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Want to Exit the exam!\nAfter that you cant give this exam! "),
                                  const SizedBox(height:20),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Get.find<CourseProgressController>().submitExam(widget.id, context,widget.hasExam==0,widget.isCourseExam!);
                                            context.pop();
                                            context.pop();

                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColors.primaryColor),
                                          child: const Text("Yes", style: TextStyle(color:
                                          Colors.white)),
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              print('no selected');
                                              context.pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                            ),
                                            child: const Text("No", style: TextStyle(color:
                                            Colors.black)),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });


                    // Fluttertoast.showToast(
                    //     msg: "Submit Your Exam",
                    //     toastLength: Toast.LENGTH_SHORT,
                    //     gravity: ToastGravity.BOTTOM,
                    //     timeInSecForIosWeb: 2,
                    //     backgroundColor: Colors.red,
                    //     textColor: Colors.white,
                    //     fontSize: 16.0
                    // );
                  },
                  child: Padding(
                      padding: EdgeInsets.all(18),
                      child: Assets.icons.backArrow.svg())),
              title: Text("Exam"),
            ),
            body: Container(
              height: 1.0.sh,
              width: 1.0.sw,
              child: Obx(() {
                return
                  controller.examCirculer.value ? LoadingWidget() :
                  controller.questionResponse.value!.error != null ?
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(controller.questionResponse.value!.error!, style: boldText(14),),
                        SizedBox(height: 16,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child:  CustomButton(
                            color: AppColors.textClorColor,
                            height: 48,
                            width: 1.0.sw,
                            textColor: Colors.white,
                            borderRadius: 12,
                            title: "See Ranking",
                            onTap: (){

                              // Navigator.pushNamed(context, RANKING_EXAM_PAGE,arguments: {
                              //   "id":id!.toString(),
                              //   "isCourseExam":isCourseExam
                              // });
                              context.pushNamed(Routes.rankExamPage,extra: {
                                "id": widget.id!.toString(),
                                "isCourseExam":widget.isCourseExam
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 12,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: CustomButton(
                            color: Colors.blueAccent,
                            height: 48,
                            width: 1.0.sw,
                            loading: controller.examSubmitCirculer.value,
                            title: "See Answer",
                            onTap: () {

                              // Navigator.pushNamed(context, SEE_ANSWER_PAGE,arguments: {
                              //   "id": id.toString(),
                              //   "isCourseExam":isCourseExam,
                              //   "iswriitenExam":iswriitenExam,
                              //   "hasClassXm":hasExam
                              // });

                              context.pushNamed(Routes.answerExamPage,extra: {
                                  "id": widget.id.toString(),
                                  "isCourseExam":widget.isCourseExam,
                                  "iswriitenExam":widget.iswriitenExam,
                                  "hasClassXm":widget.hasExam
                              });
                            },
                            borderRadius: 12,
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                      :
                  Column(
                    children: [
                      Container(
                        height: 107,
                        width: 1.0.sw,
                        margin: EdgeInsets.only(
                            left: 24,right: 24, top: 32),
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: Assets.images.examBg.provider(),
                              fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(12),
                            // border: Border.all(color: AppColors.primaryColor)
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          fit: StackFit.loose,
                          alignment: Alignment.topRight,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: 0.5.sw,
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Exam: "+
                                      controller.questionResponse.value!.exam!.title!,
                                      style: boldText(14),),
                                    SizedBox(height: 6,),
                                    Text(
                                        controller.questionResponse.value!.exam!
                                            .examTotalQuestions.toString()+" Question",
                                      style: mediumText(
                                          14, color: AppColors.orange400),),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: -12,
                              child: Assets.images.examImagePng.image(),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 107,
                          width: 1.0.sw,
                          margin: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 8),
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          decoration: BoxDecoration(
                              color: AppColors.orange400,
                              borderRadius: BorderRadius.circular(12),
                              // border: Border.all(color: AppColors.primaryColor)
                          ),
                          child:  FittedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                quesController.questionResponse.value!.exam!.contentType=="written_exam"?
                                FlipCountdownClock(
                                  digitSize: 32.sp,
                                  width: 60.w,
                                  height: 60.h,
                                  separatorColor: AppColors.whiteColor,
                                  hingeColor: Colors.white,
                                  backgroundColor: AppColors.blackColor,
                                  showBorder: true,
                                  duration: Duration(
                                      minutes:
                                      quesController.questionResponse.value!.exam!.writtenIsStrict==1
                                          &&
                                          getDifferentTime(quesController.questionResponse.value!.exam!.writtenEndTime!.toString())<int.parse(quesController.questionResponse.value!.exam!.writtenExamDurationInMinutes!)
                                          &&
                                          getDifferentTime(quesController.questionResponse.value!.exam!.writtenEndTime!.toString())>0
                                          ?

                                      getDifferentTime(quesController.questionResponse.value!.exam!.writtenEndTime!.toString())
                                          :
                                      int.parse(controller.questionResponse.value!.exam!.writtenExamDurationInMinutes!).toInt()
                                  ),
                                )
                                    :
                                FlipCountdownClock(
                                  digitSize: 32.sp,
                                  width: 60.w,
                                  height: 60.h,
                                  separatorColor: AppColors.whiteColor,
                                  hingeColor: Colors.white,
                                  backgroundColor: AppColors.blackColor,
                                  showBorder: true,
                                  duration: Duration(
                                      minutes:
                                      quesController.questionResponse.value!.exam!.examIsStrict==1
                                          &&
                                          getDifferentTime(quesController.questionResponse.value!.exam!.examEndTime!)<quesController.questionResponse.value!.exam!.examDurationInMinutes!
                                          &&
                                          getDifferentTime(quesController.questionResponse.value!.exam!.examEndTime!)>0?

                                      getDifferentTime(quesController.questionResponse.value!.exam!.examEndTime!)
                                          :
                                      widget.hasExam==1?
                                      controller.questionResponse.value!.exam!.classExamDurationInMinutes!
                                          :
                                      controller.questionResponse.value!.exam!.examDurationInMinutes??0
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 10,
                          child: Container(
                            margin: EdgeInsets.only(bottom:quesController.questionResponse.value!.exam!.contentType=="written_exam" ?0: 60),
                            child:quesController.questionResponse.value!.exam!.contentType=="written_exam"
                                ?
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                      widget.hasExam==0?
                                      controller.questionResponse.value!.exam!.questionStores!.length
                                          :
                                      controller.questionResponse.value!.exam!.questionStoresClassExam!.length,
                                      itemBuilder: (context, index) {
                                        return QuestionCard(
                                          controller: controller,
                                          question:  widget.hasExam==0?
                                          controller.questionResponse.value!.exam!.questionStores![index]
                                              :
                                          controller.questionResponse.value!.exam!.questionStoresClassExam![index],);
                                      }
                                  ),
                                  quesController.questionResponse.value!.exam!.contentType=="written_exam"
                                      ?
                                  Container(
                                      margin: EdgeInsets.only(right: 24,left: 24, top: 8,bottom: 8),
                                      padding: EdgeInsets.symmetric(horizontal: 24,vertical:12),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(color: AppColors.primarySlate100)
                                      ),
                                      child:ListView(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        children: [
                                          Text("Here Upload Your Answer\nPng Or Jpg Format",style: boldText(14,color: Colors.blueGrey),),
                                          SizedBox(height: 4,),
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

                                          CustomButton(
                                            color: AppColors.textClorColor,
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
                                                              color: AppColors.primarySlate100)
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
                                        ],
                                      )
                                  )
                                      :SizedBox(),

                                  SizedBox(height: 200,)


                                ],
                              ),
                            )
                                :
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                widget.hasExam==0?
                                controller.questionResponse.value!.exam!.questionStores!.length
                                    :
                                controller.questionResponse.value!.exam!.questionStoresClassExam!.length,
                                itemBuilder: (context, index) {
                                  return QuestionCard(
                                    controller: controller,
                                    question:  widget.hasExam==0?
                                    controller.questionResponse.value!.exam!.questionStores![index]
                                        :
                                    controller.questionResponse.value!.exam!.questionStoresClassExam![index],);
                                }
                            ),
                          )
                      ),



                    ],

                  );
              }),

            ),
            bottomSheet: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              height: 60,
              child:controller.questionResponse.value==null?SizedBox(): controller.questionResponse.value!.error != null  ?SizedBox(): CustomButton(
                color: AppColors.primaryColor,
                height: 48,
                width: 1.0.sw,
                loading: controller.examSubmitCirculer.value,
                title: "Submit",
                onTap: () {
                  if (!controller.examSubmitCirculer.value) {
                    controller.submitExam(widget.id, context,widget.hasExam==0,widget.isCourseExam!);
                  }
                  print(widget.id);
                },
                borderRadius: 12,
                textColor: Colors.white,
              ),
            ),

          );
        });
      },
    );
  }

  int getDifferentTime(String? lastTime) {
    DateTime currentTime = DateTime.now();
    String dateString = lastTime??DateTime.now().toString();
    DateTime dateTime = DateTime.parse(dateString);
    return (currentTime.difference(dateTime).inMinutes.abs())+1;


  }
}
