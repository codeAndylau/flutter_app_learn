import 'package:flutter/material.dart';
import 'package:flutter_app_learn/common/values/colors.dart';
import 'package:flutter_app_learn/common/values/radii.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 输入框
Widget inputTextEdit({
  @required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  String hintText,
  bool isPassword = false,
  double marginTop = 15,
}) {
  return Container(
    margin: EdgeInsets.only(top: marginTop.h),
    height: 44.h,
    decoration: BoxDecoration(
      color: AppColors.secondaryElement,
      borderRadius: Radii.k6pxRadius,
    ),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: AppColors.primaryText,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w400,
        fontSize: 18.ssp,
      ),
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}

/// email 输入框
/// 背景白色，文字黑色，带阴影
Widget inputEmailEdit({
  @required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  String hintText,
  bool isPassword = false,
  double marginTop = 15,
  bool autofocus = false,
}) {
  return Container(
    height: 44,
    margin: EdgeInsets.only(top: marginTop),
    decoration: BoxDecoration(
      color: AppColors.primaryBackground,
      borderRadius: Radii.k6pxRadius,
      border: Border.all(color: Colors.grey[300], width: 1),
      // boxShadow: [
      //   BoxShadow(
      //     color: Color.fromARGB(41, 0, 0, 0),
      //     offset: Offset(0, 1),
      //     blurRadius: 0,
      //   ),
      // ],
    ),
    child: TextField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: AppColors.primaryText,
        ),
      ),
      style: TextStyle(
        color: AppColors.primaryText,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w400,
        fontSize: 18.ssp,
      ),
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}
