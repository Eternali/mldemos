import 'package:flutter/material.dart';

class Routes {
  static const HOME = const MLDemosRoute('/');
  static const DIGITS_DEMO = const MLDemosRoute('/digits_demo', 'digits');
  static const RNN_DEMO = const MLDemosRoute('/rnn_demo', 'rnn');
  static const IMG_DEMO = const MLDemosRoute('/img_demo', 'img');
  static const SETTINGS = const MLDemosRoute('/settings');
  static const ABOUT = const MLDemosRoute('/about');
}

class MLDemosRoute {
  final String name;
  final String loc;
  const MLDemosRoute(@required this.loc, [ this.name ]);
}