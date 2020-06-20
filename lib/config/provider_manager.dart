/*
 * @Author       : djkloop
 * @Date         : 2020-06-20 15:26:50
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-21 01:49:35
 * @Description  : 状态管理
 * @FilePath     : /open_app/lib/config/provider_manager.dart
 */

import 'package:open_app/view_model/open_app_model/local_view_model.dart';
import 'package:open_app/view_model/open_app_model/theme_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
];

/// 独立的model
List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<ThemeModel>(
    create: (context) => ThemeModel(),
  ),
  ChangeNotifierProvider<LocaleModel>(
    create: (context) => LocaleModel(),
  )
];
