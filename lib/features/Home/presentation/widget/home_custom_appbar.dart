import 'package:biddabari_new/Dependenci%20Injection/init_dependencies.dart';
import 'package:biddabari_new/core/LocalDataBase/localdata.dart';
import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/features/profile/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/config/color/app_colors.dart';
import '../../../../core/config/util/style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';

class HomeCustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeCustomAppbar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    serviceLocator<DBHelper>().getUser();
    return FutureBuilder(
        future: serviceLocator<DBHelper>().getUser(),
        builder: (context, data) {
          return AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.primaryBackground,
            title: Container(
              padding: EdgeInsets.symmetric(horizontal: 0),
              color: AppColors.primaryBackground,
              child: data.data!.get("token") != null ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      data.data!.get("name"),
                      style: PoppinsSemiBoldExtra.copyWith(
                        fontSize: 16,
                      )
                  ),
                  SizedBox(height: 4,),
                  Text(
                      'What Would you like to learn \nToday? Search Below.',
                      style: PoppinsMedium.copyWith(
                        fontSize: 12,
                        color: Color(0xCC545454),
                      )
                  ),
                ],
              )
                  : SizedBox(),
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(right: 12),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      padding: EdgeInsets.all(6),
                      decoration: ShapeDecoration(
                        shape: OvalBorder(
                          side: BorderSide(
                              width: 1, color: AppColors.primaryColor),
                        ),

                      ),
                      child: Assets.icons.bell.svg(),
                    ),
                    SizedBox(width: 14,),
                    data.data!.get("token") != null ?
                    InkWell(
                      onTap: () {
                        context.pushNamed(Routes.loginPage);
                      },
                      child: GetBuilder<ProfileController>(
                        assignId: true,
                        builder: (logic) {
                          return Obx(() {
                            return logic.circuler.value?CircularProgressIndicator():
                            InkWell(
                              onTap: (){
                                context.pushNamed(Routes.morePage);
                              },
                              child: CachedNetworkImage(
                                  imageUrl: ApiEndpoint.imageBaseUrl+logic.profileResponse.value!.student!.image.toString(),
                                  // imageUrl: ApiEndpoint.imageBaseUrl+controller.response.value!.myProfile!.image!,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                        height: 32,
                                        width: 32,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              100),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill
                                          ),
                                          color: const Color(0xfff7ffff),
                                        ),
                                        alignment: Alignment.topLeft,
                                      ),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                        height: 32,
                                        width: 32,
                                        decoration: ShapeDecoration(
                                          shape: OvalBorder(
                                            side: BorderSide(width: 1,
                                                color: AppColors.primaryColor),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(Icons.person_outline),
                                      )

                              ),
                            );
                          });
                        },
                      ),
                    )
                        :
                    InkWell(
                      onTap: () {
                        context.pushNamed(Routes.loginPage);
                      },
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: ShapeDecoration(
                          shape: OvalBorder(
                            side: BorderSide(
                                width: 1, color: AppColors.primaryColor),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Icon(Icons.person_outline),
                      ),
                    ),

                  ],
                ),
              )
            ],
          );
        });
  }
}
