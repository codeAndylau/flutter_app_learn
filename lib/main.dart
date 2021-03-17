import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/common/values/global.dart';
import 'package:flutter_app_learn/pages/welcome/welcome.dart';
import 'package:flutter_app_learn/common/values/routers.dart';
import 'package:provider/provider.dart';

// void main() {
//   Global.init().then((value) {
//     runApp(MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => Counter())
//         ],
//         child: MyApp(),
//     ));
//   });
// }

/// 程序入口
void main() => Global.init().then((value) => runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => Counter())],
    child: MyApp())));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      routes: staticRouters,
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
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
