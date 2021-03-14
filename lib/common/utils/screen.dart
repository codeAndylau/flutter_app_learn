import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
    ScreenUtil().setWidth(540)  (sdk>=2.6 : 540.w)   //根据屏幕宽度适配尺寸
    ScreenUtil().setHeight(200) (sdk>=2.6 : 200.h)   //根据屏幕高度适配尺寸(一般根据宽度适配即可)
    ScreenUtil().radius(200)    (sdk>=2.6 : 200.r)   //根据宽度或高度中的较小者进行调整
    ScreenUtil().setSp(24)      (sdk>=2.6 : 24.sp)   //适配字体
    ScreenUtil().setSp(24, allowFontScalingSelf: true)   (sdk>=2.6 : 24.ssp) //适配字体(根据系统的“字体大小”辅助选项来进行缩放)
    ScreenUtil().setSp(24, allowFontScalingSelf: false)  (sdk>=2.6 : 24.nsp) //适配字体(不会根据系统的“字体大小”辅助选项来进行缩放)

    ScreenUtil().pixelRatio       //设备的像素密度
    ScreenUtil().screenWidth   (sdk>=2.6 : 1.sw)   //设备宽度
    ScreenUtil().screenHeight  (sdk>=2.6 : 1.sh)   //设备高度
    ScreenUtil().bottomBarHeight  //底部安全区距离，适用于全面屏下面有按键的
    ScreenUtil().statusBarHeight  //状态栏高度 刘海屏会更高
    ScreenUtil().textScaleFactor //系统字体缩放比例

    ScreenUtil().scaleWidth  // 实际宽度设计稿宽度的比例
    ScreenUtil().scaleHeight // 实际高度与设计稿高度度的比例

    ScreenUtil().orientation  //屏幕方向

    0.2.sw  //屏幕宽度的0.2倍
    0.5.sh  //屏幕高度的50% 
 */

/// 设备的像素密度
double lcPixelRatio = ScreenUtil().pixelRatio;

/// 设备的宽
double lcScreenWidth = ScreenUtil().screenWidth;

/// 设备的高
double lcScreenHeight = ScreenUtil().screenHeight;

/// 设备的底部安全区距离，适用于全面屏下面有按键的
double lcBottomBarHeight = ScreenUtil().bottomBarHeight;

/// 设备的状态栏高度 刘海屏会更高
double lcStatusBarHeight = ScreenUtil().statusBarHeight;

/// 设置宽度
double lcSetWidth(double width) {
  return width.w;
}

/// 设置高度
double lcSetHeight(double height) {
  return height.h;
}

/// 设置字体的大小, 默认运行根据系统缩放
double lcSetFontSize(double fontSize, [allowFontScalingSelf = true]) {
  return ScreenUtil().setSp(fontSize, allowFontScalingSelf: allowFontScalingSelf);
}