/*
 * @Author       : djkloop
 * @Date         : 2020-06-22 00:27:20
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-22 00:30:24
 * @Description  : 头部注释
 * @FilePath     : /open_app/lib/ui/pages/tab/tab_navigator.dart
 */

import 'package:flutter/cupertino.dart';
import 'package:ff_annotation_route/ff_annotation_route.dart' show FFRoute;

@FFRoute(name: "openapp://tab-navigator", routeName: "导航页")
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Text("tab-main"),
    );
  }
}
