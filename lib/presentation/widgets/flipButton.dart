import 'package:flutter/material.dart';
import 'package:raktdata_app/core/app_colors.dart';
import 'package:raktdata_app/widgets/size_ext.dart';

class FlipButton extends StatelessWidget {
  const FlipButton({
    Key? key,
    required this.buttonName,
    required this.onTap,
    required this.bgColor,
    required this.textColor,
  }) : super(key: key);
  final String buttonName;
  final VoidCallback onTap;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.Sh,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: TextButton(


        style: ButtonStyle(

          overlayColor: MaterialStateProperty.resolveWith(
                (states) => AppColors.white,
          ),
        ),
        onPressed: onTap,
        child: Text(
          buttonName,
          style: TextStyle(
            color: textColor
          ),

          // buttonTextStyle,
              // .copyWith(color: textColor),
        ),
      ),
    );
  }
}
