import 'package:flutter/material.dart';

class MyNavigatorObservers extends NavigatorObserver {
  /// 当调用navigator.of.pushName 时回调
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    print('didPush route setting is ' + route.settings.toString());
    print('didPush route setting.name is ' + route.settings.name.toString());
    print('didPush previousRoute setting is ' + previousRoute.settings.toString());
    print('didPush previousRoute setting.name is ' + previousRoute.settings.name.toString());
  }

  /// 当调用navigator.of.pop 时回调
  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    print('didPop route setting is ' + route.settings.toString());
    print('didPop route setting.name is ' + route.settings.name.toString());
    print('didPop previousRoute setting is ' + previousRoute.settings.toString());
    print('didPop previousRoute setting.name is ' + previousRoute.settings.name.toString());
  }

  /// 当调用navigator.of.remove 时回调
  @override
  void didRemove(Route route, Route previousRoute) {
    super.didRemove(route, previousRoute);
  }

  // @override
  // void didReplace({Route newRoute, Route oldRoute}) {
  //   super.didReplace(newRoute, oldRoute);
  // }

  @override
  void didStartUserGesture(Route route, Route previousRoute) {
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
  }
}
