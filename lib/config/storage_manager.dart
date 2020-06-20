/*
 * @Author       : djkloop
 * @Date         : 2020-06-20 13:56:04
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-20 14:35:36
 * @Description  : 头部注释
 * @FilePath     : /open_app/lib/config/storage_manager.dart
 */
import 'dart:io';

import 'package:open_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';

class StorageManager {
  /// app全局配置 eg: theme
  static SharedPreferences sharedPreferences;

  /// 临时目录 eg: cookie
  static Directory temporaryDirectory;

  /// 初始化必备操作 eg: user数据
  static LocalStorage localStorage;

  /// 必备数据的初始化操作
  ///
  /// 由于是同步操作会导致阻塞， 所以尽量减少存储内容
  static init() async {
    temporaryDirectory = await getTemporaryDirectory();
    logger.d("temporaryDirectory -> ${temporaryDirectory.toString()}");
    sharedPreferences = await SharedPreferences.getInstance();
    localStorage = LocalStorage('LocalStorage');
    await localStorage.ready;
  }
}
