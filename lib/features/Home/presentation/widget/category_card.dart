import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class CategoryCard extends StatelessWidget {
  final String? name;
  final String? slug;
  final num? id;
  final String? image;
  final String? total;
  const CategoryCard({Key? key, this.name, this.image, this.total, this.id, this.slug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // Navigator.pushNamed(context, CATGEGORY_COURSE_PAGE,arguments: {
        //   "id":id!.toString(),
        //   "name":name,
        //   "slug":slug
        // });
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl:image!,
                placeholder: (context, url) => LoadingWidget(),
                errorWidget: (context, url, error){
                  return Assets.images.logo.image();
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
                  name!.length>12?name!.substring(0,6)+"..":name!,
                  style: boldText(13,color: AppColors.textClorColor),
                ),
              ),
            ),
            SizedBox(height: 4,),
          ],
        ),
      ),
    );
  }
}
