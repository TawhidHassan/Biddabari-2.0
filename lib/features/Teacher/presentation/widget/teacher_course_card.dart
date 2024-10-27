import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/features/AllCourse/data/models/course/Course.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class TeacherCourseCard extends StatelessWidget {
  final Course? course;
  const TeacherCourseCard({super.key, this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: CachedNetworkImage(
                imageUrl:ApiEndpoint.imageBaseUrl+course!.banner!.toString(),
                placeholder: (context, url) => LoadingWidget(),
                errorWidget: (context, url, error){
                  return Container(
                    height: 120,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4) ),
                        image: DecorationImage(
                            image: Assets.images.course.provider(),
                            fit: BoxFit.fill
                        )
                    ),
                  );
                },
                imageBuilder: (context, image) =>  Container(
                  height: 120,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4) ),
                      image: DecorationImage(
                          image: image,
                          fit: BoxFit.fill
                      )
                  ),
                ),
              ),
          ),
          Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(course!.title??"",maxLines: 2, style: boldText(16),),
                    SizedBox(height: 6,),
                    Text(course!.description??"",maxLines: 2, style: regularText(9,color: Color(0xFF777777)),),
                    SizedBox(height: 6,),
                    Text(course!.price.toString()+"Tk",maxLines: 1, style: regularText(24,color:AppColors.primaryColor),),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
