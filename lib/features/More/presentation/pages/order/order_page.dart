import 'package:biddabari_new/core/common/widgets/empty/empty_widget.dart';
import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:biddabari_new/core/common/widgets/shimer%20component/shimer_list.dart';
import 'package:biddabari_new/features/More/presentation/controller/More_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/widgets/container/horizontal_category.dart';
import '../../../../../core/config/color/app_colors.dart';
import '../../../../../core/custom_assets/assets.gen.dart';
import '../../widget/my_order_card.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero,(){
      Get.find<MoreController>().getMyOrder();
    });
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: Padding(
              padding: EdgeInsets.all(18),
              child: Assets.icons.backArrow.svg()),
        ),
        title: Text("My order"),
      ),
      body: GetBuilder<MoreController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return Container(
              height: 1.0.sh,
              width: 1.0.sw,
              color: AppColors.primaryBackground,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: controller.orderLoading.value?ShimerList():
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 50,
                      width: 1.0.sw,
                      child: Row(
                        children: ["Confirm","Pending"].map((cat) {
                          return Expanded(
                            child: InkWell(
                              onTap: (){
                                controller.selectFilter.value=cat;
                              },
                              child: HorizontalCategoryCard(
                                active: controller.selectFilter.value==cat,
                                title: cat,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 12,),
                  ),
                  SliverToBoxAdapter(
                    child:controller.selectFilter.value=="Pending"?
                    controller.pendingList.value.isEmpty?SizedBox(
                      height: 0.5.sh,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          EmptyWidget(title: "There has no pending order",),
                        ],
                      ),
                    ):
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.pendingList.value.length,
                        itemBuilder: (context, index) {
                          return MyOrderCard(
                            order: controller.pendingList.value[index],
                          );
                        }
                    )
                    :
                    controller.confirmList.value.isEmpty?SizedBox(
                      height: 0.5.sh,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          EmptyWidget(title: "There has no confirm order",),
                        ],
                      ),
                    ):
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.confirmList.value.length,
                        itemBuilder: (context, index) {
                          return MyOrderCard(
                            order: controller.confirmList.value[index],
                          );
                        }
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 80,),
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
