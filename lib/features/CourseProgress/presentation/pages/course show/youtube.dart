// import 'dart:io';
// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:logger/logger.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoPlayerx extends StatefulWidget {
//   final String? file;
//   const VideoPlayerx({super.key, this.file});
//
//   @override
//   State<VideoPlayerx> createState() => _VideoPlayerState();
// }
//
// class _VideoPlayerState extends State<VideoPlayerx> {
//
//   String? files;
//   File? file;
//   VideoPlayerController? _controller;
//   ChewieController? _controllerChewi;
//   bool playis=false;
//   bool? isEnd=false;
//   int initIndex=1;
//   bool? audioFinish=true;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     file=File(widget.file!);
//     // Logger().w(valuex.path);
//     // Logger().w(file!.path);
//     _controller = VideoPlayerController.file(file!)
//       ..initialize().then((_) {
//         Logger().e("init video cony");
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//
//       });
//
//     // _controller!.addListener(checkVideo);
//     _controllerChewi=ChewieController(
//       videoPlayerController: _controller!,
//       autoPlay: false,
//       looping: false,
//     );
//   }
//   @override
//   void dispose() {
//     _controller!.dispose();
//     _controllerChewi!.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Video player"),
//       ),
//       body: Column(
//         children: [
//           _controller!.value.isInitialized
//               ?
//           AspectRatio(
//             aspectRatio: _controller!.value.aspectRatio,
//             child: Stack(
//               alignment: Alignment.bottomCenter,
//               children: <Widget>[
//                 VideoPlayer(_controller!),
//
//                 Chewie(controller: _controllerChewi!,),
//               ],
//             ),
//           ):SizedBox()
//         ],
//       ),
//     );
//   }
// }
