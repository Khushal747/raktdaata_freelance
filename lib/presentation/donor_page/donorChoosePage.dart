import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:raktdata_app/core/app_colors.dart';
import 'package:raktdata_app/presentation/donor_login_signUp/donor_signUp.dart';
import 'package:raktdata_app/widgets/size_ext.dart';
import 'package:raktdata_app/widgets/translate_extension.dart';
import '../../const/resource.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/text_theme_helper.dart';
import '../../widgets/custom_imageView.dart';
import 'package:raktdata_app/presentation/donor_login_signUp/donor_login.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/flipButton.dart';
import '../widgets/whatsappImplementation.dart';

class DonorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: getPadding(left: 20,right: 20,top: 40),
          child: Column(
            children: [
              Flexible(
                child: Column(
                  children: [
                    Padding(
                      padding:  getPadding(top: 70),
                      child: Center(
                        child: Container(
                          height: 250.Sh,
                          width: 250.Sw,

                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(R.ASSETS_IMAGES_LOGO_IMAGE1_PNG),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.Sh,
                    ),
                    Text(
                      "Raktdaata team".trTrans,
                      overflow: TextOverflow.ellipsis,
                      style: TextThemeHelper.titleBoldBlackContainer_3,

                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10.Sh,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        "A drop of blood can save a life!".trTrans,
                        overflow: TextOverflow.ellipsis,
                        style: TextThemeHelper
                            .montserratOnPrimary2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // WhatsappWidget(),
                  ],
                ),
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.deepRed,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: FlipButton(
                        bgColor: Colors.white,
                        buttonName: 'Login'.trTrans,
                        onTap: () {
                          Get.to(() => Donor_Login());
                        },
                        textColor: AppColors.black,
                      ),
                    ),
                    Expanded(
                      child: FlipButton(
                        bgColor: Colors.transparent,
                        buttonName: 'Sign Up'.trTrans,
                        onTap: () {
                          Get.to(() => DonorSignUp());
                        },
                        textColor: AppColors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
