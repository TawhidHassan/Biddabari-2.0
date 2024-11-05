import 'package:biddabari_new/core/common/widgets/Appbar/custom_appbar.dart';
import 'package:biddabari_new/core/config/Strings/api_endpoint.dart';
import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:biddabari_new/features/Affiliation/presentation/controller/Affiliation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/src/services/clipboard.dart';
import '../../../../core/common/widgets/loading/loading_widget.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/utils/system_util.dart';
import '../widget/Affiliation_widget.dart';

class AffiliationPage extends StatelessWidget {
  const AffiliationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<AffiliationController>().getAffiliation();
    });
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: Padding(
              padding: EdgeInsets.all(18),
              child: Assets.icons.backArrow.svg()
          ),
        ),
        title: Text('Affiliation'),
      ),
      body: GetBuilder<AffiliationController>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: controller.loading.value
                  ? LoadingWidget() :
              ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 1.0.sw,
                        padding: EdgeInsets.all(12),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 0.50, color: Color(
                                0xFFE5E5EB)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x143E2489),
                              blurRadius: 24,
                              offset: Offset(0, 6),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                                'Affiliation Code',
                                style: boldText(20)
                            ),
                            SizedBox(height: 16,),
                            controller.affilitaeResponse.value!
                                .affiliateRegister == null ?
                            controller.affilitaerCreateCirculer.value
                                ? SizedBox(
                                height: 32,
                                width: 32,
                                child: LoadingWidget())
                                :
                            InkWell(
                              onTap: () {
                                controller.createCode();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 6),
                                decoration: ShapeDecoration(
                                  color: Color(0xFF00934C),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text("Apply",
                                  style: boldText(11, color: Colors.white),),
                              ),
                            ) :
                            Text(
                                controller.affilitaeResponse.value!
                                    .affiliateRegister!.affiliate_code ?? "",
                                style: mediumText(16, color: Colors.green)
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12,),
                      Container(
                        width: 1.0.sw,
                        padding: EdgeInsets.all(12),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 0.50, color: Color(
                                0xFFE5E5EB)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x143E2489),
                              blurRadius: 24,
                              offset: Offset(0, 6),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Total Earnings',
                              style: boldText(20),
                            ),
                            SizedBox(height: 16,),
                            Text(
                                controller.affilitaeResponse.value!
                                    .affiliateRegister == null ? "0.0" :
                                controller.affilitaeResponse.value!
                                    .affiliateRegister!.total_earning
                                    .toString(),
                                style: mediumText(16, color: Colors.green)
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12,),
                      Container(
                        width: 1.0.sw,
                        padding: EdgeInsets.all(12),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 0.50, color: Color(
                                0xFFE5E5EB)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x143E2489),
                              blurRadius: 24,
                              offset: Offset(0, 6),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                                'Total Withdraws',
                                style: boldText(20)
                            ),
                            SizedBox(height: 16,),
                            Text(
                                controller.affilitaeResponse.value!
                                    .affiliateRegister == null ? "0.0" :
                                controller.affilitaeResponse.value!
                                    .affiliateRegister!.total_withdraw
                                    .toString(),
                                style: mediumText(16, color: Colors.green)
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 16,),
                  Column(
                    children: [
                      Text(
                          'Referral Links',
                          style: boldText(20)
                      ),
                      Text(
                          'Click to copy referral link',
                          style: boldText(12, color: Color(0xff777777))
                      ),
                      SizedBox(height: 12,),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          childAspectRatio: SystemUtil.getChildAspectRatio(
                              context),
                        ),
                        itemCount: controller.affilitaeResponse.value!
                            .courses!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                if (controller.affilitaeResponse.value!
                                    .affiliateRegister != null) {
                                  Clipboard.setData(ClipboardData(
                                      text: ApiEndpoint.baseUrl +
                                          "course-details/${controller
                                              .affilitaeResponse.value!
                                              .courses![index]
                                              .title}?rc=${controller
                                              .affilitaeResponse.value!
                                              .affiliateRegister!
                                              .affiliate_code}")).then((
                                      value) {
                                    Get.snackbar("Copied",
                                        ApiEndpoint.baseUrl +
                                            "course-details/${controller
                                                .affilitaeResponse.value!
                                                .courses![index]
                                                .title}?rc=${controller
                                                .affilitaeResponse.value!
                                                .affiliateRegister!
                                                .affiliate_code}",
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white);
                                  });
                                }
                              },
                              child: AffiliationCourseCard(
                                course: controller.affilitaeResponse.value!
                                    .courses![index],));
                        },
                      ),

                    ],

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
