import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pod_player/pod_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../CourseProgress/presentation/controller/CourseProgress_controller.dart';
import '../../../CourseProgress/presentation/pages/course show/youtube.dart';


class TeacherVideo extends StatefulWidget {
  final String? videoUrl, thumnilUrl;

  const TeacherVideo({super.key, this.videoUrl, this.thumnilUrl});

  @override
  State<TeacherVideo> createState() => _TeacherVideoState();
}

class _TeacherVideoState extends State<TeacherVideo> {

  PodPlayerController? controllerPodIntro;
  YoutubePlayerController? youtubeController;

  @override
  void initState() {
    // TODO: implement initState
    controllerPodIntro = PodPlayerController(
      podPlayerConfig: PodPlayerConfig(
        autoPlay: false,
      ),
      playVideoFrom: PlayVideoFrom.youtube(
        widget.videoUrl!,
      ),
    )
      ..initialise();

    youtubeController = YoutubePlayerController(
      initialVideoId: widget.videoUrl!.toString().split("v=")[1],
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (controllerPodIntro != null) {
      controllerPodIntro!.pause();
      controllerPodIntro!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseProgressController>(
      assignId: true,
      builder: (controller) {
        return Container(
          padding: EdgeInsets.all(8),
            child: YoutubeXpoPlayer(
              controller: controller,
              youtubeController: youtubeController,
            )
          // PodVideoPlayer(
          //   controller: controllerPodIntro!,
          //   videoThumbnail:widget.thumnilUrl==""?null: DecorationImage(
          //     image: NetworkImage(ApiEndpoint.imageBaseUrl+widget.thumnilUrl!,),
          //     fit: BoxFit.cover,
          //   ),
          // ),
        );
      },
    );
  }
}
