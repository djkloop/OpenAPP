/*
 * @Author       : djkloop
 * @Date         : 2020-06-21 01:45:28
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-23 00:28:30
 * @Description  : 头部注释
 * @FilePath     : /open_app/lib/view_model/open_app_model/local_view_model.dart
 */

import 'package:flutter/cupertino.dart';
import 'package:open_app/config/storage_manager.dart';
import 'package:open_app/generated/l10n.dart';

class LocaleModel extends ChangeNotifier {
  ///
  static const localeValueList = ['', 'zh-CN', 'en'];

  ///
  static const kLocaleIndex = 'KLocaleIndex';

  int _localeIndex = 1;

  int get localIndex => _localeIndex;

  Locale get locale {
    if (_localeIndex > 0) {
      var value = localeValueList[_localeIndex].split("-");
      return Locale(value[0], value.length == 2 ? value[1] : '');
    }

    /// system
    return null;
  }

  LocaleModel() {
    /// 默认是中文
    _localeIndex = StorageManager.sharedPreferences.getInt(kLocaleIndex) ?? 1;
  }

  switchLocale(int index) {
    _localeIndex = index;
    notifyListeners();
    StorageManager.sharedPreferences.setInt(kLocaleIndex, index);
  }

  static String localeName(index, context) {
    switch (index) {
      case 0:
        return S.of(context).autoBySystem;
      case 1:
        return '中文';
      case 2:
        return 'English';
      default:
        return '';
    }
  }
}
