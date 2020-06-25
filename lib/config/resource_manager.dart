/*
 * @Author       : djkloop
 * @Date         : 2020-06-22 00:33:55
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-25 16:50:00
 * @Description  : 头部注释
 * @FilePath     : /open_app/lib/config/resource_manager.dart
 */

import 'package:flutter/cupertino.dart';

class ImageHelper {
  static ImageProvider getAssetImage(String name,
      {ImageFormat format = ImageFormat.png}) {
    return AssetImage(wrapAssets(name, format: format));
  }

  static String getImgPath(String name,
      {ImageFormat format = ImageFormat.png}) {
    return 'assets/images/$name.${format.value}';
  }

  static String wrapAssets(String name, {ImageFormat format: ImageFormat.png}) {
    return "assets/images/$name.${format.value}";
  }
}

enum ImageFormat { png, jpg, gif, webp }

extension ImageFormatExtension on ImageFormat {
  String get value => ['png', 'jpg', 'gif', 'webp'][this.index];
}
