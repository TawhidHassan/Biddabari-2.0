import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUtil{

  static double getChildAspectRatio(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      // Mobile aspect ratio
      return 0.7;
    } else if (screenWidth < 900) {
      // Tablet aspect ratio
      return 0.7;
    } else {
      // Larger screen aspect ratio
      return 0.8;
    }
  }

  //----------------------------------hide the system bottom navigation bar
  static void hideBottomNav() {
    try {

      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
          overlays: [SystemUiOverlay.top]); // to hide system bottom nav and show status bar
    } catch (e) {
    }
  }

  //----------------------------------------change the status bar color
  static void setStatusBarColor(Color color){
    try{
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: color)); //to change status bar color

    }catch (e){
    }
  }//end of setStatusBarColor()

  //dismiss the keyboard
  static void dismissKeyboard(){
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (!newValue.text.startsWith("01")) {
      final String newText = "01" + newValue.text.replaceFirst("01", "");
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );

    }

    return newValue;
  }
}

