import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common/widgets/Appbar/settings_menu.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/dimensions.dart';
import '../../../../core/config/util/style.dart';
import '../../../custom_assets/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final bool automaticallyImplyLeading;
  final Color? backgroundColor;
  final Color? leadingColor;
  final Color? backButtonColor;
  final Widget? back;
  final List<Widget>? actions;
  final double height;
  final double? prefSize;
  final double? leadingWidth;
  final Color statusBarColor;

  const CustomAppBar({
    Key? key,
    this.leading,
    this.title,
    this.centerTitle = false,
    this.automaticallyImplyLeading = true,
    this.backgroundColor = AppColors.primaryColor,
    this.actions,
    this.leadingColor,
    this.backButtonColor = AppColors.blackColor,
    this.back,
    this.height = 70,
    this.prefSize,
    this.leadingWidth,
    this.statusBarColor = AppColors.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// This part is copied from AppBar class
    final ScaffoldState? scaffold = Scaffold.maybeOf(context);
    final bool hasDrawer = scaffold?.hasDrawer ?? false;
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;

    Widget? leadingIcon = leading;

    if (leadingIcon == null && automaticallyImplyLeading) {
      if (hasDrawer) {
        leadingIcon = IconButton(
          icon: Icon(Icons.menu, color: leadingColor),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      } else {
        if (canPop) {
          leadingIcon = back ??
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Assets.icons.backArrow.svg(
                    colorFilter: ColorFilter.mode(
                        leadingColor ?? Colors.white, BlendMode.srcIn)),
              );
        }
      }
    }

    return PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          leading: leadingIcon,
          toolbarHeight: height.h,
          title: title,
          titleTextStyle: PoppinsMedium.copyWith(
            fontSize: Dimensions.getFontSizeLarge(context),
          ),
          centerTitle: centerTitle,
         titleSpacing: leadingIcon != null?0:20,
          backgroundColor: backgroundColor,
          actions: actions ??
              [
                SettingsMenu(),
              ],
          leadingWidth: leadingWidth,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: statusBarColor),
          scrolledUnderElevation: 0,
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(prefSize ?? height);
}
