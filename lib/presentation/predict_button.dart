import 'dart:async';

import 'package:flutter/material.dart';

import 'package:mldemos/themes.dart';
import 'package:mldemos/localizations.dart';
import 'package:mldemos/containers/themed_widget.dart';
import 'package:mldemos/presentation/dense_expansion.dart';

typedef FutureCallback = Future Function();

class PredictButton extends StatefulWidget {

  final Color color;
  final FutureCallback onPressed;

  PredictButton({ this.color, this.onPressed });

  @override
  State<PredictButton> createState() => _PredictButtonState();

}

class _PredictButtonState extends State<PredictButton> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> baseAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    baseAnimation = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn)
      ..addListener(() {
        setState(() {  });
      });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locales = MLDemosLocalizations.of(context);
    final theme = Theme.of(context);

    return ThemedWidget(
      builder: (BuildContext context, MLTheme mltheme) => Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 4,
            child: Stack(
              children: <Widget>[
                Opacity(
                  opacity: baseAnimation.value,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 40.0 * baseAnimation.value,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(mltheme.borderRadius)),
                    ),
                    child: DenseExpansion(
                      title: Text(
                        locales.getItWrong,
                      ),
                      children: <Widget>[
                        Text(
                          locales.tellRightAnswer
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 1.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                            top: 2.0,
                            right: 0.0,
                            bottom: 2.0,
                            left: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(mltheme.borderRadius),
                              bottomLeft: Radius.circular(mltheme.borderRadius)
                            ),
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: theme.textTheme.title.copyWith(
                              color: Colors.black,
                              fontSize: 16.0
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 12,
                        child: GestureDetector(
                          onTap: widget.onPressed,
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                              top: 10.0,
                              right: 17.0,
                              bottom: 10.0,
                              left: 17.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(mltheme.borderRadius),
                                bottomRight: Radius.circular(mltheme.borderRadius)
                              ),
                            ),
                            child: Text(
                              locales.send.toUpperCase(),
                              style: theme.textTheme.title.copyWith(
                                color: Colors.black,
                                fontSize: 16.0
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 12,
                      child: GestureDetector(
                        onTap: () {
                          widget.onPressed()
                            .then((_) {
                              if (_controller.status != AnimationStatus.completed)
                                _controller.forward();
                            });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                              top: 10.0,
                              right: 17.0,
                              bottom: 10.0,
                              left: 17.0,
                            ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(mltheme.borderRadius),
                              bottomLeft: Radius.circular(mltheme.borderRadius)
                            ),
                          ),
                          child: Text(
                            locales.predict.toUpperCase(),
                            style: theme.textTheme.title.copyWith(
                              color: Colors.black,
                              fontSize: 16.0
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          top: 10.0,
                          right: 12.0,
                          bottom: 10.0,
                          left: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(mltheme.borderRadius),
                            bottomRight: Radius.circular(mltheme.borderRadius)
                          ),
                        ),
                        child: Text(
                          '8',
                          style: theme.textTheme.title.copyWith(
                            color: Colors.black,
                            fontSize: 16.0
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }

}
