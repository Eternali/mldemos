import 'dart:math';

import 'package:flutter/material.dart';

class PulseTween extends Tween<double> {

  final double delay;

  PulseTween({ double begin, double end, this.delay }) : super(begin: begin, end: end);

  @override
  double lerp(double t) {
    return super.lerp((sin((t - delay) * 2 * pi) + 1) / 2);
  }

}

class DemoButton extends StatefulWidget {

  final String title;
  final Color color;
  final Image img;
  final String route;
  double animDelay;

  DemoButton({ this.title, this.color, this.img, this.route, this.animDelay = 0.0 });
  
  void withDelay(double delay) {
    this.animDelay = delay;
  }

  @override
  State<DemoButton> createState() => DemoButtonState();

}

class DemoButtonState extends State<DemoButton> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 1800), vsync: this)..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Stack(
      children: <Widget>[
        ScaleTransition(
          scale: PulseTween(begin: 0.90, end: 0.96, delay: widget.animDelay + 0.12).animate(_controller),
          child: Container(
            margin: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (widget.color ?? theme.primaryColor).withOpacity(0.6),
            ),
          ),
        ),
        ScaleTransition(
          scale: PulseTween(begin: 0.97, end: 1.0, delay: widget.animDelay).animate(_controller),
          child: Container(
            margin: EdgeInsets.all(32.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (widget.color ?? theme.primaryColor).withOpacity(0.6),
              border: Border.all(
                width: 2.0,
                color: widget.color ?? theme.primaryColor
              ),
            ),
          ),
        ),
        ScaleTransition(
          scale: PulseTween(begin: 0.97, end: 1.02, delay: widget.animDelay + 0.06).animate(_controller),
          child: Container(
            margin: EdgeInsets.all(20.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (widget.color ?? theme.primaryColor).withOpacity(0.6),
            ),
            child: Text(
              widget.title
            ),
          ),
        ),
      ],
    );
  }

}