import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/custom_assets/assets.gen.dart';
import '../widget/NotificationApp_widget.dart';

class NotificationAppPage extends StatelessWidget {
  const NotificationAppPage({super.key});

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
      title: Text('Notification'),
     ),
      body: Container(
        height: 1.0.sh,
        width: 1.0.sw,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            NotificationCard(
              height: 80,
              onTap: (){
              },
              title: "My Course",
              details: "My Course",
              icon: Assets.icons.people.path,
            ),
          ],
        ),
      ),
    );
  }
}
