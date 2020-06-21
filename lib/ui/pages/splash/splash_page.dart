/*
 * @Author       : djkloop
 * @Date         : 2020-06-22 00:11:08
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-22 01:18:24
 * @Description  : 头部注释
 * @FilePath     : /open_app/lib/ui/pages/splash/splash_page.dart
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_app/config/resource_manager.dart';
import 'package:open_app/generated/l10n.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Gradient gradient = LinearGradient(
      colors: [
        Color.fromRGBO(59, 120, 172, 1),
        Color.fromRGBO(108, 175, 172, 1),
      ],
    );
    Shader shader =
        gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    return CupertinoPageScaffold(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                S.of(context).splash_title,
                style: TextStyle(
                  fontSize: 30,
                  decoration: TextDecoration.none,
                  foreground: Paint()..shader = shader,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Image.asset(
              ImageHelper.wrapAssets("splash_logo.png"),
              width: 256,
              height: 256,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
