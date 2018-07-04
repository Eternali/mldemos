import 'package:flutter/material.dart';

import 'package:mldemos/localizations.dart';

class PredictButton extends StatefulWidget {

  final Color color;
  final VoidCallback onPressed;

  PredictButton({ this.color, this.onPressed });

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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Container(
                // padding: EdgeInsets.only(
                //   top: 8.0,
                //   right: 8.0,
                //   bottom: 8.0,
                //   left: 12.0,
                // ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.0),
                    bottomLeft: Radius.circular(18.0)
                  ),
                ),
                child: TextField(
                  maxLines: 1,
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.title.copyWith(
                    color: Colors.black,
                    fontSize: 16.0
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Flexible(
              child: GestureDetector(
                onTap: widget.onPressed,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 8.0,
                    right: 12.0,
                    bottom: 8.0,
                    left: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(18.0),
                      bottomRight: Radius.circular(18.0)
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
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     GestureDetector(
        //       onTap: widget.onPressed,
        //       child: Container(
        //         padding: EdgeInsets.only(
        //           top: 8.0,
        //           right: 8.0,
        //           bottom: 8.0,
        //           left: 12.0,
        //         ),
        //         decoration: BoxDecoration(
        //           color: Colors.transparent,
        //           border: Border.all(
        //             color: Colors.white,
        //             width: 2.0,
        //           ),
        //           borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(18.0),
        //             bottomLeft: Radius.circular(18.0)
        //           ),
        //         ),
        //         child: Text(
        //           locales.predict.toUpperCase(),
        //           style: theme.textTheme.title.copyWith(
        //             color: Colors.black,
        //             fontSize: 16.0
        //           ),
        //         ),
        //       ),
        //     ),
        //     Container(
        //       padding: EdgeInsets.only(
        //         top: 8.0,
        //         right: 12.0,
        //         bottom: 8.0,
        //         left: 8.0,
        //       ),
        //       decoration: BoxDecoration(
        //         color: Colors.white,
        //         border: Border.all(
        //           color: Colors.white,
        //           width: 2.0,
        //         ),
        //         borderRadius: BorderRadius.only(
        //           topRight: Radius.circular(18.0),
        //           bottomRight: Radius.circular(18.0)
        //         ),
        //       ),
        //       child: Text(
        //         '8',
        //         style: theme.textTheme.title.copyWith(
        //           color: Colors.black,
        //           fontSize: 16.0
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }

}
