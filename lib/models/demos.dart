import 'package:flutter/material.dart';

final Map<String, Demo> demos = {
  'digits': DigitsDemo(),
  'rnn': RNNDemo(),
  'img': IMGDemo(),
};

class Demo {

  Function load;
  Image img;
  String name;
  String desc;
  Widget button;
  Widget screen;

  Demo({
    this.load,
    this.img,
    this.name,
    this.desc,
    this.button,
    this.screen,
  });

}

class DigitsDemo extends Demo {

}

class RNNDemo extends Demo {

}

class IMGDemo extends Demo {

}
