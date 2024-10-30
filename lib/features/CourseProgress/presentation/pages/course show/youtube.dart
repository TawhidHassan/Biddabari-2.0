import 'package:biddabari_new/features/CourseProgress/presentation/controller/CourseProgress_controller.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeXpoPlayer extends StatelessWidget {
  final CourseProgressController?controller;
  final YoutubePlayerController?youtubeController;
  const YoutubeXpoPlayer({super.key, this.controller, this.youtubeController});

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      bottomActions: [
        CurrentPosition(),
        InkWell(
          onTap: (){
            if(controller!.videoFullScrren.value){
              controller!.videoFullScrren.value=false;
              youtubeController!.pause();
              youtubeController!.toggleFullScreenMode();
              youtubeController!.reload();
              youtubeController!.play();
            }else{
              controller!.videoFullScrren.value=true;
              youtubeController!.pause();
              youtubeController!.toggleFullScreenMode();
              youtubeController!.reload();
              youtubeController!.play();
            }

          },
          child: Icon(Icons.fullscreen,size: 32,color: Colors.white,),
        ),
        ProgressBar(isExpanded: true),

      ],

      controller: youtubeController!,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.amber,
      progressColors: const ProgressBarColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent,
      ),
      onReady: () {
        youtubeController!.addListener((){
        });
      },
    );
  }
}
