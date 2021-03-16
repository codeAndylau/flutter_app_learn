import 'package:flutter/material.dart';
import 'package:flutter_app_learn/global.dart';
import 'package:flutter_app_learn/pages/welcome/welcome.dart';
import 'package:flutter_app_learn/routers.dart';

void main() => Global.init().then((value) => runApp(MyApp()));

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
