import 'package:flutter/material.dart';
import 'package:flutter_app_learn/common/values/colors.dart';
import 'package:flutter_app_learn/common/values/radii.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 扁平圆角按钮
Widget btnFlatButtonWidget({
  @required VoidCallback onPressed,
  double width = 140,
  double height = 44,
  Color gbColor = AppColors.primaryElement,
  String title = "button",
  Color fontColor = AppColors.primaryElementText,
  double fontSize = 18,
  String fontName = "Montserrat",
  FontWeight fontWeight = FontWeight.w400,
}) {
  return Container(
    width: width.w,
    height: height.h,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
        return gbColor;
      }), shape: MaterialStateProperty.resolveWith((states) {
        return RoundedRectangleBorder(
          borderRadius: Radii.k6pxRadius,
        );
      })),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontFamily: fontName,
          fontWeight: fontWeight,
          fontSize: fontSize.ssp,
          height: 1,
        ),
      ),
    ),
  );
}

/// 第三方按钮
Widget btnFlatButtonBorderOnlyWidget({
  @required VoidCallback onPressed,
  double width = 88,
  double height = 44,
  String iconFileName,
}) {
  return Container(
    width: width.w,
    height: height.h,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
        return Colors.grey[300];
      }), shape: MaterialStateProperty.resolveWith((states) {
        return RoundedRectangleBorder(
          borderRadius: Radii.k6pxRadius,
        );
      })),
      child: Image.asset(
        "assets/images/icons-$iconFileName.png",
      ),
    ),
  );
}
