import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/custom_assets/assets.gen.dart';
import '../widget/blog_card.dart';

class BlogDetailsPage extends StatelessWidget {
  const BlogDetailsPage({super.key});

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
      title: Text('Blog Details'),
    ),
      body: Container(
        height: 1.0.sw,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Update",style: extraBoldText(14,color:Color(0xFF777777)),),
              SizedBox(height: 4,),
              Text("Aug 02, 2024",style: boldText(11,color: AppColors.primaryColor),),
              SizedBox(height: 12,),
              Text("IELTS এর আদ্যোপান্ত: IELTS স্কোরিং সিস্টেম কী, কেন, কিভাবে?",style: extraBoldText(18),),
              SizedBox(height: 4,),
              Text("New Sport Loop bands and matching downloadable watch faces feature bold designs that represent 22 nations around the world",style: regularText(8.sp ,color:Color(0xFF777777)),),
              SizedBox(height: 12,),
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0XFFF2F2F7),
                    child: Icon(Icons.facebook,color: AppColors.primaryColor,),
                  ),
                  SizedBox(width: 12,), CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0XFFF2F2F7),
                    child: Icon(Icons.facebook,color: AppColors.primaryColor,),
                  ),
                  SizedBox(width: 12,), CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0XFFF2F2F7),
                    child: Icon(Icons.facebook,color: AppColors.primaryColor,),
                  ),
                  SizedBox(width: 12,), CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0XFFF2F2F7),
                    child: Icon(Icons.facebook,color: AppColors.primaryColor,),
                  ),
                  SizedBox(width: 12,), CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0XFFF2F2F7),
                    child: Icon(Icons.facebook,color: AppColors.primaryColor,),
                  ),
                  SizedBox(width: 12,),
                ],
              ),
              SizedBox(height: 4,),
              Text("New Sport Loop bands and matching downloadable watch faces feature bold designs that represent 22 nations around the world",style: regularText(8.sp ,color:Color(0xFF777777)),),
              SizedBox(height: 12,),
            ],
          ),
        ),
      ),
    );
  }
}
