import 'package:biddabari_new/core/utils/format_date.dart';
import 'package:biddabari_new/features/AllCourse/presentation/controller/AllCourse_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/common/widgets/text/expandeable_text.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import 'course_details_idecator.dart';


class CurriculumComponent extends StatelessWidget {
  final AllCourseController? controller;
  const CurriculumComponent({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 12,),
        // ///details
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 16),
        //   child: ExpandableText(
        //     text: 'This batch offers live, interactive sessions with expert instructors, covering essential topics like general knowledge, English, and Bangla. The focus is on conceptual clarity, consistent assessments, and strategic exam preparation.Participants will have access to detailed study materials, mock tests, and live doubt-solving',
        //     maxLines: 7,
        //   ),
        // ),
        SizedBox(height: 12,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // course duration
              CourseDetailsIdecator(
                title: 'Course Duration',
                value: '${controller!.detailsCategoryResponse!.value!.course!.duration_in_month??"0.0"}',
                icon: Assets.icons.clock.svg(color: Colors.grey),
              ),
              CourseDetailsIdecator(
                title: 'Course Level',
                value: 'Intermediate',
                icon: Assets.icons.level.svg(color: Colors.grey),
              ),
              CourseDetailsIdecator(
                title: 'Students Enrolled',
                value: '${controller!.detailsCategoryResponse!.value!.totalStudentEnrollments}',
                icon: Assets.icons.users.svg(color: Colors.grey),
              ),
              CourseDetailsIdecator(
                title: 'Total Exam',
                value: '${controller!.detailsCategoryResponse!.value!.course!.total_exam}',
                icon: Assets.icons.subtitle.svg(color: Colors.grey),
              ),
              CourseDetailsIdecator(
                title: 'Language',
                value: 'Bangla',
                icon: Assets.icons.language.svg(color: Colors.grey),
              ),




            ],
          ),
        ),
        SizedBox(height: 12,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Course Content',
                style: boldText(18),
              ),
              SizedBox(height: 12,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // circular number icon
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.3),
                              width: 1.5,
                            ),
                            color: const Color(0xFFF5F9FF),
                            boxShadow: [
                              BoxShadow(
                                color:
                                Colors.black.withOpacity(0.1),
                                spreadRadius: 0.5,
                                blurRadius: 0.5,
                              )
                            ]),
                        child: const Text(
                          '01',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // heading
                      Expanded(
                        child: Text(
                          'Course Section',
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  // content under first heading
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:controller!.detailsCategoryResponse!.value!.courseSec!.course_sections!
                        .map<Widget>((contentData) {
                      return ExpansionTile(
                        title:Padding(
                          padding: const EdgeInsets.only(
                              left: 0.0, top: 8.0),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      contentData.title??"",
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        overflow:
                                        TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),

                                ],
                              ),

                              const SizedBox(height: 4),

                              // Duration under title
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0.0),
                                child: Text(
                                  contentData.available_at??"",
                                  style: const TextStyle(
                                      fontSize: 13.9,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                        children:contentData!.course_section_contents!.map((toElement){
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 40.0, top: 8.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    // blue circle icon before title
                                    const Icon(Icons.circle,
                                        color: Color(0xFF01A437),
                                        size: 12),
                                    const SizedBox(width: 8),

                                    // title
                                    Expanded(
                                      child: Text(
                                        contentData.title??"",
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          overflow:
                                          TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),

                                    // play button
                                    GestureDetector(
                                      onTap: () {

                                        contentData!.is_paid==0?
                                        context.pushNamed(Routes.videoContentPage,extra: {
                                          "courseSectionContent":toElement,
                                          "isCourseExam":true
                                        }):null;
                                      },
                                      child:  Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.0),
                                        child: Icon(
                                            Icons.play_circle_fill,
                                            color:contentData!.is_paid==0? Color(0xFF0961F5):Colors.grey,
                                            size: 24),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 4),

                                // Duration under title
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0),
                                  child: Text(
                                    contentData.available_at??"",
                                    style: const TextStyle(
                                        fontSize: 13.9,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                        
                        

                    }).toList(),
                  ),
                ],
              ),

              Divider(
                height: 30,
                color: Colors.grey.withOpacity(0.1),
                thickness: 1.5,
              ),

              // Second heading only


              // See All button
              GestureDetector(
                onTap: () {

                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // text see all
                    Text(
                      'Buy to see all',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // right icon
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 24,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
