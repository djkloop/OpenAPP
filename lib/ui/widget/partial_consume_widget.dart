/*
 * @Author       : djkloop
 * @Date         : 2020-06-26 13:44:04
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-26 13:44:46
 * @Description  : 头部注释
 * @FilePath     : /open_app/lib/ui/widget/partial_consume_widget.dart
 */

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PartialConsumeWidget<T extends ChangeNotifier> extends StatefulWidget {
  final T model;
  final Widget child;
  final ValueWidgetBuilder<T> builder;

  PartialConsumeWidget({
    Key key,
    @required this.model,
    @required this.builder,
    this.child,
  }) : super(key: key);

  @override
  _PartialConsumeWidgetState<T> createState() =>
      _PartialConsumeWidgetState<T>();
}

class _PartialConsumeWidgetState<T extends ChangeNotifier>
    extends State<PartialConsumeWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: widget.model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
