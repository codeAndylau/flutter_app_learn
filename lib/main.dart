
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/common/utils/utils.dart';
import 'package:flutter_app_learn/common/values/global.dart';
import 'package:flutter_app_learn/pages/welcome/welcome.dart';
import 'package:flutter_app_learn/common/values/routers.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_learn/flutter_learn/routers/error_page.dart';
import 'package:flutter_app_learn/flutter_learn/routers/my_navigator_observers.dart';

/// 程序入口
// void main() => Global.init().then((value) => runApp(MultiProvider(
//     providers: [ChangeNotifierProvider(create: (context) => Counter())],
//     child: MyApp())));

void main() {
  Global.init().then((value) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Counter()),
        ChangeNotifierProvider(create: (context) => ThemeConfigModel()),
      ],
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      /// 定义应用程序的主题颜色，可以制定一个主题中每个控件的颜色
      /// ThemeData 是MaterialDesign  Widge库的主题数据
      /// 可以通过Theme.of方法获取当前的主题
      theme: context.watch<ThemeConfigModel>().defalutTheme,

      /// Map<String, WidgetBuilder>
      /// 当在使用Navigator.pushName来路由的时候，会在routers中查找处路由的名字
      routes: staticRouters,
      //initialRoute: '/first',
      /// 默认显示页面
      /// 与router中配置的‘/’是互斥的， 不能同时使用
      home: WelcomePage(),

      /// 当路由找不到合适的时候，配置404跳转
      // onGenerateRoute: (RouteSettings settings) {
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => ErrorPage(), settings: settings);
      // },

      // /// 监听所有的页面路由
      // navigatorObservers: [
      //   /// 创建自定义路由监听
      //   MyNavigatorObservers(),
      // ],
      // debugShowCheckedModeBanner: false,
    );
  }
}

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }

  /// 通过列出' Counter '的所有属性，使' Counter '在devtools中可读
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}

