import 'dart:math';

import 'package:flutter/material.dart';

import 'package:mldemos/models/demos.dart';

class PulseTween extends Tween<double> {

  final double delay;

  PulseTween({ double begin, double end, this.delay }) : super(begin: begin, end: end);

  @override
  double lerp(double t) {
    return super.lerp((sin((t - delay) * 2 * pi) + 1) / 2);
  }

}

class DemoButton extends StatefulWidget {

  final Demo parent;
  double animDelay;

  DemoButton(this.parent, { this.animDelay = 0.0 });
  
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
    _controller = AnimationController(duration: Duration(milliseconds: 1900), vsync: this)..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      child: Stack(
        children: <Widget>[
          ScaleTransition(
            scale: PulseTween(begin: 0.93, end: 0.98, delay: widget.animDelay).animate(_controller),
            child: Container(
              margin: EdgeInsets.all(6.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (widget.parent.color ?? theme.primaryColor).withOpacity(0.6),
              ),
            ),
          ),
          ScaleTransition(
            scale: PulseTween(begin: 1.0, end: 0.96, delay: widget.animDelay * 1.2).animate(_controller),
            child: Container(
              margin: EdgeInsets.all(42.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (widget.parent.color ?? theme.primaryColor).withOpacity(0.6),
                border: Border.all(
                  width: 2.0,
                  color: widget.parent.color ?? theme.primaryColor
                ),
              ),
            ),
          ),
          ScaleTransition(
            scale: PulseTween(begin: 0.98, end: 1.02, delay: widget.animDelay * 1.4).animate(_controller),
            child: Hero(
              tag: widget.parent.mainTag,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(widget.parent.route),
                child: Container(
                  margin: EdgeInsets.all(28.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (widget.parent.color ?? theme.primaryColor).withOpacity(0.6),
                  ),
                  child: Text(
                    widget.parent.name.toUpperCase(),
                    style: theme.accentTextTheme.title.copyWith(
                      fontFamily: 'PT Mono',
                      color: Color(0xFF203A43),
                      letterSpacing: 1.6,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}