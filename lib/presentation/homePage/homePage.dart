// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:raktdata_app/presentation/Frontpage/FrontPage.dart';
// import 'package:raktdata_app/presentation/donor_page/donorChoosePage.dart';
// import 'package:raktdata_app/presentation/donor_login_signUp/donor_login.dart';
// import 'package:raktdata_app/presentation/need_pages/signUp_requirement.dart';
// import 'package:raktdata_app/presentation/widgets/front_page.dart';
// import 'package:raktdata_app/presentation/widgets/localization_checker.dart';
// import 'package:raktdata_app/theme/greenButton.dart';
// import 'package:raktdata_app/widgets/translate_extension.dart';
//
// import '../../const/resource.dart';
// import '../../core/utils/size_utils.dart';
// import '../../theme/app_decoration.dart';
// import '../../theme/text_theme_helper.dart';
// import '../../widgets/custom_elevated_button.dart';
// import '../../widgets/util.dart';
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   bool isLoggedIn = false;
//   var _scaffoldkey = GlobalKey<ScaffoldState>();
//
//
//   // getUser() async {
//   //   // var user = await FirebaseAuthProvider().getCurrentUser();
//   //   // if (user == null) {
//   //   //   setState(() {
//   //   //     isLoggedIn = true;
//   //   //   });
//   //   // }
//   // }
//   //
//   // showErrorDialog() {
//   //   return showDialog(
//   //       context: context,
//   //       builder: (context) {
//   //         return AlertDialog(
//   //             content: Text('You must Login to continue !',
//   //                 style: TextStyle(color: Colors.red)),
//   //             actions: <Widget>[
//   //               // FlatButton(
//   //               //     child: Text('Ok'),
//   //               //     onPressed: () {
//   //               //       Navigator.pop(context);
//   //               //       Navigator.pushReplacement(context,
//   //               //           MaterialPageRoute(builder: (context) => Login()));
//   //               //     }),
//   //
//   //               CustomElevatedButton(
//   //                 width: getHorizontalSize(
//   //                   360,
//   //                 ),
//   //                 height: getVerticalSize(
//   //                   50,
//   //                 ),
//   //                 text: "Ok",
//   //                 margin: getMargin(
//   //                   top: 21,
//   //                 ),
//   //                 onTap: () {
//   //                   // _authViewModel.login(                     //yha authvviewmodel dekhna
//   //                   //   emailController.text,
//   //                   //   passwordController.text,
//   //                   // );
//   //                 },
//   //                 buttonStyle: ButtonThemeHelper
//   //                     .gradientnameblueA200namepurple900
//   //                     .copyWith(
//   //                   fixedSize: MaterialStateProperty.all<Size>(
//   //                     Size(
//   //                       double.maxFinite,
//   //                       getVerticalSize(50),
//   //                     ),
//   //                   ),
//   //                 ),
//   //                 decoration: ButtonThemeHelper
//   //                     .gradientnameblueA200namepurple900Decoration,
//   //                 buttonTextStyle:
//   //                     TextThemeHelper.titleMediumNotoSansPrimaryContainer,
//   //               ),
//   //             ],
//   //             title: Text(
//   //               'Oops',
//   //               style: TextStyle(fontWeight: FontWeight.bold),
//   //             ));
//   //       });
//   // }
//   //
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   getUser();
//   // }
//
//   // showSnackbar(message) {
//   //   _scaffoldkey.currentState?.showSnackBar(
//   //       SnackBar(
//   //     backgroundColor: Colors.purple,
//   //     content: Text(message ?? "Something went wrong, try again later."),
//   //   )
//   //   );
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: _scaffoldkey,
//         appBar: AppBar(
//           title: Column(
//             children: [
//               Text(
//                 "Shri Bijasan Maala Seva Mandal".trTrans,
//                 overflow: TextOverflow.ellipsis,
//                 textAlign: TextAlign.left,
//                 style: TextThemeHelper.titleMediumPrimaryContainer_1,
//               ),
//               Text(
//                 "Bijasan Mata Mandir,Indore".trTrans,
//                 overflow: TextOverflow.ellipsis,
//                 textAlign: TextAlign.left,
//                 style: TextThemeHelper.titleSmallPrimaryContainer_2,
//               )
//             ],
//           ),
//           actions: <Widget>[
//             isLoggedIn
//                 ? SizedBox()
//                 : IconButton(
//                     icon: (Icon(Icons.translate)),
//                     // Icon(MdiIcons.logout),
//                     onPressed: () async {
//                       // await FirebaseAuthProvider().logout();
//                       // Util.getSnackBar('You are logged out.');this is used
//                       LocalizationChecker.changeLanguage(context);
//
//                       // showSnackbar('You are logged out');
//
//                       // getUser(); this is used
//                     })
//           ],
//           backgroundColor: Colors.red.shade900,
//           centerTitle: true,
//         ),
//         body: Container(
//           decoration: AppDecoration.getScreenBg,
//           padding: Util.statusBarPadding(context),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Center(
//                 child: Container(
//                   width: getHorizontalSize(300),
//                   height: getVerticalSize(300),
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage(R.ASSETS_IMAGES_LOGO_IMAGE_JPG),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//
//
//               Padding(
//                 padding: getPadding(top: 150),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//
//                   children: [
//                     Padding(
//                       padding: getPadding(left: 5,right: 5),
//                       child: CustomElevatedButton(
//                         width: double.maxFinite,
//                         height: getVerticalSize(
//                           50,
//                         ),
//                         text: "Donor".trTrans,
//                         margin: getMargin(
//                           top: 21,
//                         ),
//                         onTap: () {
//                           Get.to(() =>  DonorPage());
//
//                         },
//                         buttonStyle: GreenButton
//                             .gradientnameblueA200namepurple900
//                             .copyWith(
//                           fixedSize: MaterialStateProperty.all<Size>(
//                             Size(
//                               double.maxFinite,
//                               getVerticalSize(50),
//                             ),
//                           ),
//                         ),
//                         decoration: GreenButton
//                             .gradientnameblueA200namepurple900Decoration,
//                         buttonTextStyle:
//                             TextThemeHelper.titleMediumNotoSansPrimaryContainer,
//                       ),
//                     ),
//                     Padding(
//                       padding: getPadding(left: 5,right: 5),
//                       child: CustomElevatedButton(
//                         width: double.maxFinite,
//                         height: getVerticalSize(
//                           50,
//                         ),
//                         text: "Need".trTrans,
//                         margin: getMargin(
//                           top: 21,
//                         ),
//                         onTap: () {
//                           Get.to(() =>FrontPage(),
//                               // Details(),
//                               // RequirementSignUp()
//                                );
//
//                         },
//                         buttonStyle: GreenButton
//                             .gradientnameblueA200namepurple900
//                             .copyWith(
//                           fixedSize: MaterialStateProperty.all<Size>(
//                             Size(
//                               double.maxFinite,
//                               getVerticalSize(50),
//                             ),
//                           ),
//                         ),
//                         decoration: GreenButton
//                             .gradientnameblueA200namepurple900Decoration,
//                         buttonTextStyle:
//                             TextThemeHelper.titleMediumNotoSansPrimaryContainer,
//                       ),
//                     ),
//                     Padding(
//                       padding: getPadding(left: 5,right: 5),
//                       child: CustomElevatedButton(
//                         width: double.maxFinite,
//                         height: getVerticalSize(
//                           50,
//                         ),
//                         text: "Admin".trTrans,
//                         margin: getMargin(
//                           top: 21,
//                         ),
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => Donor_Login()));
//                         },
//                         buttonStyle: GreenButton
//                             .gradientnameblueA200namepurple900
//                             .copyWith(
//                           fixedSize: MaterialStateProperty.all<Size>(
//                             Size(
//                               double.maxFinite,
//                               getVerticalSize(50),
//                             ),
//                           ),
//                         ),
//                         decoration: GreenButton
//                             .gradientnameblueA200namepurple900Decoration,
//                         buttonTextStyle:
//                             TextThemeHelper.titleMediumNotoSansPrimaryContainer,
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         )
//
//         // Stack(
//         //   fit: StackFit.expand,
//         //   children: <Widget>[
//         //     Column(
//         //       // This is our main page
//         //       children: <Widget>[
//         //         Expanded(
//         //           child: Material(
//         //             color: Colors.green.shade500,
//         //             child: InkWell(
//         //               onTap: () {
//         //                 Navigator.push(context,
//         //                     MaterialPageRoute(builder: (context) => LoginScreen(),
//         //                         // Donor()
//         //                     ));
//         //               },
//         //               child: Center(
//         //                 child: Container(
//         //                   decoration: BoxDecoration(
//         //                       border: Border.all(
//         //                           color: Colors.white, width: 5.0)),
//         //                   padding: EdgeInsets.all(20.0),
//         //                   child: const Text('Need',
//         //                       style: TextStyle(
//         //                           color: Colors.white,
//         //                           fontSize: 40.0,
//         //                           fontWeight: FontWeight.bold,
//         //                           fontStyle: FontStyle.italic)).trTrans,
//         //                 ),
//         //               ),
//         //             ),
//         //           ),
//         //         ),
//         //         Divider(height: 3),
//         //         Expanded(
//         //           child: Material(
//         //             color: Colors.redAccent.shade400,
//         //             child: InkWell(
//         //               onTap: () async {
//         //                 // var user = await FirebaseAuthProvider().getCurrentUser();
//         //                 // print(user);
//         //                 // if (user == null) {
//         //                 //   showErrorDialog();
//         //                 // } else {
//         //                 //   Navigator.push(context,
//         //                 //       MaterialPageRoute(builder: (context) => LoginScreen()
//         //                 //           // Profile()
//         //                 //       ));
//         //                 // }
//         //               },
//         //               child: Center(
//         //                 child: Container(
//         //                   decoration: new BoxDecoration(
//         //                       border: new Border.all(
//         //                           color: Colors.white, width: 5.0)),
//         //                   padding: new EdgeInsets.all(20.0),
//         //                   child: Text('Donate',
//         //                       style: new TextStyle(
//         //                           color: Colors.white,
//         //                           fontSize: 40.0,
//         //                           fontWeight: FontWeight.bold,
//         //                           fontStyle: FontStyle.italic)),
//         //                 ),
//         //               ),
//         //             ),
//         //           ),
//         //         ),
//         //       ],
//         //     ),
//         //   ],
//         // ),
//         );
//   }
// }
