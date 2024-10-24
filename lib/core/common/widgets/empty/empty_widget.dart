import 'package:flutter/material.dart';
import '../../../../core/config/util/text_style.dart';

import '../../../config/color/app_colors.dart';
import '../../../custom_assets/assets.gen.dart';

class EmptyWidget extends StatelessWidget {
  final String? title;
  final bool? image;
  final double? height;
  const EmptyWidget({super.key, this.title, this.image=true, this.height=60});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image!?
          Container(
            margin: EdgeInsets.only(left: 12),
            child: Assets.images.empty.svg(
              height: 100,
              width: 200
            ),
          ):
          Assets.lottie.emptyTwo.lottie(),
          SizedBox(height: 12,),
          Text(title??'',style: boldText(14,color: AppColors.primaryColor),)
        ],
      ),
    );
  }
}
