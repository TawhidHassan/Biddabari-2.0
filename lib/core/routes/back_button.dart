import 'dart:io';

import 'package:biddabari_new/core/routes/route_path.dart';
import 'package:biddabari_new/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import 'package:logger/logger.dart';

import '../../features/home/presentation/controller/home_controller.dart';
import '../../main.dart';
import '../config/color/app_colors.dart';

class CustomBackButtonDispatcher extends RootBackButtonDispatcher {
  final GoRouter _router;
  final BuildContext context;

  CustomBackButtonDispatcher(this._router, this.context);

  @override
  Future<bool> didPopRoute() async {
    if (_router.canPop()) {
      Logger().w("000");
      _router.pop();
      return true;
    }
    Logger().w(_router.canPop());
    Logger().w("sknjdjd");

    // Logger().w(Get.find<HomeController>().selectedIndex.value);
    // showExitPopup(AppRouter.router.routerDelegate.navigatorKey.currentContext);
    if(_router.canPop()){
      Logger().w("yyyy");
      AppRouter.router.goNamed(Routes.mainPage);
      Get.find<HomeController>().selectedIndex.value=0;


    }else{
      Logger().w("xxx");
      showExitPopup(AppRouter.router.routerDelegate.navigatorKey.currentContext);
      return true;
    }
    return false;
  }

  Future<bool?> showExitPopup(context) async{
    return await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Want to Exit the app!"),
                  const SizedBox(height:20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            print('yes selected');
                            exit(1);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor),
                          child: const Text("Yes", style: TextStyle(color:
                          Colors.white)),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              print('no selected');
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: const Text("No", style: TextStyle(color:
                            Colors.black)),
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}