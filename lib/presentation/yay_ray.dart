import 'package:flutter/material.dart';

/// Animates a slim rectangle out radially from a center.
/// Can be delayed through [start] and [end] for a staggered effect.
/// [start] will default to 0.0 regardless of [end].
/// [end] will default to 1.0 regardless of [start]. 
class YayRay extends StatelessWidget {

  final double start;
  final double end;
  final double left;
  final double top;
  final double rotation;

  final Animation<double> delayed;

  double get heightFactor => delayed.value > 0.5 ? 1.0 - delayed.value : delayed.value;

  YayRay({ @required Animation<double> controller, this.start = 0.0, this.end = 1.0, this.left, this.top, this.rotation })
  : delayed = Tween<double>(begin: 0.0, end: 1.0)
    .animate(CurvedAnimation(
      parent: controller,
      curve: Interval(start, end, curve: Curves.easeInOut)
    ));

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        color: Colors.yellow[300],
        width: 4.0,
        height: 48.0 * heightFactor,
        transform: Matrix4.rotationZ(rotation)..translate(0.0, delayed.value * 20.0, 0.0),
      ),
    );
  }

}
