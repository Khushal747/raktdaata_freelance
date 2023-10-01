//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// class LocalizationChecker{
// static changeLanguage(BuildContext context){
//   Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
//   if(currentLocal ==   Locale('en' ,'US')) {
//     EasyLocalization.of(context)!.setLocale( Locale ('hi','IN' ));
//
//   }else{
//     EasyLocalization.of(context)!.setLocale( Locale ('en','US' ));
//
//   }
// }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:raktdata_app/widgets/config_screen.dart';
import 'package:raktdata_app/widgets/splash_screen.dart';

import '../donor_login_signUp/donor_login.dart';

class LocalizationChecker {
  static void changeLanguage(BuildContext context) {
    // Show loading indicator while reloading
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
    if (currentLocal == Locale('en', 'US')) {
      EasyLocalization.of(context)!.setLocale(Locale('hi', 'IN'));
    } else {
      EasyLocalization.of(context)!.setLocale(Locale('en', 'US'));
    }

    // Simulate page reload with a delay
    Future.delayed(Duration(seconds: 2), () {
      // Close loading dialog
       Navigator.pop(context);
      Get.to(() => SplashScreen());

      // Call reloadPage to trigger a rebuild of the UI
      // reloadPage();
    });
  }
}
