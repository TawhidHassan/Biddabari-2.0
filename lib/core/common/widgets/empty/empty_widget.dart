import 'package:flutter/material.dart';
import '../../../../core/config/util/text_style.dart';

import '../../../config/color/app_colors.dart';
import '../../../custom_assets/assets.gen.dart';

class EmptyWidget extends StatelessWidget {
  final String? title;
  final ImageProvider? image;
  final double? height;
  const EmptyWidget({super.key, this.title, this.image, this.height=60});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image==null?
              Assets.lottie.emptyTwo.lottie()
              :
          Image(image: image!),
          Text(title??'',style: boldText(14,color: AppColors.primaryColor),)
        ],
      ),
    );
  }
}
