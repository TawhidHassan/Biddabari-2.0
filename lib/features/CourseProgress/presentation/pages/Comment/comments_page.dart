
import 'package:biddabari_new/features/CourseProgress/presentation/controller/CourseProgress_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../../core/common/widgets/text field/text_field.dart';
import 'Components/comment_card.dart';

class CourseCommentPage extends StatefulWidget {
  final String? id;
  final String? type;
  CourseCommentPage({Key? key, this.id, this.type}) : super(key: key);

  @override
  State<CourseCommentPage> createState() => _CourseCommentPageState();
}

class _CourseCommentPageState extends State<CourseCommentPage> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero,(){
      Get.find<CourseProgressController>().getComments(widget.id!.toString(),widget.type??"");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
                Icons.keyboard_arrow_left)
        ),
        title: Text("Comments"),
      ),
      body: GetBuilder<CourseProgressController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return Container(
              height: 1.0.sh,
              width: 1.0.sw,
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blueGrey.shade200),
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child:CustomTextField(
                            textEditingController: controller.commentTextController,
                            inputFormatters: [],
                            validator: (text) {
                              if (text!.isEmpty) {
                                return "Please enter your comment";
                              }
                            },
                            hintText: "Enter your comment",
                            isPrefixIcon: true,
                            icon: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Icon(Icons.person_outline),
                            ),
                          ),

                        ),
                        Expanded(
                            flex: 1,
                            child:controller.circuler.value?
                            SizedBox(
                                height: 24,
                                child: LoadingWidget())
                                :
                            SizedBox(
                              height: 24,
                              child: InkWell(
                                  onTap: (){
                                    if(controller.commentTextController.text!=""){
                                      controller.commentsSubmitFun(widget.id!,controller.commentTextController.text,widget.type??"");
                                    }
                                  },
                                  child: Icon(Icons.send,)),
                            )
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 24,),
                  Expanded(
                      child:controller.circuler.value?LoadingWidget():
                      ListView.builder(
                        itemCount: controller.comments.value!.comments!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CommentCard(index: index,comment: controller.comments.value!.comments![index],);
                        },
                      )
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
