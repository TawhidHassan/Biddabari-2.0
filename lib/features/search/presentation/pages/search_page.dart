import 'package:biddabari_new/core/common/widgets/Appbar/custom_appbar.dart';
import 'package:biddabari_new/core/common/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/card/book_card.dart';
import '../../../../core/common/widgets/card/course_card.dart';
import '../../../../core/common/widgets/card/exam_card.dart';
import '../../../../core/common/widgets/container/horizontal_category.dart';
import '../../../../core/common/widgets/text field/search_bar.dart';
import '../../../../core/config/color/app_colors.dart';
import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/utils/system_util.dart';
import '../controller/search_controller.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatelessWidget {
  final String? type;

  const SearchPage({super.key, this.type = "Course"});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.find<SearchControllerX>()
          .selectCat
          .value = type!;
    });
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: AppColors.whiteColor,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: Padding(
              padding: EdgeInsets.all(18),
              child: Assets.icons.backArrow.svg()),
        ),
        title: Text('Search Page'),
      ),
      body: GetBuilder<SearchControllerX>(
        assignId: true,
        builder: (controller) {
          return Obx(() {
            return Container(
              height: 1.0.sh,
              width: 1.0.sw,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child:controller.circle.value?LoadingWidget():
                Column(
                  children: [
                    SizedBox(height: 16,),
                    Search(
                      controller: controller.searchTextControlletr,
                      readOnly: false,
                      onTap: null,
                      suffixIcon: InkWell(
                        onTap: () {
                          controller.searchGet();
                        },
                        child: Container(
                          width: 31,
                          height: 31,
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(8),
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(1.00, -0.02),
                              end: Alignment(-1, 0.02),
                              colors: [Color(0xFFAA076B), Color(0xFF61045F)],
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: Assets.icons.search.svg(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),

                    Row(
                      children: controller.category.map((cat) {
                        return Expanded(
                          child: InkWell(
                            onTap: () {
                              controller.selectCat.value = cat;
                            },
                            child: HorizontalCategoryCard(
                              height: 38,
                              active: controller.selectCat.value == cat,
                              title: cat,
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    controller.response.value!=null?
                    controller.selectCat.value=="Course"?
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                        childAspectRatio: SystemUtil.getChildAspectRatio(context),
                      ),
                      itemCount: controller.response.value!.courses!.length,
                      itemBuilder: (context, index) {
                        return CourseCard(
                            course:controller.response.value!.courses![index]
                        );
                      },
                    ): controller.selectCat.value=="Product"?
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          childAspectRatio: SystemUtil.getChildAspectRatio(context)
                      ),
                      itemCount: controller.response.value!.products!.length,
                      itemBuilder: (context, index) {
                        return BookCard(
                          book: controller.response.value!.products![index],
                        );
                      },
                    )
                        :
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          childAspectRatio: SystemUtil.getChildAspectRatio(context)
                      ),
                      itemCount:controller.response.value!.batchExams!.length,
                      itemBuilder: (context, index) {
                        return ExamCard(
                          exam: controller.response.value!.batchExams![index],
                        );
                      },
                    )
                        :SizedBox()
                  ],
                ),
              ),

            );
          });
        },
      ),
    );
  }
}
