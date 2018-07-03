import 'package:flutter/material.dart';

import 'package:mldemos/localizations.dart';
import 'package:mldemos/themes.dart';
import 'package:mldemos/models/models.dart';

class DemoScreen extends StatelessWidget {

  final Demo parent;

  DemoScreen(this.parent);

  @override
  Widget build(BuildContext context) {
    final locales = MLDemosLocalizations.of(context);
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
          body: Column(
            children: <Widget>[
              parent.desc != null ? Container(
                margin: EdgeInsets.only(top: 4.0),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(
                    locales.description
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        parent.desc
                      ),
                    ),
                  ],
                ),
              ) : null,
              parent.instructions != null ? Container(
                margin: EdgeInsets.only(bottom: 8.0),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(
                    locales.instructions
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: parent.instructions
                    ),
                  ],
                ),
              ) : null,
              parent.builder(context),
            ].where((w) => w != null).toList(),
          ),
        ),
      ),
    );
  }

}