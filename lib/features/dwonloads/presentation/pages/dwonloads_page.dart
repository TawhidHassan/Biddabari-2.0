import 'package:biddabari_new/features/dwonloads/presentation/controller/dwonloads_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/container/horizontal_category.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../More/presentation/widget/more_otption_card.dart';

class DwonloadsPage extends StatelessWidget {
  const DwonloadsPage({super.key});

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
        title: Text('My Dwonloads'),
      ),
      body: GetBuilder<DwonloadsController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: controller.catetegoryList.value.map((cat) {
                        return Expanded(
                          child: HorizontalCategoryCard(
                            title: cat,
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  Expanded(
                    flex: 9,
                    child: ListView.builder(
                      itemCount: 12,
                        itemBuilder: (context,index){
                          return MoreOtptionCard(
                            height: 70,
                            textSize: 14,
                            title: "How to use Biddabari App- Video",
                            icon: Assets.icons.people.path,
                          );
                        }
                    ),
                  )
                ],
              ),
            );
          });
        },
      ),
    );
  }
}