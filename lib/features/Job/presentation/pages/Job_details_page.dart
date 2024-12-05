import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/utils/format_date.dart';
import 'package:biddabari_new/features/Job/data/models/job_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import '../../../../core/common/widgets/Button/custom_button.dart';
import '../../../../core/common/widgets/Image/full_image.dart';
import '../../../../core/common/widgets/card/course_card.dart';
import '../../../../core/common/widgets/container/discount_badge.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class JobDetailsPage extends StatelessWidget {
  final JobModel? job;
  const JobDetailsPage({super.key,this.job});

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
       title: Text('Job Details'),
     ),
      body: Container(
        height: 1.0.sh,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              width: 1.0.sw,
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)),
                  border: Border.all(color: AppColors.primarySlate300)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(job!.jobTitle??'',style: boldText(14),),
                  Text(formatDateBydMMMYYYY(job!.createdAt!),style: boldText(11,color: AppColors.primaryColor),),
                ],
              ),
            ),
            Expanded(
              flex:9,
              child: Container(
                width: 1.0.sw,
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12)),

                ),
                child:job!.image!.contains(".pdf")?

                PDF(autoSpacing: true,enableSwipe: true).cachedFromUrl(job!.image!,
                  placeholder: (double progress) =>
                      Center(child: Text('$progress %')),
                  errorWidget: (dynamic error) =>
                      Center(child: Text(error.toString())),
                )
                    :
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ImageFullScreen(image:job!.image!)),
                    );
                  },
                  child: CachedNetworkImage(
                    imageUrl: job!.image!,
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
              ),
            )

          ],
        ),
      ),
    );
  }
}
