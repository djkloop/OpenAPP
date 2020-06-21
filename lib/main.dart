/*
 * @Author       : djkloop
 * @Date 
import 'package:oktoast/oktoast.dart';        : 2020-06-20 11:37:40
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-22 00:45:12
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

/// l10n
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:open_app/generated/l10n.dart';

/// router_helper
import 'open_app_route_helper.dart';

/// pages
import 'ui/pages/no_route/no_route_page.dart';
import 'ui/pages/splash/splash_page.dart';

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
            locale: localeModel.locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            onGenerateRoute: (RouteSettings settings) => onGenerateRouteHelper(
                settings,
                notFoundFallback: NoRoutePage()),
            home: SplashPage(),
            navigatorObservers: [FFNavigatorObserver()],
            supportedLocales: S.delegate.supportedLocales,
          );
        }),
      ),
    );
  }
}
