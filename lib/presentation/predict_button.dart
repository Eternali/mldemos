import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:mldemos/themes.dart';
import 'package:mldemos/localizations.dart';
import 'package:mldemos/containers/prediction_listener.dart';
import 'package:mldemos/containers/themed_widget.dart';
import 'package:mldemos/presentation/dense_expansion.dart';
import 'package:mldemos/presentation/yay_ray.dart';

typedef FutureCallback = Future Function();

class PredictButton extends StatefulWidget {

  final Color color;
  final List<String> possibleAnswers;
  final FutureCallback predict;
  final FutureCallback send;

  PredictButton({ this.color, this.possibleAnswers, this.predict, this.send });

  @override
  State<PredictButton> createState() => _PredictButtonState();

}

class _PredictButtonState extends State<PredictButton> with TickerProviderStateMixin {

  AnimationController _predictController;
  AnimationController _postController;
  AnimationController _sendRevealController;
  Animation<int> predictLoadingAnimation;
  Animation<double> yayAnimation;
  Animation<double> wrongRevealAnimation;
  Animation<double> sendRevealAnimation;

  @override
  void initState() {
    super.initState();
    _predictController = AnimationController(duration: Duration(milliseconds: widget.possibleAnswers.length * 300), vsync: this);
    _postController = AnimationController(duration: Duration(milliseconds: 3500), vsync: this);
    _sendRevealController = AnimationController(duration: Duration(milliseconds: 600), vsync: this);

    predictLoadingAnimation = Tween<int>(begin: 0, end: widget.possibleAnswers.length - 1)
      .animate(_predictController)
      ..addListener(() {
        setState(() {  });
      });
    yayAnimation = Tween<double>(begin: 0.0, end: 1.0)
      .animate(CurvedAnimation(
        parent: _postController,
        curve: Interval(0.0, 0.6, curve: Curves.easeInOut),
      ))
      ..addListener(() {
        setState(() {  });
      });
    wrongRevealAnimation = Tween<double>(begin: 0.0, end: 1.0)
      .animate(CurvedAnimation(
        parent: _postController,
        curve: Interval(0.85, 1.0, curve: Curves.fastOutSlowIn),
      ))
      ..addListener(() {
        setState(() {  });
      });
    sendRevealAnimation = CurvedAnimation(parent: _sendRevealController, curve: Curves.fastOutSlowIn)
      ..addListener(() {
        setState(() {  });
      });
  }

  @override
  void dispose() {
    _predictController?.dispose();
    _postController?.dispose();
    _sendRevealController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locales = MLDemosLocalizations.of(context);
    final theme = Theme.of(context);

    return ThemedWidget(
      builder: (BuildContext context, MLTheme mltheme) => PredictionListener(
        builder: (BuildContext context, PredictionListenerVM predVM) { debugPrint(predVM.correctionExpanded.toString()); return Row(
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
                    opacity: wrongRevealAnimation.value,
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 40.0 * wrongRevealAnimation.value,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(mltheme.borderRadius)),
                      ),
                      child: DenseExpansion(
                        isExpanded: predVM.correctionExpanded ?? false,
                        onExpansionChanged: (expanding) {
                          predVM.onCorrectionChange(expanding);
                          if (expanding) _sendRevealController.forward();
                          else _sendRevealController.reverse();
                        },
                        title: Text(
                          locales.getItWrong,
                        ),
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 56.0),
                            child: Text(
                              locales.tellRightAnswer
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: sendRevealAnimation.value,
                    child: Container(
                      margin: EdgeInsets.only(top: 130.0 * sendRevealAnimation.value),
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
                              onTap: widget.send,
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 12,
                        child: GestureDetector(
                          onTap: () {
                            if (_postController.status == AnimationStatus.completed) _postController.reverse();
                            if (_sendRevealController.status == AnimationStatus.completed) _sendRevealController.reverse();
                            _predictController.forward();
                            widget.predict()
                              .then((result) {
                                predVM.onCorrectionChange(false);
                                // _predictController.stop();
                                if (_postController.status != AnimationStatus.completed) {
                                  _postController.reset();
                                  _postController.forward();
                                }
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
                          child: AnimatedBuilder(
                            animation: _predictController,
                            builder: (BuildContext context, Widget child) => Text(
                              '0', // widget.possibleAnswers[predictLoadingAnimation.value ?? 0],
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
                  YayRay(
                    controller: yayAnimation,
                    start: 0.0,
                    end: 0.65,
                    left: 248.0,
                    top: 6.0,
                    rotation: pi,
                  ),
                  YayRay(
                    controller: yayAnimation,
                    start: 0.05,
                    end: 0.7,
                    left: 260.0,
                    top: 12.0,
                    rotation: pi * 1.25,
                  ),
                  YayRay(
                    controller: yayAnimation,
                    start: 0.1,
                    end: 0.75,
                    left: 262.0,
                    top: 24.0,
                    rotation: pi * 1.5,
                  ),
                  YayRay(
                    controller: yayAnimation,
                    start: 0.15,
                    end: 0.8,
                    left: 256.0,
                    top: 33.0,
                    rotation: pi * 1.75,
                  ),
                  YayRay(
                    controller: yayAnimation,
                    start: 0.2,
                    end: 0.85,
                    left: 244.0,
                    top: 34.0,
                    rotation: 0.0,
                  ),
                  YayRay(
                    controller: yayAnimation,
                    start: 0.25,
                    end: 0.9,
                    left: 233.0,
                    top: 30.0,
                    rotation: pi * 0.25,
                  ),
                  YayRay(
                    controller: yayAnimation,
                    start: 0.3,
                    end: 0.95,
                    left: 230.0,
                    top: 20.0,
                    rotation: pi * 0.5,
                  ),
                  YayRay(
                    controller: yayAnimation,
                    start: 0.35,
                    end: 1.0,
                    left: 236.0,
                    top: 9.0,
                    rotation: pi * 0.75,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ); },
      )
    );
  }

}
