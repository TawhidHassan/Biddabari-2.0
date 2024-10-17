import 'package:biddabari_new/features/More/presentation/controller/More_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          return Container(
            height: 1.0.sh,
            width: 1.0.sw,
            color: AppColors.primaryBackground,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 50,
                    width: 1.0.sw,
                    child: Row(
                      children: ["Pending","Confirm"].map((cat){
                        return Expanded(
                          child: HorizontalCategoryCard(
                            title: cat,
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
                  child:ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context,index){
                        return MyOrderCard();
                      }
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 80,),
                ),

              ],
            ),
          );
        },
      ),

    );
  }
}
