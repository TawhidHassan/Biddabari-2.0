import 'package:biddabari_new/features/Notice/data/models/Notice/Notice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/common/widgets/Button/custom_button.dart';
import '../../../../core/common/widgets/Image/full_image.dart';
import '../../../../core/common/widgets/card/course_card.dart';
import '../../../../core/common/widgets/container/discount_badge.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/utils/format_date.dart';

class NoticeDetailsPage extends StatelessWidget {
  final Notice? notice;
  const NoticeDetailsPage({super.key,  this.notice});

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
       title: Text('Notice Details'),
     ),
      body: Container(
        height: 1.0.sh,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              width: 1.0.sw,
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)),
                  border: Border.all(color: AppColors.primarySlate300)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notice!.title??"",style: boldText(14),),
                  Text( getCustomFormattedDateTime(notice!.created_at??"",'yyy MMM dd h:mm a'),style: boldText(11,color: AppColors.primaryColor),),
                ],
              ),
            ),
            Container(
              width: 1.0.sw,
              height: 1.0.sh,
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12)),

              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(notice!.title??'',style: boldText(18,color: textColor),),
                  SizedBox(height: 8,),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ImageFullScreen(image:notice!.image)),
                      );
                    },
                    child: CachedNetworkImage(
                      imageUrl: notice!.image??"",
                      errorWidget: (context, url, error){
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Image.asset("assets/images/biddabari-logo.png"),
                        );
                      },
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      imageBuilder: (context, image) =>
                          Container(
                            height: 500,
                            width: 0.9.sw,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: image,
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                    ),
                  ),


                  SizedBox(height: 8,),
                  Html(
                    data:notice!.body??"",
                    onLinkTap: (url, _, __) async {
                      if (await canLaunch(url!)) {
                        await launch(
                          url,
                        );
                      }
                    },
                  ),
                  Text(getCustomFormattedDateTime(notice!.updated_at??'','yyy-MMM-dd h:mm a').toString(),style: boldText(12,color: AppColors.primaryColor),),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}


