/*
 * @Author       : djkloop
 * @Date         : 2020-06-25 01:52:54
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-26 13:24:14
 * @Description  : 头部注释
 * @FilePath     : /open_app/lib/view_model/splash/splash_view_model.dart
 */

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:open_app/open_app_routes.dart';

/// model
import 'package:open_app/view_model/open_app_model/common_view_model.dart';

/// plugins
import 'package:open_app/common/common_plugins.dart';

/// manager
import 'package:open_app/config/resource_manager.dart';

class SplashViewModel with ChangeNotifier {
  CommonViewModel commonViewModel = CommonViewModel();
  int status = 0;

  List<String> guideList = ['guide_book_1', 'guide_book_2', 'guide_book_3'];
  StreamSubscription _subscription;

  /// page data
  double _top = 115;
  double get top => _top;

  void created(context) {
    _subscription = Stream.value(1).delay(Duration(seconds: 2)).listen((_) {
      /// 设置引导动画或者去加载splash
      if (commonViewModel.isGuideBanner && ObjectUtil.isNotEmpty(guideList)) {
        commonViewModel.setGuidBanner(false);
        guideList.forEach((image) {
          precacheImage(
              ImageHelper.getAssetImage(image, format: ImageFormat.webp),
              context);
        });
        _initGuide();
      } else {
        print("加载splash");
        _initSplash();
      }
    });
  }

  void destroyed() {
    _subscription?.cancel();
  }

  void _initGuide() {
    status = 1;
    notifyListeners();
  }

  /// 加载开屏
  void _initSplash() {
    status = 2;
    notifyListeners();
  }

  /// 加载正式的页面
  // void _initMain() {}

  void splashGuideDone(context) {
    Navigator.pushReplacementNamed(context, Routes.openappTabNavigator);
  }
}
