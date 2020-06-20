/*
 * @Author       : djkloop
 * @Date         : 2020-06-20 11:50:48
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-20 14:07:55
 * @Description  : 登录页
 * @FilePath     : /open_app/lib/views/login/view_login.dart
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_vant_kit/main.dart';

/// model
import 'package:open_app/view_model/login/login_view_model.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginViewModel>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CellGroup(
            children: <Widget>[
              Field(
                label: "用户名",
                controller: provider.usernameController,
                placeholder: "请输入用户名",
              ),
              Field(
                label: "密码",
                placeholder: "请输入密码",
                error: provider.showRequiredPasswordError,
                errorMessage:
                    provider.showRequiredPasswordError ? "密码不能为空" : "",
                controller: provider.passwordController,
                require: true,
                onChange: provider.passwordTextFieldValue,
                type: "password",
              ),
              NButton(
                text: provider.state == 0
                    ? "登录"
                    : provider.state == 1
                        ? "登录中..."
                        : provider.state == 2 ? "登录成功" : "登录",
                type: "info",
                plain: true,
                loading: provider.state == 1,
                disabled: provider.state == 1,
                onClick: provider.login,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
