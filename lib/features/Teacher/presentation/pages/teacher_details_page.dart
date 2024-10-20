import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/container/horizontal_category.dart';
import '../../../../core/config/util/text_style.dart';
import '../../../../core/custom_assets/assets.gen.dart';

class TeacherDetailsPage extends StatelessWidget {
  const TeacherDetailsPage({super.key});

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
      title: Text('Teacher details'),
     ),
      body: Container(
        height: 1.0.sh,
        width: 1.0.sw,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                color: Colors.white,
                child: Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 62.r,
                        backgroundImage: Assets.images.teacher.provider(),
                      ),
                    ),

                    const SizedBox(height: 6),
                    // name
                    Text("Sifat", style: boldText(21),),
                    Text("Graphic Designer At Google",
                      style: boldText(13, color: Color(0xFF545454)),),

                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          // total course
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '12',
                                style: boldText(17),
                              ),
                              Text(
                                'Total Course',
                                style: semiBoldText(
                                    12, color: Color(0xFF545454)),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '12',
                                style: boldText(17),
                              ),
                              Text(
                                'Completed',
                                style: semiBoldText(
                                    12, color: Color(0xFF545454)),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '12',
                                style: boldText(17),
                              ),
                              Text(
                                'Ongoing',
                                style: semiBoldText(
                                    12, color: Color(0xFF545454)),
                              ),
                            ],
                          ),


                          // completed
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
                child: Text("But how much, or rather, can it now do as much as it did then? Nor am I unaware that there is utility in history, not only pleasure.",
                  style: mediumText(13, color: Color(0xFFA0A4AB)),textAlign: TextAlign.center,),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 1.0.sw,
                      child: Wrap(
                        direction: Axis.vertical,
                        alignment: WrapAlignment.spaceBetween,
                        runAlignment: WrapAlignment.center,
                        children: [
                          InkWell(
                            onTap:(){
                              // controller.onTapTab(0);
                            },
                            child: HorizontalCategoryCard(
                              height: 40,
                              textSize: 18,
                              active: false, title: "About",),
                          ),
                          InkWell(
                            onTap:(){
                              // controller.onTapTab(1);
                            },
                            child: HorizontalCategoryCard(
                              height: 40,
                              textSize: 18,
                              active: false, title: "Class",),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
