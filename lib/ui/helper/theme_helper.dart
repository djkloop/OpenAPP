/*
 * @Author       : djkloop
 * @Date         : 2020-06-21 01:37:04
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-25 18:41:06
 * @Description  : 
 * @FilePath     : /open_app/lib/ui/helper/theme_helper.dart
 */
import 'package:flutter/material.dart';

class ThemeHelper {
  ///
  static Color stylePrimaryColor = Color.fromRGBO(75, 168, 150, 1);
  ///
  static TextStyle styleTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: ThemeHelper.stylePrimaryColor,
  );
  ///
  static InputDecorationTheme inputDecorationTheme(ThemeData theme) {
    var primaryColor = theme.primaryColor;
    var dividerColor = theme.dividerColor;
    var errorColor = theme.errorColor;
    var disabledColor = theme.disabledColor;

    var width = 0.5;

    return InputDecorationTheme(
      hintStyle: TextStyle(fontSize: 14),
      errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: width, color: errorColor)),
      focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 0.7, color: errorColor)),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: width, color: primaryColor)),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: width, color: dividerColor)),
      border: UnderlineInputBorder(
          borderSide: BorderSide(width: width, color: dividerColor)),
      disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: width, color: disabledColor)),
    );
  }
}
