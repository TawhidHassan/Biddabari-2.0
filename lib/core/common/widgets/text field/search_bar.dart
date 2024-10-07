import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/config/color/app_colors.dart';

import '../../../config/util/dimensions.dart';
import '../../../config/util/style.dart';
import '../../../custom_assets/assets.gen.dart';

class Search extends StatelessWidget {
  const Search({super.key,



    this.textColor =  Colors.white,
    this.borderColor = Colors.white,
    this.iconColor  =  Colors.white,
    this.menuColor = Colors.white,
    this.onTap, this.suffixIcon, this.readOnly=false
  });
    final Color ? textColor ;
    final Color ? borderColor ;
    final Color ? iconColor ;
    final Color ? menuColor ;
    final VoidCallback ?onTap;
  final Widget? suffixIcon;
  final bool? readOnly;


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Expanded(
              child: Material(
                elevation: 20.0,
                borderRadius: BorderRadius.circular(12),
                shadowColor: AppColors.containerColor,
                child: TextFormField(
                  style: TextStyle(
                    color: AppColors.primarySlate400
                  ),
                  readOnly: readOnly!,
                  decoration: InputDecoration(

                    suffixIcon:suffixIcon,
                    contentPadding: EdgeInsets.all(0),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Container(
                          height:18,
                          width: 18,
                          padding: EdgeInsets.all(16),
                          child: Assets.icons.search.svg(height: 18,width: 18)),
                      hintText: "Search for",
                      hintStyle:PoppinsMedium.copyWith(
                        color: AppColors.primarySlate400,
                        fontSize: 12
                      ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color:AppColors.whiteColor, width: 1),
                        gapPadding: 0),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.whiteColor, width: 1),
                        gapPadding: 0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.whiteColor, width: 1),
                        gapPadding: 0),
                  ),

                ),
              ),
            ),



          ],
        ),

      ],
    );
  }
}
