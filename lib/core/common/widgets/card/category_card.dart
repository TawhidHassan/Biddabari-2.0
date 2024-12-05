import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../config/util/text_style.dart';
import '../../../custom_assets/assets.gen.dart';

class CategoryCard extends StatelessWidget {
  final String? name;
  final String? slug;
  final num? id;
  final String? image;
  final String? total;
  const CategoryCard({Key? key, this.name, this.image, this.total, this.id, this.slug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        shadows: [
          BoxShadow(
            color: Color(0x266E6D6D),
            blurRadius: 6,
            offset: Offset(1, 12),
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: CachedNetworkImage(
              imageUrl:image!,
              placeholder: (context, url) => Skeletonizer(
                  enabled: true,
                  child: Container(
                    height: 300,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4) ),
                        image: DecorationImage(image: Assets.images.course.provider())
                    ),
                  )
              ),
              errorWidget: (context, url, error){
                return Container(
                  height: 300,
                  width: double.infinity,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4) ),
                      image: DecorationImage(image: Assets.images.course.provider())
                  ),
                  child: Assets.images.biddabariLogo.image(),
                );
              },
              imageBuilder: (context, image) =>
                  Container(
                    height: 300,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4) ),
                        image: DecorationImage(
                            image: image,
                            fit: BoxFit.fill
                        )
                    ),
                  )
              ,
            ),
          ),
          SizedBox(height: 8,),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                name!,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: boldText(13,color: AppColors.textClorColor),
              ),
            ),
          ),
          SizedBox(height: 4,),
        ],
      ),
    );
  }
}
