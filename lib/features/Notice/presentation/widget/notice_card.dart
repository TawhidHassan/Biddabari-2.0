import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/routes/route_path.dart';
import 'package:biddabari_new/features/BookStore/data/models/book/Book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/container/discount_badge.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';




class NoticeCard extends StatelessWidget {

  const NoticeCard({super.key,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // context.pushNamed(Routes.bookDetailsPage,extra:course );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // image
            Expanded(
              flex: 3,
              child: CachedNetworkImage(
                imageUrl:ApiEndpoint.imageBaseUrl+"course!.banner!",
                placeholder: (context, url) => LoadingWidget(),
                errorWidget: (context, url, error){
                  return Container(
                    height: 110,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Assets.images.course.provider(),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                },
                imageBuilder: (context, image) =>
                    Container(
                      height: 110,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: image,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
              ),
            ),
            const SizedBox(width: 10),


            // title
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.only(right: 18,top: 12,bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      "Bank Job Special Care Live Batch-2",
                      textAlign: TextAlign.justify,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 8),

                    RichText(
                      text: TextSpan(
                        style: semiBoldText(14),
                        children: <TextSpan>[
                          TextSpan(text: 'Date: ',),
                          TextSpan(text: '12/11/2021 ', style: TextStyle(color: Color(0xff167F71))),
                        ],
                      ),
                    ),

                    // price
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
