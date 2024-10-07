import 'package:biddabari_new/core/config/color/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/util/text_style.dart';
import 'category_card.dart';

class HomeCategoryComponent extends StatelessWidget {
  const HomeCategoryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          SizedBox(height: 26,),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                childAspectRatio: 4/4
            ),
            itemCount:10,
            itemBuilder: (context, index) {
              return CategoryCard(
                image: "data.courseCategories![index].image",
                name: "ফ্রি শিখুন ",
                total: "12",
                id: 1,
                slug: "data.courseCategories![index].slug,"
              );
            },
          )
        ],
      ),
    );
  }
}
