import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageFullScreen extends StatelessWidget {
  final String? image;
  const ImageFullScreen({super.key,  this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.keyboard_arrow_left)),
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
                        fit: BoxFit.fill
                    )
                ),
              ),
        ),
      ),

    );
  }
}