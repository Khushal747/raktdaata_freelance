
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationChecker{
static changeLanguage(BuildContext context){
  Locale? currentLocal = EasyLocalization.of(context)!.currentLocale;
  if(currentLocal ==   Locale('en' ,'US')) {
    EasyLocalization.of(context)!.setLocale( Locale ('hi','IN' ));

  }else{
    EasyLocalization.of(context)!.setLocale( Locale ('en','US' ));

  }
}
}