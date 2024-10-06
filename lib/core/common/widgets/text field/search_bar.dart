import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/config/color/app_colors.dart';

import '../../../config/util/dimensions.dart';
import '../../../config/util/style.dart';

class Search extends StatelessWidget {
  const Search({super.key,



    this.textColor =  Colors.white,
    this.borderColor = Colors.white,
    this.iconColor  =  Colors.white,
    this.menuColor = Colors.white, this.onTap
  });
    final Color ? textColor ;
    final Color ? borderColor ;
    final Color ? iconColor ;
    final Color ? menuColor ;
    final VoidCallback ?onTap;


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(onPressed:onTap, icon: Icon(Icons.arrow_back_ios,color: iconColor,)),
            Text("Back",style: robotoMedium.copyWith(
                color: textColor,
                fontSize: Dimensions.getFontSizeLarge(context)
            ) ,),
            Gap(12),
            Expanded(
              child: TextFormField(
                style: TextStyle(
                  color: AppColors.primarySlate400
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                    filled: true,
                    prefixIcon: Icon(Icons.search,color: AppColors.primarySlate400,),
                    hintText: "Search",
                    hintStyle:robotoMedium.copyWith(
                      color: AppColors.primarySlate400,
                      fontSize: Dimensions.getFontSizeLarge(context)
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide:BorderSide(
                          color: borderColor ??  Colors.white.withOpacity(0.25),
                        )
                    )
                ),

              ),
            ),

            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container();
                    },
                  ).whenComplete((){});
                },

                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                )),


          ],
        ),

      ],
    );
  }
}
