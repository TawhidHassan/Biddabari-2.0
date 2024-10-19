import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/common/widgets/Button/custom_button.dart';
import '../../../../core/common/widgets/card/course_card.dart';
import '../../../../core/common/widgets/container/discount_badge.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';

class JobPage extends StatelessWidget {
  const JobPage({super.key});

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
       title: Text('Job Circular'),
     ),
      body: Container(
        height: 1.0.sh,
        width: 1.0.sw,
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              childAspectRatio: 4 / 4,
            mainAxisExtent: 220
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                context.pushNamed(Routes.jobDetailsPage);
              },
              child: Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                  shadows: [
                    BoxShadow(
                      color: Color(0x26A8A4A4),
                      blurRadius: 15,
                      offset: Offset(0, 8),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: CachedNetworkImage(
                        imageUrl:"course!.banner!",
                        placeholder: (context, url) => LoadingWidget(),
                        errorWidget: (context, url, error){
                          return Container(
                            height: 300,
                            width: 1.0.sw,
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4) ),
                                image: DecorationImage(
                                    image: Assets.images.course.provider(),
                                    fit: BoxFit.fill
                                )
                            ),
                          );
                        },
                        imageBuilder: (context, image) =>
                            Container(
                              height: 300,
                              width: double.infinity,
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4) ),
                                  image: DecorationImage(
                                      image: image,
                                      fit: BoxFit.cover
                                  )
                              ),
                              child: Container(
                                width: 19,
                                height: 19,
                                decoration: ShapeDecoration(
                                  shape: OvalBorder(
                                    side: BorderSide(width: 1, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                        ,
                      ),
                    ),
                    SizedBox(height: 8,),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DiscountBadge(
                              textSize: 8,
                              text: 'Most Recent',
                              backgroundColor: Color(0xFF167F71),
                              foregroundColor: Colors.white,
                            ),
                            SizedBox(height: 4,),
                            Text(
                              "titjdbhdbdubdudble",
                              style:boldText(16,color: AppColors.textClorColor),
                              textAlign: TextAlign.start,
                              maxLines: 2, // Set a limit for lines
                              overflow: TextOverflow.ellipsis,
                            ),

                            const SizedBox(height: 8),
                            CustomButton(
                              height: 30,
                              width: 100,
                              onTap: (){},
                              isBorder: true,
                              textColor: AppColors.primaryColor,
                              title: "View Details",
                            )

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
