/*
 * @Author       : djkloop
 * @Date         : 2020-06-20 12:47:24
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-20 14:39:58
 * @Description  : 头部注释
 * @FilePath     : /open_app/lib/utils/platform_utils.dart
 */

import 'dart:io';

import 'package:open_app/main.dart';
import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';

const isProduction = const bool.fromEnvironment("dart.vm.product");

class PlatformUtils {
  /// get app package info
  static Future<PackageInfo> getAppPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  /// get app version
  static Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  /// get app build number
  static Future<String> getAppBuildNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  /// get platform device info
  static Future getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      logger.i("android -> ${deviceInfo.iosInfo}");
      return await deviceInfo.androidInfo;
    } else if (Platform.isWindows) {
      logger.i("ios -> ${deviceInfo.iosInfo}");
      return await deviceInfo.iosInfo;
    } else {
      return null;
    }
  }
}
