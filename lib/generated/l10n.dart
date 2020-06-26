// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `OpenApp`
  String get app_name {
    return Intl.message(
      'OpenApp',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Auto System`
  String get autoBySystem {
    return Intl.message(
      'Auto System',
      name: 'autoBySystem',
      desc: '',
      args: [],
    );
  }

  /// `Read Font`
  String get fontYSHST {
    return Intl.message(
      'Read Font',
      name: 'fontYSHST',
      desc: '',
      args: [],
    );
  }

  /// `Loving Reading`
  String get splash_title {
    return Intl.message(
      'Loving Reading',
      name: 'splash_title',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip_text {
    return Intl.message(
      'Skip',
      name: 'skip_text',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done_text {
    return Intl.message(
      'Done',
      name: 'done_text',
      desc: '',
      args: [],
    );
  }

  /// `Skip Ad`
  String get splash_skip {
    return Intl.message(
      'Skip Ad',
      name: 'splash_skip',
      desc: '',
      args: [],
    );
  }

  /// `You Know Some Birds Are Not Meant To Be Caged, Their Feathers Are Just Too Bright.   --The Shawshank Redemption`
  String get guide_book_1 {
    return Intl.message(
      'You Know Some Birds Are Not Meant To Be Caged, Their Feathers Are Just Too Bright.   --The Shawshank Redemption',
      name: 'guide_book_1',
      desc: '',
      args: [],
    );
  }

  /// `You Got A Dream, You Gotta Protect It.   --The Pursuit of Happyness`
  String get guide_book_2 {
    return Intl.message(
      'You Got A Dream, You Gotta Protect It.   --The Pursuit of Happyness',
      name: 'guide_book_2',
      desc: '',
      args: [],
    );
  }

  /// `I Want To Put A Ding In The Universe.   --Steve Jobs`
  String get guide_book_3 {
    return Intl.message(
      'I Want To Put A Ding In The Universe.   --Steve Jobs',
      name: 'guide_book_3',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}