import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/util/dimensions.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';
import '../../../Home/presentation/controller/Home_controller.dart';
import '../controller/Splash_controller.dart';
import '../widget/indicator.dart';

class OnbordingPage extends StatelessWidget {
  const OnbordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      assignId: true,
      builder: (controller) {
        return Obx(() {
          return Scaffold(
            backgroundColor: Color(controller.contents[controller.index.value].color!),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    children: [
                      SizedBox(height: 60,),
                      Container(
                        width: 1.0.sw,
                        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Assets.images.logo.image(),
                            InkWell(
                              onTap: (){
                                context.goNamed(Routes.mainPage);
                                controller.dbHelper.onbordingDone();
                              },
                              child: Text(
                                'Skip',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF191919),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),


                  Image.asset(controller.contents[controller.index.value].imagePath!),
                  Container(
                    width: 1.0.sw,
                    height: 361,
                    padding: EdgeInsets.symmetric(vertical: 39,horizontal: 32),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              controller.contents[controller.index.value].name ?? "",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF191919),
                                fontSize: 24,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 14,),
                            Text(
                              controller.contents[controller.index.value].title ?? "",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF777777),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        //------------------------------------------------------dot indicator
                        Indicator(
                          index: controller.index.value,
                          selectedIndex: controller.index.value,
                          itemCount: controller.contents.length,
                          onPressed: () {
                            if (controller.index == 2) {
                              context.goNamed(Routes.mainPage);
                              controller.dbHelper.onbordingDone();
                            } else {
                              controller.updateSelectedIndex(
                                  controller.contents.length);
                              print(controller.index);
                            }
                          },
                        ),
                      ],
                    ),
                  )


                ],
              ),
            ),
          );
        });
      },
    );
  }
}
