/*
 * @Author       : djkloop
 * @Date         : 2020-06-22 00:11:08
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-25 18:50:20
 * @Description  : 头部注释
 * @FilePath     : /open_app/lib/ui/pages/splash/splash_page.dart
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// local data
import 'package:open_app/config/resource_manager.dart';

/// l10n
import 'package:open_app/generated/l10n.dart';
import 'package:open_app/ui/pages/splash/splash_guide.dart';
import 'package:open_app/view_model/splash/splash_view_model.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashViewModel provider = SplashViewModel();

  @override
  void initState() {
    super.initState();
    provider.created(context);
  }

  @override
  void dispose() {
    provider.destroyed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Gradient gradient = LinearGradient(
      colors: [
        Color.fromRGBO(59, 120, 172, 1),
        Color.fromRGBO(108, 175, 172, 1),
      ],
    );
    Shader shader =
        gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    return ChangeNotifierProvider<SplashViewModel>(
      create: (_) => provider,
      child: Consumer<SplashViewModel>(builder: (_, provider, __) {
        return CupertinoPageScaffold(
            child: provider.status == 0
                ? Stack(
                    children: <Widget>[
                      Positioned(
                        /// test provider data && update provider data
                        top: provider.top,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Text(
                            S.of(context).splash_title,
                            style: TextStyle(
                              fontSize: 30,
                              decoration: TextDecoration.none,
                              foreground: Paint()..shader = shader,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          ImageHelper.wrapAssets("splash_logo",
                              format: ImageFormat.webp),
                          width: 128,
                          height: 128,
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  )
                : SplashGuideWidget(
                    provider: provider,
                  ));
      }),
    );
  }
}
