/*
 * @Author       : djkloop
 * @Date         : 2020-06-26 13:25:27
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-26 13:52:42
 * @Description  : 头部注释
 * @FilePath     : /open_app/lib/view_model/open_app_model/count_down_view_model.dart
 */

import 'dart:async';

import 'package:flutter/cupertino.dart';

class CountDownViewModel extends ChangeNotifier {
  final int timeMax;
  final int interval;
  bool isStart = false;

  int _time;
  Timer _timer;

  int get currentTime => _time;

  bool get isFinish => _time == timeMax;

  CountDownViewModel({
    this.timeMax,
    this.interval,
    this.isStart = false,
  }) {
    _time = timeMax;
    if (isStart) {
      this.startCountDown();
    }
  }

  void startCountDown() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }

    _timer = Timer.periodic(Duration(seconds: interval), (timer) {
      if (timer.tick == timeMax) {
        _time = timeMax;
        timer.cancel();
        _timer = null;
      } else {
        _time--;
      }
      notifyListeners();
    });
  }

  void cancel() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }
}
