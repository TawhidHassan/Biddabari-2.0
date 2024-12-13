import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/features/Teacher/data/models/Teacher/Teacher.dart';
import 'package:biddabari_new/features/Teacher/presentation/controller/Teacher_controller.dart';
import 'package:biddabari_new/features/Teacher/presentation/pages/teacher_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/common/widgets/container/horizontal_category.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../widget/teacher_course_card.dart';

class TeacherDetailsPage extends StatelessWidget {
  final int? teacherId;

  const TeacherDetailsPage({super.key, this.teacherId});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<TeacherController>().getTeacherDetails(teacherId!);
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
        title: Text('Teacher details'),
      ),
      body: GetBuilder<TeacherController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return controller.teacherDetailsLoading.value?LoadingWidget():
            Container(
              height: 1.0.sh,
              width: 1.0.sw,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                      color: Colors.white,
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl:ApiEndpoint.imageBaseUrl+controller.teacherDetailsResponse.value!.teacher!.image.toString(),
                            placeholder: (context, url) => LoadingWidget(),
                            errorWidget: (context, url, error){
                              return CircleAvatar(
                                radius: 32,
                              );
                            },
                            imageBuilder: (context, image) =>  CircleAvatar(
                              radius: 70,
                              backgroundImage: image,
                            ),
                          ),

                          const SizedBox(height: 6),
                          // name
                          Text(controller.teacherDetailsResponse!.value!.teacher!.firstName??'', style: boldText(21),),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(controller.teacherDetailsResponse!.value!.teacher!.subject??'',
                              style: boldText(13, color: Color(0xFF545454)),textAlign: TextAlign.center,),
                          ),

                          const SizedBox(height: 18),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 32),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //
                          //       // total course
                          //       Column(
                          //         mainAxisSize: MainAxisSize.min,
                          //         children: [
                          //           Text(
                          //             '12',
                          //             style: boldText(17),
                          //           ),
                          //           Text(
                          //             'Total Course',
                          //             style: semiBoldText(
                          //                 12, color: Color(0xFF545454)),
                          //           ),
                          //         ],
                          //       ),
                          //       Column(
                          //         mainAxisSize: MainAxisSize.min,
                          //         children: [
                          //           Text(
                          //             '12',
                          //             style: boldText(17),
                          //           ),
                          //           Text(
                          //             'Completed',
                          //             style: semiBoldText(
                          //                 12, color: Color(0xFF545454)),
                          //           ),
                          //         ],
                          //       ),
                          //       Column(
                          //         mainAxisSize: MainAxisSize.min,
                          //         children: [
                          //           Text(
                          //             '12',
                          //             style: boldText(17),
                          //           ),
                          //           Text(
                          //             'Ongoing',
                          //             style: semiBoldText(
                          //                 12, color: Color(0xFF545454)),
                          //           ),
                          //         ],
                          //       ),
                          //
                          //
                          //       // completed
                          //     ],
                          //   ),
                          // ),

                        ],
                      ),
                    ),
                  ),
                  // SliverToBoxAdapter(
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 12.0, vertical: 12),
                  //     child: Text(
                  //       controller.teacherDetailsResponse.value!.teacher!.bio??"Bio not found",
                  //       style: mediumText(13, color: Color(0xFFA0A4AB)),
                  //       textAlign: TextAlign.center,),
                  //   ),
                  // ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 12),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                            width: 1.0.sw,
                            child: Wrap(
                              direction: Axis.vertical,
                              alignment: WrapAlignment.spaceBetween,
                              runAlignment: WrapAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.teacherAboutClick.value=false;
                                  },
                                  child: HorizontalCategoryCard(
                                    height: 40,
                                    textSize: 18,
                                    active: !controller.teacherAboutClick.value, title: "Class",),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.teacherAboutClick.value=true;
                                  },
                                  child: HorizontalCategoryCard(
                                    height: 40,
                                    textSize: 18,
                                    active: controller.teacherAboutClick.value, title: "About",),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child:controller.teacherAboutClick.value?
                    Container(
                      width: 1.0.sw,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 12,),
                          Center(child: Text('About ${controller.teacherDetailsResponse!.value!.teacher!.firstName??''}', style: boldText(21),)),
                          SizedBox(height: 6,),
                          Text(controller.teacherDetailsResponse.value!.teacher!.description??'',
                            style: mediumText(12,color: Color(0xFF5D5A6F)),textAlign: TextAlign.start,),

                          SizedBox(height: 24,),

                          Center(child: Text('Certification', style: boldText(21),)),
                          SizedBox(height: 6,),
                          Text(controller.teacherDetailsResponse.value!.teacher!.github??'',
                            style: mediumText(12,color: Color(0xFF5D5A6F)),textAlign: TextAlign.start,),
                          SizedBox(height: 24,)

                        ],
                      ),
                    )
                        :
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 0),
                          child: Text("Free class",style: boldText(18),),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              controller.teacherDetailsResponse.value!.teacher!.teacher_intro_video==null?SizedBox():
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => TeacherVideo(
                                     videoUrl: controller.teacherDetailsResponse.value!.teacher!.teacher_intro_video,
                                     thumnilUrl: controller.teacherDetailsResponse.value!.teacher!.teacher_intro_banner??"",
                                    ),
                                    )
                                  );
                                },
                                child: CachedNetworkImage(
                                  imageUrl:ApiEndpoint.imageBaseUrl+controller.teacherDetailsResponse.value!.teacher!.teacher_intro_banner.toString(),
                                  placeholder: (context, url) => Skeletonizer(
                                    enabled: true,
                                      child: Container(
                                    height: 200,
                                    width: 1.0.sw,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      image: DecorationImage(
                                          image: Assets.images.course.provider()
                                      ),
                                    ),
                                    child: Center(child: Icon(Icons.play_arrow_outlined),),
                                  )),
                                  errorWidget: (context, url, error){
                                    return Container(
                                      height: 200,
                                      width: 1.0.sw,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                        image: DecorationImage(
                                            image: Assets.images.course.provider()
                                        ),
                                      ),
                                      child: Center(child: Icon(Icons.play_arrow_outlined),),
                                    );
                                  },
                                  imageBuilder: (context, image) =>  Container(
                                    height: 200,
                                    width: 1.0.sw,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                        image: DecorationImage(
                                            image: image
                                        )
                                    ),
                                  ),
                                ),
                              ),


                              SizedBox(
                                width: 1.0.sw,
                                child: Row(
                                  children: [
                                    controller.teacherDetailsResponse.value!.teacher!.demo_video_1==null?SizedBox():
                                    Expanded(
                                      child:    InkWell(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => TeacherVideo(
                                                videoUrl: controller.teacherDetailsResponse.value!.teacher!.demo_video_1,
                                                thumnilUrl: controller.teacherDetailsResponse.value!.teacher!.demo_banner_1??"",
                                              ),
                                              )
                                          );
                                        },
                                        child: CachedNetworkImage(
                                          imageUrl:ApiEndpoint.imageBaseUrl+controller.teacherDetailsResponse.value!.teacher!.demo_banner_1.toString(),
                                          placeholder: (context, url) => Skeletonizer(
                                              enabled: true,
                                              child: Container(
                                                height: 200,
                                                width: 1.0.sw,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(6),
                                                  image: DecorationImage(
                                                      image: Assets.images.course.provider()
                                                  ),
                                                ),
                                                child: Center(child: Icon(Icons.play_arrow_outlined),),
                                              )),
                                          errorWidget: (context, url, error){
                                            return Container(
                                              height: 200,
                                              width: 1.0.sw,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(6),
                                                image: DecorationImage(
                                                    image: Assets.images.course.provider()
                                                ),
                                              ),
                                              child: Center(child: Icon(Icons.play_arrow_outlined),),
                                            );
                                          },
                                          imageBuilder: (context, image) =>  Container(
                                            height: 200,
                                            width: 1.0.sw,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(6),
                                                image: DecorationImage(
                                                    image: image
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 6,),
                                    controller.teacherDetailsResponse.value!.teacher!.demo_video_2==null?SizedBox():
                                    Expanded(
                                      child:    InkWell(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => TeacherVideo(
                                                videoUrl: controller.teacherDetailsResponse.value!.teacher!.demo_video_2,
                                                thumnilUrl: controller.teacherDetailsResponse.value!.teacher!.demo_banner_2??"",
                                              ),
                                              )
                                          );
                                        },
                                        child: CachedNetworkImage(
                                          imageUrl:ApiEndpoint.imageBaseUrl+controller.teacherDetailsResponse.value!.teacher!.demo_banner_2.toString(),
                                          placeholder: (context, url) => Skeletonizer(
                                              enabled: true,
                                              child: Container(
                                                height: 200,
                                                width: 1.0.sw,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(6),
                                                  image: DecorationImage(
                                                      image: Assets.images.course.provider()
                                                  ),
                                                ),
                                                child: Center(child: Icon(Icons.play_arrow_outlined),),
                                              )),
                                          errorWidget: (context, url, error){
                                            return Container(
                                              height: 200,
                                              width: 1.0.sw,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(6),
                                                image: DecorationImage(
                                                    image: Assets.images.course.provider()
                                                ),
                                              ),
                                              child: Center(child: Icon(Icons.play_arrow_outlined),),
                                            );
                                          },
                                          imageBuilder: (context, image) =>  Container(
                                            height: 200,
                                            width: 1.0.sw,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(6),
                                                image: DecorationImage(
                                                    image: image
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),



                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 0),
                          child: Text("Courses",style: boldText(18),),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.teacherDetailsResponse.value!.latestCourses!.length,
                            itemBuilder: (context,index){
                            return TeacherCourseCard(course:controller.teacherDetailsResponse.value!.latestCourses![index] ,);
                          }),
                        ),
                      ],
                    ),
                  )


                ],
              ),
            );
          });
        },
      ),
    );
  }
}
