/*
 * @Author       : djkloop
 * @Date         : 2020-06-21 18:27:54
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-22 00:44:34
 * @Description  : 头部注释
 * @FilePath     : /open_app/lib/ui/pages/no_route/no_route_page.dart
 */

import 'package:flutter/cupertino.dart';

class NoRoutePage extends StatefulWidget {
  @override
  _NoRoutePageState createState() => _NoRoutePageState();
}

class _NoRoutePageState extends State<NoRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("没有路由"),
    );
  }
}
