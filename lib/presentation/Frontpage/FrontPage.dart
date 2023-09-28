
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:raktdata_app/core/app_colors.dart';
import 'package:raktdata_app/core/app_export.dart';
import 'package:raktdata_app/widgets/size_ext.dart';

import '../../theme/text_theme_helper.dart';
import '../../widgets/custom_elevated_button.dart';
import '../adminPage/admin_login.dart';
import '../donor_page/donorChoosePage.dart';
import '../need_pages/signUp_requirement.dart';
import '../widgets/whatsappImplementation.dart';

class FrontPage extends StatefulWidget {
  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  void getData() async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('Need');
    QuerySnapshot querySnapshot = await collectionRef.get();
    List<Object?> allData =
        querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.deepRed,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // SizedBox(height: 80,),
            Padding(
              padding: getPadding(top: 80, bottom: 10),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Shri Bijasan Maala Seva Mandal",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextThemeHelper.titleBoldPrimaryContainer_3,
                      ),
                    ),
                    SizedBox(height: getVerticalSize(10)),
                    Center(
                      child: Text(
                        "Bijasan Mata Mandir,Indore",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextThemeHelper.titleMediumPrimaryContainer_1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: getPadding(top: 20),
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: getPadding(top: 20, left: 10, right: 10),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: getVerticalSize(20),
                          ),
                          WhatsappWidget(),
                          CustomElevatedButton(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: AppColors.deepRed,
                            ),
                            height: 180.Sh,
                            width: 350.Sw,
                            margin: getMargin(top: 5),
                            onTap: () {
                              Get.to(() => DonorPage());
                            },
                            buttonStyle: ButtonThemeHelper
                                .gradientnameblueA200namepurple900
                                .copyWith(
                              fixedSize: MaterialStateProperty.all<Size>(
                                Size(
                                  double.maxFinite,
                                  getVerticalSize(50),
                                ),
                              ),
                            ),
                            text: "Donor",
                            // buttonTextStyle: ,
                            leftIcon: Container(
                              margin: getMargin(
                                left: 5,
                                right: 14,
                              ),
                              child: CustomImageView(
                                imagePath: ImageConstant.donateIcon2,
                                // donateIcon ,
                                color: AppColors.white,
                                height: 45.Sh,
                                width: 45.Sh,
                              ),
                            ),
                          ),

                          CustomElevatedButton(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: AppColors.deepRed,
                            ),
                            height: 180.Sh,
                            width: 350.Sw,
                            text: "Need",
                            leftIcon:  Icon(
                              Icons
                                  .bloodtype_outlined, // Replace with your desired person icon
                              size: 50.Sp, // Adjust the size as needed
                              color:
                                  AppColors.white, // Adjust the color as needed
                            ),
                            margin: getMargin(
                              top: 21,
                            ),

                            onTap: () {
                              Get.to(() => RequirementSignUp());
                            },
                            buttonStyle: ButtonThemeHelper
                                .gradientnameblueA200namepurple900
                                .copyWith(
                              fixedSize: MaterialStateProperty.all<Size>(
                                Size(
                                  double.maxFinite,
                                  getVerticalSize(50),
                                ),
                              ),
                            ),
                            // decoration: ButtonThemeHelper
                            //     .gradientnameblueA200namepurple900Decoration,
                            // buttonTextStyle:
                            // TextThemeHelper.titleMediumNotoSansPrimaryContainer,
                          ),

                          CustomElevatedButton(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.r),
                              color: AppColors.deepRed,
                            ),
                            height: 180.Sh,
                            width: 350.Sw,
                            text: "Admin",
                            leftIcon:  Icon(
                              Icons
                                  .person, // Replace with your desired person icon
                              size: 50.Sp, // Adjust the size as needed
                              color:
                                  AppColors.white, // Adjust the color as needed
                            ),
                            margin: getMargin(
                              top: 21,
                            ),
                            onTap: () {
                              getData();
                              Get.to(() => AdminLogin());
                            },
                            buttonStyle: ButtonThemeHelper
                                .gradientnameblueA200namepurple900
                                .copyWith(
                              fixedSize: MaterialStateProperty.all<Size>(
                                Size(
                                  double.maxFinite,
                                  getVerticalSize(50),
                                ),
                              ),
                            ),

                          ),
                          SizedBox(
                            height: 20.Sh,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
