import 'dart:async';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:mldemos/localizations.dart';
import 'package:mldemos/models/models.dart';
import 'package:mldemos/presentation/demo_button.dart';
import 'package:mldemos/presentation/painter.dart';
import 'package:mldemos/presentation/predict_button.dart';

final Map<String, Demo> demos = {
  'digits': Demo(
    name: 'digits',
    route: '/digits_demo',
    color: Colors.amber,
    desc: 'Desc',
    instructions: Text('instr'),
    builder: (Demo self) => (BuildContext context) {
      final locales = MLDemosLocalizations.of(context);
      return Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0)
            ),
            child: Painter(),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: PredictButton(
              color: self.color,
              possibleAnswers: '0123456789'.split(''),
              predict: () { return Future.delayed(Duration(milliseconds: 500), () => Future.value(2)); },
              send: () { return Future.value(2.0); },
            ),
          ),
        ],
      );
    }
  ),
  'rnn': Demo(
    name: 'rnn',
    route: '/rnn_demo',
    color: Colors.blueAccent,
  ),
  'img': Demo(
    name: 'img',
    route: '/img_demo',
    color: Colors.greenAccent,
  ),
};

typedef void Loader(Store<AppState> store);
typedef WidgetBuilder ScreenBuilder(Demo self);

class Demo {

  final String name;
  final String route;
  final Color color;
  final Image img;
  final String desc;
  final Widget instructions;
  Loader load;
  DemoButton button;
  WidgetBuilder builder;

  String get mainTag => route + name;

  Demo({
    this.name,
    this.route,
    this.color,
    this.img,
    this.desc,
    this.instructions,
    this.load,
    this.button,
    ScreenBuilder builder,
  }) {
    button ??= DemoButton(this);
    this.builder = builder == null ? (context) => Container() : builder(this);
  }

}
