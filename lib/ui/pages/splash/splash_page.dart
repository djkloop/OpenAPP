/*
 * @Author       : djkloop
 * @Date         : 2020-06-22 00:11:08
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-23 00:43:16
 * @Description  : 头部注释
 * @FilePath     : /open_app/lib/ui/pages/splash/splash_page.dart
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// local data
import 'package:open_app/config/resource_manager.dart';

/// plugins
import 'package:open_app/common/common_plugins.dart';

/// l10n
import 'package:open_app/generated/l10n.dart';
import 'package:open_app/view_model/open_app_model/common_view_model.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // TimerUtil _timerUtil;
  CommonViewModel commonViewModel = CommonViewModel();

  List<String> _guideList = [
    ImageHelper.wrapAssets('guide_book_1'),
    ImageHelper.wrapAssets('guide_book_2'),
    ImageHelper.wrapAssets('guide_book_3'),
  ];

  // List<Widget> _bannerList = new List();

  // int _status = 0;
  // int _count = 3;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    Stream.value(1)
        .delay(
      Duration(microseconds: 300),
    )
        .listen(
      (_) {
        /// 设置引导动画或者去加载splash
        commonViewModel.setGuidBanner(true);
        if (commonViewModel.isGuideBanner &&
            ObjectUtil.isNotEmpty(_guideList)) {
          // commonViewModel.setGuidBanner(false);
          print("加载引导动画 ${commonViewModel.isGuideBanner}");
        } else {
          print("加载splash");
        }
      },
    );
  }

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
            bottom: 20,
            left: 0,
            right: 0,
            child: Image.asset(
              ImageHelper.wrapAssets("splash_logo"),
              width: 128,
              height: 128,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
