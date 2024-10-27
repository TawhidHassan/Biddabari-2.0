import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

import '../../../config/color/app_colors.dart';
import '../../../config/util/text_style.dart';
import '../../../custom_assets/assets.gen.dart';
import '../../../routes/route_path.dart';
import '../../data/user/User.dart';


class TeacherCard extends StatelessWidget {
  final User? teacher;
  const TeacherCard({super.key, this.teacher});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.pushNamed(Routes.teacherDetailsPage,extra: teacher!.id);
      },
      child: Container(
        width: 160,
        margin: EdgeInsets.only(right: 16),
        decoration: ShapeDecoration(
          color: AppColors.primaryBackground,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius
                  .circular(7)),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [

                SizedBox(
                  height: 130,
                  child: Container(
                    height: 180,
                    width: 1.0.sw,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(4),
                            topLeft: Radius.circular(4)),
                        image: DecorationImage(
                            image: Assets.images.teacherBg
                                .provider(),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                ),
                Positioned(
                    top: -50,
                    child:


                    CachedNetworkImage(
                      imageUrl:ApiEndpoint.imageBaseUrl+teacher!.image.toString(),
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error){
                        return Assets.images.teacher.image(
                            height: 180);
                      },
                      imageBuilder: (context, image) => Image(image: image,height: 180),
                    )),
              ],
            ),
            Container(

              width: double.infinity,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start,
                      children: [

                        Text(
                          teacher!.firstName??'Name not found',
                          maxLines: 1,
                          style: boldText(16),
                        ),
                        SizedBox(height: 2,),

                        Text(
                          teacher!.subject??'',
                          maxLines: 1,
                          style: boldText(
                              12, color: Color(0xFF70747E)),
                        ),
                        SizedBox(height: 12,),

                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
