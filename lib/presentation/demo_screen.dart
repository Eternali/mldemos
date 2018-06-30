import 'package:flutter/material.dart';

import 'package:mldemos/models/models.dart';

class DemoScreen extends StatelessWidget {

  final Demo parent;

  DemoScreen(this.parent);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Hero(
        tag: parent.mainTag,
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          color: Colors.greenAccent,
        ),
      ),
    );
  }

}