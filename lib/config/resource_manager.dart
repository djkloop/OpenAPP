/*
 * @Author       : djkloop
 * @Date         : 2020-06-22 00:33:55
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-22 23:21:11
 * @Description  : 头部注释
 * @FilePath     : /open_app/lib/config/resource_manager.dart
 */

class ImageHelper {
  static String wrapAssets(String url, {String format: 'png'}) {
    return "assets/images/$url.$format";
  }
}
