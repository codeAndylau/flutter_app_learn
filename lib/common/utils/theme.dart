import 'package:flutter/material.dart';

enum ThemeType {
  light,
  dark,
  pink,
}

/// 主题切换配置model
class ThemeConfigModel with ChangeNotifier {
  /// 亮色
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  );

  /// 暗色
  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey,
  );

  /// 紫色
  final ThemeData pinkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.pink[400],
  );

  /// 测试主题
  final ThemeData textTheme = ThemeData(
    /// 配置应用程序的亮色 和 暗色
    brightness: Brightness.light,

    /// 导航栏颜色，floatactionbutton的颜色等
    primarySwatch: Colors.green,

    /// 配置应用程序的主背景颜色
    primaryColor: Colors.blue,

    /// 配置应用程序的前景色
    accentColor: Colors.yellow,
    highlightColor: Colors.red,
    splashColor: Colors.yellow,

    /// 用来配置应用程序appbar 的显示样式
    appBarTheme: AppBarTheme(
      /// 背景颜色
      color: Colors.deepPurple,

      /// 阴影高度
      elevation: 10,

      /// 用来配置 icon 的主题
      iconTheme: IconThemeData(
        color: Colors.red,
        size: 44,
        opacity: 1,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.red,
        size: 44,
        opacity: 1,
      ),
    ),
    primaryIconTheme: IconThemeData(),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
      buttonColor: Colors.pink[800],
    ),
  );

  ThemeData defalutTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  );

  void swithThemeWithType(ThemeType type) {
    switch (type) {
      case ThemeType.light:
        print('light');
        defalutTheme = lightTheme;
        break;
      case ThemeType.dark:
        print('dart');
        defalutTheme = darkTheme;
        break;
      case ThemeType.pink:
        print('normal');
        defalutTheme = pinkTheme;
        break;
    }
    notifyListeners();
  }
}
