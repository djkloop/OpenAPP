/*
 * @Author       : djkloop
 * @Date         : 2020-06-22 00:11:08
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-26 16:50:52
 * @Description  : 头部注释
 * @FilePath     : /open_app/lib/ui/pages/splash/splash_page.dart
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
import 'package:open_app/ui/pages/splash/splash_ad.dart';
import 'package:open_app/ui/pages/splash/splash_guide.dart';

///
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
    return ChangeNotifierProvider<SplashViewModel>(
      create: (_) => provider,
      child: Consumer<SplashViewModel>(builder: (_, provider, __) {
        return CupertinoPageScaffold(
          child: (provider.status == 0 || provider.status == 2)
              ? SplashAdWidget(
                  provider: provider,
                  isShowAd: provider.status == 2,
                )
              : SplashGuideWidget(
                  provider: provider,
                ),
        );
      }),
    );
  }
}
