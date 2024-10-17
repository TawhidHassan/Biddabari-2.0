import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/custom_assets/assets.gen.dart';
import '../widget/notice_card.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

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
      title: Text(''),
     ),
      body: Container(
        height: 1.0.sw,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            NoticeCard(),
            NoticeCard(),
            NoticeCard(),

          ],
        ),
      ),
    );
  }
}
