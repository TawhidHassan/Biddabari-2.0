import 'package:biddabari_new/features/CourseProgress/presentation/controller/CourseProgress_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';

import '../../../../../core/custom_assets/assets.gen.dart';
import '../../../../CourseProgress/presentation/pages/course show/youtube.dart';
import '../../../data/models/CourseCategory/CourseCategoryData.dart';

class VideoPageFreeCourse extends StatefulWidget {
  final CourseCategoryData? courseCategoryData;

  const VideoPageFreeCourse({super.key, this.courseCategoryData});

  @override
  State<VideoPageFreeCourse> createState() => _VideoPageFreeCourseState();
}

class _VideoPageFreeCourseState extends State<VideoPageFreeCourse> {

  YoutubePlayerController? youtubeController;

  @override
  void initState() {
    // TODO: implement initState
    youtubeController = YoutubePlayerController(
      initialVideoId: widget.courseCategoryData!.category_video!.video_link
          .toString().split("v=")[1],
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        // final bool? shouldPop = await _showBackDialog();
        // print("object");

        await SystemChrome.setPreferredOrientations(
            [
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitUp
            ]);
        if (youtubeController != null) {
          youtubeController!.pause();
          youtubeController!.dispose();
        }
        Get.find<CourseProgressController>().videoFullScrren.value=false;

        context.pop();
      },
      child: GetBuilder<CourseProgressController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return controller.videoFullScrren.value ?
            YoutubeXpoPlayer(
              controller: controller,
              youtubeController: youtubeController,
            ) : Scaffold(
              appBar: AppBar(
                leading: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Padding(
                      padding: EdgeInsets.all(18),
                      child: Assets.icons.backArrow.svg()),
                ),
                title: Text('Video'),
              ),
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: YoutubeXpoPlayer(
                  controller: controller,
                  youtubeController: youtubeController,
                ),
              )
            );
          });
        },
      ),
    );
  }
}
