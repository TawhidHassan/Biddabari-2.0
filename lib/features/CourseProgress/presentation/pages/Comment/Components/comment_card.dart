
import 'package:biddabari_new/features/CourseProgress/presentation/controller/CourseProgress_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/config/util/text_style.dart';
import '../../../../data/models/Comment/Comment.dart';



class CommentCard extends StatelessWidget {
  final Comment? comment;
  final int? index;

  CommentCard({Key? key, this.index, this.comment}) : super(key: key);
  TextEditingController mobileTextController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseProgressController>(
      assignId: true,
      builder: (controller) {
        return Container(
          width: 1.0.sw,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey,
                        image: DecorationImage(
                            image: AssetImage("assets/images/user.png")
                        )
                    ),
                  )
              ),
              Expanded(
                  flex: 12,
                  child: Container(
                    margin: EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comment!.user!.name??'',
                          style: boldText(16,),),
                        Text(comment!.message??'',
                          style: mediumText(12),),
                        Text(
                          timeAgo(getCustomFormattedDateTime(comment!.created_at??'','MM-dd-yyy h:mm a')),
                          style: semiBoldText(12, color: Colors.grey),),

                        // SizedBox(height: 6,),
                        // controller.replayClick.value &&
                        //     controller.replayIndex.value == index
                        //     ? BackgroundTextfield(
                        //   controller: mobileTextController,
                        //   readOnly: false,
                        //   isNumber: false,
                        //   isemail: false,
                        //   height: 65,
                        //   hintText: "Type Replay",
                        //   bgColor: textFieldBackground,
                        //   borderColor: kPrimaryColorx,
                        // )
                        //     : SizedBox(),
                        // InkWell(
                        //     onTap: () {
                        //       controller.replayClick.value = true;
                        //       controller.replayIndex.value = index!;
                        //     },
                        //     child: Text("Replay",
                        //       style: boldText(14, color: kPrimaryColor),)),
                        SizedBox(height: 12,),

                      ],
                    ),
                  )
              )
            ],
          ),
        );
      },
    );
  }

  getCustomFormattedDateTime(String givenDateTime, String dateFormat) {
    // dateFormat = 'MM/dd/yy';
    var date = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").parse(givenDateTime, true);
    var local = date.toLocal().toString();
    // print(local);
    final DateTime docDateTime = DateTime.parse(local);
    // return DateFormat(dateFormat).format(docDateTime);
    return docDateTime;
  }
  String timeAgo(DateTime d) {
    Duration diff = DateTime.now().difference(d);
    if (diff.inDays > 365)
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    if (diff.inDays > 30)
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    if (diff.inDays > 7)
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    if (diff.inDays > 0)
      return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
    if (diff.inHours > 0)
      return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
    if (diff.inMinutes > 0)
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
    return "just now";
  }
}
