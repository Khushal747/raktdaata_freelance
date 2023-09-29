import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:raktdata_app/View_model/auth_view_model_need.dart';
import 'package:raktdata_app/widgets/splash_screen.dart';
import '../View_model/admin_view_model.dart';
import '../View_model/auth_admin.dart';
import '../View_model/donor_view_model.dart';
import '../View_model/whatsapp_api_view_model.dart';
import '../core/app_string.dart';
import '../View_model/auth_view_model_donor.dart';

class ConfigScreen extends StatefulWidget {
  @override
  _ConfigScreenState createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModelNeed()),
        ChangeNotifierProvider(create: (_) => NeedViewModel()),
        ChangeNotifierProvider(create: (_) => AuthAdminViewModel()),
        ChangeNotifierProvider(create: (_) => WhatsappApiViewModel()),
        ChangeNotifierProvider(create: (_) => DonorListViewModel()),

      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          fontFamily: AppStrings.montserratFont,
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: SplashScreen(

        ),
      ),
    );
  }
}
