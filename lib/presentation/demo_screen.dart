import 'package:flutter/material.dart';

import 'package:mldemos/themes.dart';
import 'package:mldemos/models/models.dart';

class DemoScreen extends StatelessWidget {

  final Demo parent;

  DemoScreen(this.parent);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    // Wrap Scaffold with Container to add a solid backdrop should its background be semi-transparent
    return Hero(
      tag: parent.mainTag,
      child: Container(
        color: Colors.white,
        child: Scaffold(
          backgroundColor: parent.color.withAlpha(200),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              parent.name.toUpperCase(),
              style: theme.textTheme.title.copyWith(color: ThemeUtils.rightColor(parent.color)),
            ),
            leading: BackButton(
              color: ThemeUtils.rightColor(parent.color),
            ),
          ),
          body: parent.builder(context),
        ),
      ),
    );
  }

}