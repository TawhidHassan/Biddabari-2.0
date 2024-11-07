import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

import '../../../custom_assets/assets.gen.dart';

class ImageFullScreen extends StatelessWidget {
  final String? image;
  const ImageFullScreen({super.key,  this.image});

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
        title: Text("Preview"),
      ),
      body: InteractiveViewer(
        child: CachedNetworkImage(
          imageUrl: image??"",
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
                height: 1.0.sh,
                width: 1.0.sw,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: image,
                        fit: BoxFit.contain
                    )
                ),
              ),
        ),
      ),

    );
  }
}