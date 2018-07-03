import 'package:flutter/material.dart';

import 'package:mldemos/localizations.dart';

class PredictButton extends StatefulWidget {

  @override
  State<PredictButton> createState() => _PredictButtonState();

}

class _PredictButtonState extends State<PredictButton> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> predictIconAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 2000), vsync: this)..repeat();
    predictIconAnimation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locales = MLDemosLocalizations.of(context);
    final theme = Theme.of(context);

    return Stack(
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            GestureDetector(
              onTap: () {  },
              child: Container(
                decoration: BoxDecoration(
                  
                ),
              ),
            )
            OutlineButton(
              onPressed: () {  },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)
              ),
              child: Row(
                children: <Widget>[
                  Text(locales.predict),
                  Container()
                  Text('8')
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

}
