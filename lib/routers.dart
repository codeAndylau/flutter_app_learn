import 'package:flutter_app_learn/pages/sign_in/sign_in.dart';
import 'package:flutter_app_learn/pages/sign_up/sign_up.dart';

/*
静态路由，大概分以下几步：
1.注册路由且保证路由的唯一性
2.跳页时使用Navigator.of(context).pushNamed('路由地址');
3.使用Navigator.of(context).pop();
4.不支持向下一个页面传递参数
*/

var staticRouters = {
  "/sign_in": (content) => SignInPage(), // 登录
  "/sign_up": (context) => SignUpPage(), // 注册
};
