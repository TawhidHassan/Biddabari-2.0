import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/custom_assets/assets.gen.dart';
import '../widget/book_cart_card.dart';


class BookCartPage extends StatelessWidget {
  const BookCartPage({super.key});

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
        title: Text('Book Cart'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
        height: 1.0.sh,
        width: 1.0.sw,
        child: ListView(
          children: [
            BookCartCard(),
          ],
        ),
      ),
    );
  }
}
