/*
 * @Author       : djkloop
 * @Date 
import 'package:oktoast/oktoast.dart';        : 2020-06-20 11:37:40
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-21 01:52:59
 * @Description  : OpenAPP
 * @FilePath     : /open_app/lib/main.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:oktoast/oktoast.dart';

import 'package:provider/provider.dart';

/// app providers
import 'package:open_app/config/provider_manager.dart';

/// config
import 'package:open_app/config/storage_manager.dart';

/// models
import 'package:open_app/view_model/open_app_model/local_view_model.dart';
import 'package:open_app/view_model/open_app_model/theme_view_model.dart';
import 'package:open_app/view_model/login/login_view_model.dart';
import 'package:open_app/views/login/view_login.dart';

var logger = new Logger();

main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();

  /// load app config
  await StorageManager.init();

  /// run app
  runApp(OpenAPP());

  /// set android status bar
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class OpenAPP extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MultiProvider(
        providers: providers,
        child: Consumer2<ThemeModel, LocaleModel>(
            builder: (context, themeModel, localeModel, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter MVVM Demo',
            home: ChangeNotifierProvider(
              create: (_) => LoginViewModel(),
              child: LoginView(),
            ),
          );
        }),
      ),
    );
  }
}
