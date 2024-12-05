import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/core/config/util/text_style.dart';
import 'package:biddabari_new/features/Blog/data/models/Blog/Blog.dart';
import 'package:biddabari_new/features/Blog/presentation/controller/Blog_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/common/widgets/Image/full_image.dart';
import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/utils/format_date.dart';
import '../widget/blog_card.dart';
import 'package:flutter/src/services/clipboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 // hides to test if share_plus exports XFile
import 'package:share_plus/share_plus.dart';


class BlogDetailsPage extends StatelessWidget {
  final Blog? blog;

  const BlogDetailsPage({super.key, this.blog,});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<BlogController>().getBlogDetails(blog!.id);
    });
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
      body: GetBuilder<BlogController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return controller.blogDetailsCircle.value?LoadingWidget():
            Container(
              height: 1.0.sh,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Update",
                      style: extraBoldText(14, color: Color(0xFF777777)),),
                    SizedBox(height: 4,),
                    Text( getCustomFormattedDateTime(controller.blogDetailsResponse.value!.blog!.updated_at??'','yyy-MMM-dd'),
                      style: boldText(11, color: AppColors.primaryColor),),
                    SizedBox(height: 12,),
                    Text(
                      controller.blogDetailsResponse.value!.blog!.title??"",
                      style: extraBoldText(18),),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        InkWell(
                          onTap: ()async{
                            // await FlutterShare.share(
                            //     title: 'share',
                            //     text: controller.blogDetailsResponse.value!.blog!.title??"",
                            //     linkUrl: ApiEndpoint.webMainDomain +
                            //         "blog-details/${controller.blogDetailsResponse.value!.blog!.slug}",
                            //     chooserTitle: controller.blogDetailsResponse.value!.blog!.title??""
                            // );
                            await Share.share( ApiEndpoint.webMainDomain +
                                "blog-details/${controller.blogDetailsResponse.value!.blog!.slug}");
                            Fluttertoast.showToast(
                                msg: "Link copy successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 2,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                            Clipboard.setData(ClipboardData(
                                text: ApiEndpoint.webMainDomain +
                                    "blog-details/${controller.blogDetailsResponse.value!.blog!.slug}")).then((
                                value) {
                              Get.snackbar("Copied",
                                  ApiEndpoint.webMainDomain +
                                      "blog-details/${controller.blogDetailsResponse.value!.blog!.slug}",
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white);
                            });
                          },
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: Color(0XFFF2F2F7),
                            child: Icon(
                              Icons.share, color: AppColors.primaryColor,),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 12,),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ImageFullScreen(image:controller.blogDetailsResponse.value!.blog!.image!)),
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl:controller.blogDetailsResponse.value!.blog!.image!,
                        placeholder: (context, url) => LoadingWidget(),
                        errorWidget: (context, url, error){
                          return Image.asset("assets/images/biddabari-logo.png");
                        },
                        imageBuilder: (context, image) =>  Container(
                          height: 200,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(4),topLeft: Radius.circular(4) ),
                              image: DecorationImage(
                                  image: image,
                                  fit: BoxFit.fill
                              )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4,),
                    Html(data: controller.blogDetailsResponse.value!.blog!.body??'',onLinkTap: (url, _, __) async {
                      if (await canLaunch(url!)) {
                        await launch(
                          url,
                        );
                      }
                    },),
                    SizedBox(height: 12,),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
