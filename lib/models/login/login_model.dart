/*
 * @Author       : djkloop
 * @Date         : 2020-06-20 11:53:15
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-20 11:57:28
 * @Description  : model
 * @FilePath     : /open_app/lib/models/login/login_model.dart
 */

class LoginModel {
  /// 登录
  Stream<int> login(dynamic data) => Stream.fromFuture(
        Future.delayed(
          Duration(seconds: 2),
          () {
            if (data["username"] == "djkloop" && data["password"] == "123") {
              return 0;
            }
            return 1;
          },
        ),
      );
}
