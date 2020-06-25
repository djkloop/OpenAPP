/*
 * @Author       : djkloop
 * @Date         : 2020-06-20 11:52:54
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-25 15:28:48
 * @Description  : 头部注释
 * @FilePath     : /open_app/lib/view_model/login/login_view_model.dart
 */
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:oktoast/oktoast.dart';
import 'package:logger/logger.dart';

/// model
import 'package:open_app/models/login/login_model.dart';

/// logger
var logger = new Logger();

class LoginViewModel extends ChangeNotifier {
  final loginModel = LoginModel();
  int state = 0;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool showRequiredPasswordError = false;

  isEmptyName(String text) {
    if (text == null || text == "") {
      showRequiredPasswordError = true;
    } else {
      showRequiredPasswordError = false;
    }
  }

  passwordTextFieldValue(String text) {
    passwordController.text = text;
    isEmptyName(text);
    notifyListeners();
  }

  login() {
    final data = {
      "username": usernameController.text,
      "password": passwordController.text,
    };

    if (passwordController.text == null || passwordController.text == "") {
      isEmptyName(passwordController.text);
      showToast("密码不能为空啊！");
      notifyListeners();
      return;
    }

    if (state != 0) return;

    loginModel.login(data).doOnListen(() {
      state = 1;
      logger.i("login - request");
      notifyListeners();
    }).listen((v) {
      if (v != 0) {
        state = 3;
        notifyListeners();
        Future.delayed(
          Duration(seconds: 5),
          () {
            state = 0;
            notifyListeners();
          },
        );
      } else {
        state = 2;
        notifyListeners();
        Future.delayed(
          Duration(seconds: 1),
          () {
            state = 0;
            notifyListeners();
          },
        );
      }
    });
  }
}
