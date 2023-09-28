// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:provider/provider.dart';
// import 'package:raktdata_app/core/app_colors.dart';
// import 'package:raktdata_app/widgets/size_ext.dart';
//
// import '../../core/utils/image_constant.dart';
// import '../../core/utils/size_utils.dart';
// import '../../View_model/auth_view_model_donor.dart';
// import '../../theme/app_decoration.dart';
// import '../../theme/button_theme_helper.dart';
// import '../../theme/text_theme_helper.dart';
// import '../../theme/theme_helper.dart';
// import '../../widgets/custom_elevated_button.dart';
// import '../../widgets/custom_imageView.dart';
// import '../../widgets/custom_textfrom_field.dart';
// import '../../widgets/util.dart';
// import 'package:raktdata_app/presentation/donor_login_signUp/donor_login.dart';
// import '../widgets/custom_progress_bar.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   late AuthViewModel _authViewModel;
//
//   TextEditingController nameController = TextEditingController();
//
//   TextEditingController emailController = TextEditingController();
//
//   TextEditingController passwordController = TextEditingController();
//
//   TextEditingController confirmPassworController = TextEditingController();
//
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   bool _passwownVisible = false;
//   bool _confirmPasswownVisible = false;
//
//   @override
//   Widget build(BuildContext context) {
//     _authViewModel = context.watch<AuthViewModel>();
//     return Scaffold(
//       body: Container(
//         height: Util.deviceHeight,
//         decoration: AppDecoration.getScreenBg,
//         child: CustomProgressBar(
//           visibility: _authViewModel.loading,
//           child: Container(
//             decoration: AppDecoration.getScreenBg,
//             child: Form(
//               key: _formKey,
//               child: SingleChildScrollView(
//                 padding: getPadding(
//                   top: 210,
//                 ),
//                 child: Container(
//                   margin: getMargin(
//                     left: 7,
//                   ),
//                   child: Container(
//                     padding: getPadding(
//                       left: 32,
//                       top: 3,
//                       right: 32,
//                       bottom: 3,
//                     ),
//                     decoration: AppDecoration.outline1.copyWith(
//                       // color: Colors.blue,
//                       borderRadius: BorderRadiusStyle.roundedBorder18,
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: getPadding(
//                             left: 1,
//                           ),
//                           child: Text(
//                             "Signup",
//                             overflow: TextOverflow.ellipsis,
//                             textAlign: TextAlign.left,
//                             // style: theme.textTheme.headlineLarge,
//                             style: TextThemeHelper.headlineLarge32, //heading color changed
//
//                             // selectionColor: Colors.black,
//                           ),
//                         ),
//                         Padding(
//                           padding: getPadding(
//                             top: 7,
//                           ),
//                           child: Text(
//                             "Just some details to get you in.!",
//                             overflow: TextOverflow.ellipsis,
//                             textAlign: TextAlign.left,
//                             style: TextThemeHelper.labelLargeNotoSans,
//                           ),
//                         ),
//                         Container(
//                           margin: getMargin(
//                             left: 1,
//                             top: 9,
//                           ),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               CustomTextFormField(
//                                 controller: nameController,
//                                 textStyle: TextThemeHelper
//                                     .bodyLargePrimaryContainer_1,
//                                 hintText: "Name",
//                                 hintStyle: TextThemeHelper
//                                     .bodyLargePrimaryContainer_1,
//                                 textInputAction: TextInputAction.next,
//                               ),
//                               CustomTextFormField(
//                                 controller: emailController,
//                                 margin: getMargin(
//                                   top: 17,
//                                   bottom: 17,
//                                 ),
//                                 textStyle: TextThemeHelper
//                                     .bodyLargePrimaryContainer_1,
//                                 hintText: "Email",
//                                 hintStyle: TextThemeHelper
//                                     .bodyLargePrimaryContainer_1,
//                                 textInputAction: TextInputAction.next,
//                                 textInputType: TextInputType.emailAddress,
//                               ),
//                               CustomTextFormField(
//                                 controller: passwordController,
//                                 textStyle: TextThemeHelper
//                                     .bodyLargePrimaryContainer_1,
//                                 hintText: "Password",
//                                 hintStyle: TextThemeHelper
//                                     .bodyLargePrimaryContainer_1,
//                                 textInputAction: TextInputAction.next,
//                                 textInputType:
//                                 TextInputType.visiblePassword,
//                                 obscureText: !_passwownVisible,
//                                 suffix: GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       _passwownVisible =
//                                       !_passwownVisible;
//                                     });
//                                   },
//                                   child: Container(
//                                     margin: getMargin(
//                                       left: 5,
//                                       right: 14,
//                                     ),
//                                     child: CustomImageView(
//                                       svgPath: _passwownVisible
//                                           ? ImageConstant.imgClosedEye
//                                           : ImageConstant.eyeIcon,
//                                       color: theme.colorScheme.primaryContainer.withOpacity(1),
//                                       height: 25.Sh,
//                                     ),
//                                   ),
//                                 ),
//                                 suffixConstraints: BoxConstraints(
//                                   maxHeight: getVerticalSize(
//                                     46,
//                                   ),
//                                 ),
//                               ),
//                               CustomTextFormField(
//                                 controller: confirmPassworController,
//                                 margin: getMargin(
//                                   top: 17,
//                                 ),
//                                 textStyle: TextThemeHelper
//                                     .bodyLargePrimaryContainer_1,
//                                 hintText: "Confirm Password",
//                                 hintStyle: TextThemeHelper
//                                     .bodyLargePrimaryContainer_1,
//                                 textInputType:
//                                 TextInputType.visiblePassword,
//                                 obscureText: !_confirmPasswownVisible,
//                                 suffix: GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       _confirmPasswownVisible =
//                                       !_confirmPasswownVisible;
//                                     });
//                                   },
//                                   child: Container(
//                                     margin: getMargin(
//                                       left: 5,
//                                       right: 14,
//                                     ),
//                                     child: CustomImageView(
//                                       svgPath: _confirmPasswownVisible
//                                           ? ImageConstant.imgClosedEye
//                                           : ImageConstant.eyeIcon,
//                                       color:AppColors.black.withOpacity(1),
//                                       height: 25.Sh,
//                                     ),
//                                   ),
//                                 ),
//                                 suffixConstraints: BoxConstraints(
//                                   maxHeight: getVerticalSize(
//                                     46,
//                                   ),
//                                 ),
//                               ),
//                               CustomElevatedButton(
//                                 width: getHorizontalSize(
//                                   360,
//                                 ),
//                                 height: getVerticalSize(
//                                   50,
//                                 ),
//
//                                 margin: getMargin(
//                                   top: 32,
//                                 ),
//                                 text: "Sign Up",
//                                 onTap: () {
//                                   _authViewModel.signUp(
//                                     nameController.text,
//                                     emailController.text,
//                                      passwordController.text,
//                                       confirmPassworController.text,
//                                     cityController.text,
//
//
//                                   );
//                                 },
//                                 buttonStyle: ButtonThemeHelper
//                                     .gradientnameblueA200namepurple900
//                                     .copyWith(
//                                   fixedSize: MaterialStateProperty.all<Size>(
//                                     Size(
//                                       double.maxFinite,
//                                       getVerticalSize(50),
//                                     ),
//                                   ),
//                                 ),
//                                 decoration: ButtonThemeHelper
//                                     .gradientnameblueA200namepurple900Decoration,
//                                 buttonTextStyle:
//                                 TextThemeHelper.titleMediumNotoSansPrimaryContainer,
//                               ),
//                               // CustomElevatedButton(
//                               //   width: getHorizontalSize(
//                               //     337,
//                               //   ),
//                               //   height: getVerticalSize(
//                               //     50,
//                               //   ),
//                               //   text: "Sign Up",
//                               //   buttonStyle: ButtonThemeHelper
//                               //       .gradientnameblueA200namepurple900,
//                               //   onTap: () {
//                               //     _authViewModel.signUp(
//                               //       nameController.text,
//                               //       emailController.text,
//                               //       passwordController.text,
//                               //       confirmPassworController.text,
//                               //     );
//                               //   },
//                               //   decoration: ButtonThemeHelper
//                               //       .gradientnameblueA200namepurple900Decoration,
//                               //   buttonTextStyle: TextThemeHelper
//                               //       .titleMediumNotoSansPrimaryContainer,
//                               //   alignment: Alignment.bottomCenter,
//                               // ),
//                               Padding(
//                                 padding: getPadding(
//                                   top: 125,
//                                 ),
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     Get.off(() => Donor_Login());
//                                   },
//                                   child: Text(
//                                     "Already Registered? Login",
//                                     overflow: TextOverflow.ellipsis,
//                                     textAlign: TextAlign.left,
//                                     style: TextThemeHelper.labelLargeNotoSans,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
