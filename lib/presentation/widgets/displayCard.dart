import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:raktdata_app/presentation/widgets/photo_view.dart';
import 'package:raktdata_app/presentation/widgets/whatsappImplementation.dart';
import 'package:raktdata_app/widgets/size_ext.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../View_model/admin_view_model.dart';
import '../../core/app_colors.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/text_theme_helper.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_imageView.dart';
import '../../widgets/util.dart';

class DisplayCardWidget extends StatefulWidget {
  late String patientName;
  final String disease;
  final String hospitalName;
  final String mobileNumber;
  final String city;
  final String bloodGroup;
  final DateTime date; // Assume date is a DateTime object
  final String bloodUnits;
  final String attendersName;
  final String prescriptionUrl;
  String docId;

  DisplayCardWidget({
    required this.patientName,
    required this.disease,
    required this.hospitalName,
    required this.mobileNumber,
    required this.city,
    required this.bloodGroup,
     required this.date,
    required this.bloodUnits,
    required this.attendersName,
    required this.prescriptionUrl,
    required this.docId,
  });

  @override
  State<DisplayCardWidget> createState() => _DisplayCardWidgetState();
}

class _DisplayCardWidgetState extends State<DisplayCardWidget> {
  bool _isImagePopupOpen = false;

  late NeedViewModel _needViewModel;

  @override
  Widget build(BuildContext context) {
    _needViewModel = context.watch<NeedViewModel>();
    return Column(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
            side: BorderSide(
              color: AppColors.lightgrey.withOpacity(.2),
              width: 1.Sw,
            ),
          ),
          child: Container(
            width: 400.Sw,
            height: 410.Sh,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: getPadding(left: 8, top: 13, right: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: CustomImageView(
                          imagePath: ImageConstant.blood2,
                          color: AppColors.deepRed,
                          height: 40.Sh,
                          width: 40.Sw,
                        ),
                      ),
                      SizedBox(
                        width: 8.Sw,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: getPadding(top: 6),
                            // const EdgeInsets.fromLTRB(0, 6.0, 0, 0),
                            child: Text(
                              widget.patientName,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextThemeHelper.titleBoldBlackContainer_4,
                              // style: TextStyle(
                              //   color: AppColors.black,
                              //   fontSize: getFontSize(20),
                              //   fontWeight: FontWeight.w600,
                              // ),
                            ),
                          ),
                          Text(
                            widget.bloodGroup + "," + widget.bloodUnits,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextThemeHelper.labelLargeNotoSans1,
                            // style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.black,
                  thickness: .2,
                  indent: 8,
                  endIndent: 8,
                ),
                Container(
                  child: Padding(
                    padding: getPadding(left: 8),
                    // EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Disease",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextThemeHelper.montserratOnPrimary1,
                        ),
                        Text(
                          widget.disease,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextThemeHelper.montserratOnPrimary2,
                        ),
                        SizedBox(
                          height: 10.Sh,
                        ),
                        Text(
                          "Hospital",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextThemeHelper.montserratOnPrimary1,
                        ),
                        Text(
                          widget.hospitalName,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextThemeHelper.montserratOnPrimary2,
                        ),
                        SizedBox(
                          height: 10.Sh,
                        ),
                        Text(
                          "city",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextThemeHelper.montserratOnPrimary1,
                        ),
                        Text(
                          widget.city,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextThemeHelper.montserratOnPrimary2,
                        ),
                        SizedBox(
                          height: 10.Sh,
                        ),
                        Text(
                          "Attender",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextThemeHelper.montserratOnPrimary1,
                        ),
                        Text(
                          widget.attendersName,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextThemeHelper.montserratOnPrimary2,
                        ),
                        SizedBox(
                          height: 10.Sh,
                        ),
                        Text(
                          "Mobile Number",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextThemeHelper.montserratOnPrimary1,
                        ),
                        Text(
                          widget.mobileNumber,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextThemeHelper.montserratOnPrimary2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Date",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextThemeHelper.montserratOnPrimary1,                        ),
                        Text(
                           widget.date.toString(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextThemeHelper.montserratOnPrimary2,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: .2,
                  indent: 8,
                  endIndent: 8,
                ),
                Container(
                  child: Padding(
                    padding: getPadding(left: 2, right:2,top: 3, bottom: 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomIconButton(
                          child: CustomImageView(
                            svgPath: ImageConstant.eye,
                            color: AppColors.blue,
                            height: getSize(30),
                          ),
                          onTap: () {
                            // sendWhatsAppMessage();

                            Get.to(() => ZoomableImage(imageUrl: widget.prescriptionUrl));
                            // Get.back();
                          },
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: getPadding(
                                    left: 2, right: 2, top: 3, bottom: 2),
                                // const EdgeInsets.fromLTRB(0, 0, 0, 2.0),
                                child: CustomIconButton(
                                  child: CustomImageView(
                                    svgPath: ImageConstant.tickCircle1,
                                    color: AppColors.lightGreen,
                                    height: getSize(30),
                                  ),
                                  onTap: () {

                                    _needViewModel.deleteDocument(widget.docId,true);
                                    setState(() {});
                                    // Get.back();
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Padding(
                                padding: getPadding(
                                    left: 2, right: 2, top: 3, bottom: 2),
                                child: CustomIconButton(
                                  child: CustomImageView(
                                    svgPath: ImageConstant.closeCircle,
                                    color: AppColors.deepRed,
                                    height: getSize(30),
                                  ),
                                  onTap: () {
                                    _needViewModel.deleteDocument(widget.docId,false);
                                    setState(() {});
                                    // Get.back();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
