import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../config/color/app_colors.dart';
import '../../../config/util/style.dart';
import '../../../custom_assets/assets.gen.dart';
import '../container/circle_container.dart';
import '../text/custom_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 12,right: 12,top: 32,bottom: 16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: "History",textStyle: robotoMedium.copyWith(
                fontSize: 18.sp,
                color: AppColors.primarySlate700
            ),),
            Assets.icons.icHistory.svg()
          ],
        ),
        SizedBox(height: 12,),
        ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                        imageUrl: "https://images.unsplash.com/photo-1605881528191-68f38c78e3d3?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        // imageUrl: ApiEndpoint.imageBaseUrl+controller.response.value!.myProfile!.image!,
                        imageBuilder: (context, imageProvider) => Container(
                          height: 110.h,
                          width: 110.w,
                          child: CircleContainer(
                            color: Color(0xff000000).withOpacity(0.25),
                            height: 24,
                            paddingLeft: 6,
                            paddingTop: 6,
                            child: CustomText(text: "Host",textStyle: robotoMedium.copyWith(
                                color: Color(0xff1EDCC5),
                                fontSize: 12
                            ),),
                          ),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill
                            ),
                            color: const Color(0xfff7ffff),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        placeholder: (context, url) => LoadingWidget(),
                        errorWidget: (context, url, error) => Icon(Icons.error)

                    ),
                    SizedBox(width: 12,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Nurnobi",textStyle: robotoMedium.copyWith(
                          color: AppColors.primarySlate700,
                          fontSize: 16.sp,
                        ),),
                        CustomText(
                          text: "Dhaka,\nBangladesh",textStyle: robotoRegular.copyWith(
                          color: AppColors.primarySlate500,
                          fontSize: 12.sp,
                        ),),
                        CustomText(
                          text: "01h 30m",textStyle: robotoRegular.copyWith(
                          color: AppColors.primarySlate500,
                          fontSize: 12.sp,
                        ),),
                        CustomText(
                          text: "Video Room",textStyle: robotoRegular.copyWith(
                          color: AppColors.primarySlate300,
                          fontSize: 12.sp,
                        ),),
                        CustomText(
                          text: "28 Jul, 2024",textStyle: robotoRegular.copyWith(
                          color: AppColors.primarySlate500,
                          fontSize: 12.sp,
                        ),),

                      ],
                    ),
                    Spacer(),
                    CircleContainer(
                      height: 28.h,
                      width: 28.w,
                      color: Colors.red,
                      borderRadius: 100,
                      child: Assets.icons.icPlus1.svg(),
                    )
                  ],
                ),
              );
            })

      ],
    );
  }
}
