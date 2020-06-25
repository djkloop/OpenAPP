/*
 * @Author       : djkloop
 * @Date         : 2020-06-25 18:43:04
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-25 18:58:51
 * @Description  : 头部注释
 * @FilePath     : /open_app/lib/ui/pages/splash/splash_guide.dart
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:open_app/config/resource_manager.dart';
import 'package:open_app/generated/l10n.dart';
import 'package:open_app/ui/helper/theme_helper.dart';
import 'package:open_app/ui/widget/load_image.dart';
import 'package:open_app/view_model/splash/splash_view_model.dart';

class SplashGuideWidget extends StatefulWidget {
  final SplashViewModel provider;

  const SplashGuideWidget({
    Key key,
    @required this.provider,
  })  : assert(provider != null),
        super(key: key);

  @override
  _SplashGuideWidgetState createState() => _SplashGuideWidgetState();
}

class _SplashGuideWidgetState extends State<SplashGuideWidget> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(String assetName) {
    return Align(
      child: LoadAssetImage(
        assetName,
        format: ImageFormat.webp,
        width: 256,
      ),
      alignment: Alignment.bottomCenter,
    );
  }

  Widget _buildBodyWidget(index) {
    List<String> i18nList = [
      S.of(context).guide_book_1,
      S.of(context).guide_book_2,
      S.of(context).guide_book_3,
    ];
    var texts = i18nList[index].split("--");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          texts[0].trim(),
          style: TextStyle(
            fontSize: 18,
            fontFamily: "yshst",
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '--' + texts[1].trim(),
          style: TextStyle(
            fontSize: 18,
            fontFamily: "yshst",
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      key: introKey,
      pages: widget.provider.guideList
          .asMap()
          .keys
          .map(
            (index) => PageViewModel(
              titleWidget: Text(""),
              bodyWidget: _buildBodyWidget(index),
              image: _buildImage(widget.provider.guideList[index]),
              decoration: pageDecoration,
            ),
          )
          .toList(),
      onDone: widget.provider.splashGuideDone,
      skipFlex: 1,
      nextFlex: 1,
      showSkipButton: true,
      skip: Text(
        S.of(context).skip_text,
        style: ThemeHelper.styleTextStyle,
      ),
      next: Icon(
        Icons.arrow_forward,
        color: ThemeHelper.stylePrimaryColor,
      ),
      done: Text(
        S.of(context).done_text,
        style: ThemeHelper.styleTextStyle,
      ),
      dotsDecorator: DotsDecorator(
        size: Size.square(10.0),
        activeSize: Size(20.0, 10.0),
        color: Color.fromRGBO(75, 168, 150, 0.5),
        activeColor: ThemeHelper.stylePrimaryColor,
        spacing: EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
