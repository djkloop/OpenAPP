/*
 * @Author       : djkloop
 * @Date         : 2020-06-20 15:32:22
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-23 00:39:39
 * @Description  : 头部注释
 * @FilePath     : /open_app/lib/view_model/open_app_model/theme_view_model.dart
 */
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_app/config/storage_manager.dart';
import 'package:open_app/generated/l10n.dart';
import 'package:open_app/ui/helper/theme_helper.dart';

class ThemeModel with ChangeNotifier {
  static const kThemeColorIndex = 'kThemeColorIndex';
  static const kThemeUserDarkMode = 'kThemeUserDarkMode';
  static const kFontIndex = 'kFontIndex';

  static const fontValueList = ['system', 'yshst'];

  /// user is dark mode
  bool _userDarkMode;

  /// user choose theme color
  MaterialColor _themeColor;

  /// 当前字体索引
  int _fontIndex;

  ThemeModel() {
    /// 用户选择的是否是暗色模式
    _userDarkMode =
        StorageManager.sharedPreferences.getBool(kThemeUserDarkMode) ?? false;

    /// 获取主题色
    _themeColor = Colors.primaries[
        StorageManager.sharedPreferences.getInt(kThemeColorIndex) ?? 5];

    /// 获取字体
    _fontIndex = StorageManager.sharedPreferences.getInt(kFontIndex) ?? 0;
  }

  int get fontIndex => _fontIndex;

  /// 切换主题颜色
  /// 没有传[brightness]就不改变brightness, color一样
  void switchTheme({bool userDarkMode, MaterialColor color}) {
    _userDarkMode = userDarkMode ?? _userDarkMode;
    _themeColor = color ?? _themeColor;
    notifyListeners();
    saveThemeToStorage(_userDarkMode, _themeColor);
  }

  /// 随机一个主题色彩
  void switchRandomTheme({Brightness brightness}) {
    int colorIndex = Random().nextInt(Colors.primaries.length - 1);
    switchTheme(
      userDarkMode: Random().nextBool(),
      color: Colors.primaries[colorIndex],
    );
  }

  /// 数据持久化 模式/颜色
  saveThemeToStorage(bool userDarkMode, MaterialColor themeColor) async {
    var index = Colors.primaries.indexOf(themeColor);
    await Future.wait([
      StorageManager.sharedPreferences
          .setBool(kThemeUserDarkMode, userDarkMode),
      StorageManager.sharedPreferences.setInt(kThemeColorIndex, index),
    ]);
  }

  /// 数据持久化 字体
  saveFontToStorage(int index) async {
    await StorageManager.sharedPreferences.setInt(kFontIndex, index);
  }

  /// 切换字体
  switchFont(int index) {
    _fontIndex = index;
    switchTheme();
    saveFontToStorage(index);
  }

  /// 根据索引获取字体名字
  static String fontName(index, context) {
    switch (index) {
      case 0:
        return S.of(context).autoBySystem;
        break;
      case 1:
        return S.of(context).fontYSHST;
        break;
      default:
        return '';
    }
  }

  /// 根据主题 明暗 和 颜色生成 对应的主题
  /// [dark]系统的Dark Mode
  ThemeData themeData({bool platformDarkMode: false}) {
    var isDark = platformDarkMode || _userDarkMode;
    Brightness brightness = isDark ? Brightness.dark : Brightness.light;

    var themeColor = _themeColor;
    var accentColor = isDark ? themeColor[700] : _themeColor;
    var themeData = ThemeData(
      brightness: brightness,
      primaryColorBrightness: Brightness.dark,
      accentColorBrightness: Brightness.dark,
      primarySwatch: themeColor,
      accentColor: accentColor,
      fontFamily: fontValueList[fontIndex],
    );

    themeData = themeData.copyWith(
      brightness: brightness,
      accentColor: accentColor,
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: themeColor,
        brightness: brightness,
      ),

      /// app bar 阴影
      appBarTheme: themeData.appBarTheme.copyWith(
        elevation: 0,
      ),

      /// 水波纹
      splashColor: Colors.transparent,

      /// [hintColor] 用于提示文本或占位符文本的颜色
      hintColor: themeData.hintColor.withAlpha(90),

      /// [errorColor] 用于输入验证错误的颜色
      errorColor: Colors.red,

      /// [cursorColor] 在 Material-style 文本字段(如TextField)中光标的颜色
      cursorColor: accentColor,

      ///
      textTheme: themeData.textTheme.copyWith(
        subtitle1: themeData.textTheme.subtitle1.copyWith(
          textBaseline: TextBaseline.alphabetic,
        ),
      ),

      /// [textSelectionColor] 文本字段(如TextField)中文本被选中的颜色
      textSelectionColor: accentColor.withAlpha(50),

      /// [textSelectionHandleColor] 用于调整当前选定文本部分的句柄的颜色。
      textSelectionHandleColor: accentColor.withAlpha(50),

      /// [toggleableActiveColor] 用于突出显示切换Widget（如Switch，Radio和Checkbox）的活动状态的颜色。
      toggleableActiveColor: accentColor,

      ///
      chipTheme: themeData.chipTheme.copyWith(
        pressElevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 10),
        labelStyle: themeData.textTheme.caption,
        backgroundColor: themeData.chipTheme.backgroundColor.withOpacity(0.1),
      ),
      inputDecorationTheme: ThemeHelper.inputDecorationTheme(themeData),
    );
    return themeData;
  }
}
