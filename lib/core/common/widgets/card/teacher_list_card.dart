import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../config/color/app_colors.dart';
import '../../../config/util/text_style.dart';
import '../../../custom_assets/assets.gen.dart';
import '../../data/user/User.dart';


class TeacherListCard extends StatelessWidget {
  final User? teacher;
  const TeacherListCard({super.key, this.teacher});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0.sw,
      margin: EdgeInsets.only(bottom: 20),
      decoration: ShapeDecoration(
        color: AppColors.primaryBackground,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius
                .circular(7)),

      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex:3,
                  child: CachedNetworkImage(
                    imageUrl:ApiEndpoint.imageBaseUrl+teacher!.image.toString(),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error){
                      return Image.asset("assets/images/biddabari-logo.png");
                    },
                    imageBuilder: (context, image) =>  Container(
                      height: 95,
                      width: 79,
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: image,
                              fit: BoxFit.contain
                          )
                      ),
                    ),
                  )
              ),
              SizedBox(width: 8,),
              Expanded(
                  flex: 9,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(teacher!.firstName??'Name not found',style: boldText(14),),
                      SizedBox(height: 4,),
                      Text(teacher!.subject??'',style: semiBoldText(10,color: Color(0xFF777777)),),
                      SizedBox(height: 6,),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 12,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),

                    ],
                  )
              )
            ],
          ),
          SizedBox(height: 20,),
          Divider(
            height: 1,
            color: Color(0xFFE8F1FF),
          )
        ],
      ),
    );
  }
}
