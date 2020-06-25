/*
 * @Author       : djkloop
 * @Date         : 2020-06-25 01:52:54
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-25 18:55:40
 * @Description  : 头部注释
 * @FilePath     : /open_app/lib/view_model/splash/splash_view_model.dart
 */

import 'dart:async';

import 'package:flutter/cupertino.dart';

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
  double _top = 80;
  double get top => _top;

  void created(context) {
    _subscription = Stream.value(1).delay(Duration(seconds: 2)).listen((_) {
      /// 设置引导动画或者去加载splash
      commonViewModel.setGuidBanner(true);
      if (commonViewModel.isGuideBanner && ObjectUtil.isNotEmpty(guideList)) {
        // commonViewModel.setGuidBanner(false);
        print("加载引导动画 ${commonViewModel.isGuideBanner}");
        guideList.forEach((image) {
          precacheImage(
              ImageHelper.getAssetImage(image, format: ImageFormat.webp),
              context);
        });
        _initSplash();
      } else {
        print("加载splash");
      }
    });
  }

  void destroyed() {
    _subscription?.cancel();
  }

  void _initSplash() {
    status = 1;
    notifyListeners();
    // Stream.value(1).delay(Duration(seconds: 2)).listen((_) {
    //   _top = 150;
    //   notifyListeners();
    // });
  }

  /// 加载正式的页面
  // void _initMain() {}

  void splashGuideDone() {
    print("1-2");
  }
}
