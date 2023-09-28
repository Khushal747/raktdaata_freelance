import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:raktdata_app/presentation/widgets/whatsappImplementation.dart';
import 'package:raktdata_app/theme/theme_helper.dart';
import 'package:raktdata_app/widgets/config_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'core/app_string.dart';
import 'firebase_options.dart';

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'RaktDaata',
//         theme: ThemeData(
//           appBarTheme: AppBarTheme(color: Colors.red.shade900),
//           primarySwatch: Colors.red,
//         ),
//       home:SplashScreen(),
//       // ConfigScreen(),
//     );
//   }
// }


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   SharedPreferences prefs = await SharedPreferences.getInstance();
   String theme = prefs.getString(AppStrings.themeSp) ?? 'primary';

  ThemeHelper().changeTheme(theme);

  // ThemeHelper().changeTheme('primary');
  runApp(
      EasyLocalization(
          supportedLocales: const [Locale('en', 'US'), Locale('hi', 'IN')],
          path: 'assets/translations', // <-- change the path of the translation files
          fallbackLocale: const Locale('en', 'US'),
          child:
           // MessageSender(),
          ConfigScreen()
      )
  );
}
