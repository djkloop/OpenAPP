/*
 * @Author       : djkloop
 * @Date         : 2020-06-23 00:00:07
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-24 23:30:33
 * @Description  : 头部注释
 * @FilePath     : /open_app/lib/view_model/open_app_model/common_view_model.dart
 */

import 'package:flutter/cupertino.dart';
import 'package:open_app/config/storage_manager.dart';

class CommonViewModel extends ChangeNotifier {
  static const String kGuide = 'kGuide';

  /// 是否是出现引导页
  bool _isGuideBanner;

  CommonViewModel() {
    _isGuideBanner = StorageManager.sharedPreferences.getBool(kGuide) ?? true;
  }

  bool get isGuideBanner => _isGuideBanner;

  void setGuidBanner(bool isLoad) async {
    await StorageManager.sharedPreferences.setBool(kGuide, isLoad);
  }
}
