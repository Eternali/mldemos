import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:mldemos/models/models.dart';
import 'package:mldemos/presentation/demo_button.dart';
import 'package:mldemos/presentation/painter.dart';

final Map<String, Demo> demos = {
  'digits': Demo(
    name: 'digits',
    route: '/digits_demo',
    color: Colors.amber,
    screen: Column(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0)
          ),
          child: Painter(),
        ),
      ],
    ),
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

class Demo {

  String name;
  String route;
  Color color;
  Image img;
  String desc;
  Loader load;
  DemoButton button;
  Widget screen;

  String get mainTag => route + name;

  Demo({
    this.name,
    this.route,
    this.color,
    this.img,
    this.desc,
    this.load,
    this.button,
    this.screen,
  }) {
    button ??= DemoButton(this);
    screen ??= Container();
  }

}
