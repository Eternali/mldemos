import 'dart:math';

import 'package:flutter/material.dart';

class Painter extends StatefulWidget {

  @override
  State<Painter> createState() => PainterState();

}

class PainterState extends State<Painter> {
  
  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            RenderBox object = context.findRenderObject();
            Offset _localPosition =
                object.globalToLocal(details.globalPosition);
            _points = List.from(_points)..add(_localPosition);
          });
        },
        onPanEnd: (DragEndDetails details) => _points.add(null),
        child: CustomPaint(
          painter: Painting(points: _points),
          size: Size.infinite,
        ),
      ),
    );
  }

}

class Painting extends CustomPainter {

  List<Offset> points;

  Painting({ this.points });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(Painting oldDelegate) => oldDelegate.points != points;

}
