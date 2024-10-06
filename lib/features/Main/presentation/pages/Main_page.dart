import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class MainPage extends StatefulWidget {

  const MainPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  void _goBranch(int index, BuildContext context) {
    if (index == 3) {
      Future.delayed(Duration.zero, () {
        // Get.find<CartController>().onInit();
        // Get.find<CartController>().getCartData();
      });
    }

    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }


  int _currentIndex = 0;
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    Future.delayed(Duration.zero,(){
    });
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _motionTabBarController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar:


        BottomNavigationBar(
          backgroundColor: AppColors.whiteColor,
          showSelectedLabels: true,
          enableFeedback: true,
          iconSize: 32,
          showUnselectedLabels: true,
          currentIndex: widget.navigationShell.currentIndex,
          unselectedLabelStyle: robotoMedium.copyWith(
            fontSize: 12,
          ),
          selectedLabelStyle:  robotoMedium.copyWith(
            fontSize: 12,
          ),
          unselectedItemColor:  AppColors.primarySlate300,
          selectedItemColor: AppColors.palkiColor,
          // selectedIndex:
          items: [
            BottomNavigationBarItem(
                label: "হোম",
                icon: Assets.icons.icHome.svg(color: AppColors.primarySlate200),
                activeIcon: Assets.icons.icHome.svg(color: AppColors.palkiColor)
            ),


            BottomNavigationBarItem(
              label: "সব কোর্স",
              icon:Assets.icons.icInbox.svg(color: AppColors.primarySlate200),
              activeIcon: Assets.icons.icInbox.svg(color: AppColors.palkiColor),

            ),

            BottomNavigationBarItem(
                label: "পরীক্ষা",
                icon: Assets.icons.icMore.svg(),
                activeIcon: Assets.icons.icMore.svg(color: AppColors.palkiColor)
            ),
            BottomNavigationBarItem(
                label: "বুক স্টোর",
                icon: Assets.icons.icMore.svg(),
                activeIcon: Assets.icons.icMore.svg(color: AppColors.palkiColor)
            ),
            BottomNavigationBarItem(
                label: "ফ্রি কোর্স",
                icon: Assets.icons.icMore.svg(),
                activeIcon: Assets.icons.icMore.svg(color: AppColors.palkiColor)
            ), BottomNavigationBarItem(
                label: "ক্লাসরুম",
                icon: Assets.icons.icMore.svg(),
                activeIcon: Assets.icons.icMore.svg(color: AppColors.palkiColor)
            ),
            // NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
            // NavigationDestination(label: 'Image Generate', icon: Icon(Icons.image)),
          ],
          // destinations: const [
          //
          // ],
          onTap: (index) => _goBranch(index, context),
          // onDestinationSelected: ,

        )
    );
  }
}





