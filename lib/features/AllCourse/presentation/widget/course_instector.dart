import 'package:flutter/material.dart';

import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../Teacher/data/models/Teacher/Teacher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CourseInstector extends StatelessWidget {
  final Teacher? teacher;
  const CourseInstector({super.key, this.teacher});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              spreadRadius: 1.5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // instructor's image
            CachedNetworkImage(
              imageUrl: ApiEndpoint.imageBaseUrl +
                  teacher!.image.toString(),
              errorWidget: (context, url, error){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Image.asset("assets/images/biddabari-logo.png"),
                );
              },
              placeholder: (context, url) =>
                  LoadingWidget(),
              imageBuilder: (context, image) =>
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 42,
                    backgroundImage: image,
                  ),
            ),


            const SizedBox(height: 5),

            // instructor's name
            Text(
              teacher!.first_name??"",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 5),

            // instructor's designation
            Text(
              teacher!.subject??"",
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 12),

            // rating, students and courses
            // Row(
            //   mainAxisAlignment:
            //   MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         // star icon
            //         const Icon(
            //           Icons.star,
            //           color: Color(0xFFEB6A20),
            //           size: 15,
            //         ),
            //
            //         const SizedBox(width: 3),
            //
            //         // rating count
            //         Text(
            //           "12",
            //           style: const TextStyle(
            //             fontSize: 12,
            //             fontWeight: FontWeight.w400,
            //           ),
            //         ),
            //
            //         const SizedBox(width: 3),
            //
            //         // Course Rating text
            //         // const Text(
            //         //   'Course Rating',
            //         //   style: TextStyle(
            //         //     fontSize: 12,
            //         //     color: Colors.grey,
            //         //     fontWeight: FontWeight.w400,
            //         //   ),
            //         // ),
            //       ],
            //     ),
            //     Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         // number of students
            //         Text(
            //           "12",
            //           style: const TextStyle(
            //             fontSize: 12,
            //             fontWeight: FontWeight.w400,
            //           ),
            //         ),
            //
            //         const SizedBox(width: 3),
            //
            //         // Student text
            //         const Text(
            //           'Students',
            //           style: TextStyle(
            //             fontSize: 12,
            //             color: Colors.grey,
            //             fontWeight: FontWeight.w400,
            //           ),
            //         ),
            //       ],
            //     ),
            //     Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         // play icon
            //         const Icon(
            //           Icons.play_circle,
            //           color: Color(0xFFEB6A20),
            //           size: 15,
            //         ),
            //
            //         const SizedBox(width: 3),
            //
            //         // rating count
            //         Text(
            //           "12",
            //           style: const TextStyle(
            //             fontSize: 12,
            //             fontWeight: FontWeight.w400,
            //           ),
            //         ),
            //
            //         const SizedBox(width: 3),
            //
            //         // course rating text
            //         const Text(
            //           'Courses',
            //           style: TextStyle(
            //             fontSize: 12,
            //             color: Colors.grey,
            //             fontWeight: FontWeight.w400,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),

            const SizedBox(height: 12),

            // instructor's description
            // Text(
            //   "djndjndjdnjdndj  dj dhjd jdndhj udndund  bdhdbhd",
            //   textAlign: TextAlign.center,
            //   maxLines: 6,
            //   style: const TextStyle(
            //       overflow: TextOverflow.ellipsis,
            //       color: Colors.grey,
            //       fontWeight: FontWeight.w500),
            // ),
          ],
        ),
      ),
    );
  }
}
