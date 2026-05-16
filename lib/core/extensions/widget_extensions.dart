import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget paddingAll(double value) => Padding(padding: EdgeInsets.all(value), child: this);
  Widget paddingOnly({double left = 0, double top = 0, double right = 0, double bottom = 0}) =>
      Padding(padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom), child: this);
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical), child: this);

  Widget sliverPaddingAll(double value) => SliverPadding(padding: EdgeInsets.all(value), sliver: this);
  Widget sliverPaddingOnly({double left = 0, double top = 0, double right = 0, double bottom = 0}) =>
      SliverPadding(padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom), sliver: this);
  Widget sliverPaddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      SliverPadding(padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical), sliver: this);

  Widget expanded({int flex =1}) => Expanded(flex: flex, child: this);
  Widget get safeArea => SafeArea(child: this);
  Widget get center => Center(child: this);
  
  Widget sliverToBox() => SliverToBoxAdapter(child: this);
}

extension ContextExtension on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
  
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
}
