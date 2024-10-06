import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:Container(
      height: 1.0.sh,
      width: 1.0.sw,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-2, 0.72) ,
          end:Alignment(1.00, -0.12),
          colors: [Color(0xFFAA076B), Color(0xFF61045F)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Assets.images.biddabariWhite.image(),
          SizedBox(height: 100,),
          Assets.images.splash.image(),
        ],
      ),
    ) ,
    );
  }
}
