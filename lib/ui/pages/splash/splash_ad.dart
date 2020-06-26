/*
 * @Author       : djkloop
 * @Date         : 2020-06-25 20:25:37
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-26 18:07:52
 * @Description  : 广告
 * @FilePath     : /open_app/lib/ui/pages/splash/splash_ad.dart
 */

import 'package:flutter/cupertino.dart';
import 'package:open_app/config/resource_manager.dart';
import 'package:open_app/generated/l10n.dart';
import 'package:open_app/ui/helper/theme_helper.dart';
import 'package:open_app/view_model/splash/splash_view_model.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class SplashAdWidget extends StatefulWidget {
  final SplashViewModel provider;
  final bool isShowAd;

  const SplashAdWidget({
    Key key,
    @required this.provider,
    this.isShowAd = false,
  })  : assert(provider != null),
        super(key: key);
  @override
  _SplashAdWidgetState createState() => _SplashAdWidgetState();
}

class _SplashAdWidgetState extends State<SplashAdWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Gradient gradient = LinearGradient(
      colors: [
        Color.fromRGBO(59, 120, 172, 1),
        Color.fromRGBO(108, 175, 172, 1),
      ],
    );
    Shader shader = gradient.createShader(Rect.fromLTWH(
      0,
      0,
      size.width,
      size.height,
    ));
    return Stack(
      children: <Widget>[
        widget.isShowAd
            ? Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: FadeIn(
                  Image.asset(
                    ImageHelper.wrapAssets(
                      "splash_ad",
                      format: ImageFormat.webp,
                    ),
                    width: 256,
                    height: 256,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            : Positioned(
                top: 0,
                child: SizedBox.shrink(),
              ),
        Positioned(
          top: 60,
          right: 30,
          child: GestureDetector(
            onTap: () => widget.provider.splashGuideDone(context),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 4,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // 渐变颜色 leftGradientColor、rightGradientColor
                    CupertinoColors.activeBlue,
                    CupertinoColors.activeGreen,
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ThemeHelper.stylePrimaryColor.withOpacity(0.8),
                    offset: Offset(0, 8),
                    blurRadius: 8.0,
                    spreadRadius: -6.0,
                  ),
                ],
              ),
              child: Text(
                "${S.of(context).splash_skip}",
                style: TextStyle(
                  fontSize: 14,
                  decoration: TextDecoration.none,
                  letterSpacing: 2,
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          /// test provider data && update provider data
          bottom: widget.provider.top,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              S.of(context).splash_title,
              style: TextStyle(
                fontSize: 16,
                decoration: TextDecoration.none,
                foreground: Paint()..shader = shader,
                letterSpacing: 12,
                fontFamily: "yshst",
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
            ImageHelper.wrapAssets("splash_logo", format: ImageFormat.webp),
            width: 128,
            height: 128,
            fit: BoxFit.contain,
          ),
        )
      ],
    );
  }
}

enum _AniProps { opacity }

class FadeIn extends StatelessWidget {
  final Widget child;

  FadeIn(this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_AniProps>()
      ..add(_AniProps.opacity, 0.0.tweenTo(1.0));

    return PlayAnimation<MultiTweenValues<_AniProps>>(
      duration: 300.milliseconds,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(_AniProps.opacity),
        child: child,
      ),
    );
  }
}
