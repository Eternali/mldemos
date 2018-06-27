import 'package:flutter/material.dart';

import 'package:mldemos/keys.dart';
import 'package:mldemos/localizations.dart';
import 'package:mldemos/containers/active_activity.dart';
import 'package:mldemos/models/models.dart';

class HomeScreen extends StatelessWidget {

  final String title;

  HomeScreen({ this.title }) : super(key: MLDemosKeys.homeScreen);

  @override
  Widget build(BuildContext context) {
    final locales = MLDemosLocalizations.of(context);
    return ActiveActivity(
      builder: (BuildContext context, MLDemosRoute activeRoute) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: new Text(title ?? locales.appTitle),
            actions: <Widget>[
              PopupMenuButton<MenuChoice>(
                onSelected: (MenuChoice choice) {
                  Navigator.of(context).pushNamed(choice.route.loc);
                },
                itemBuilder: (BuildContext context) {
                  
                },
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(title)
            ],
          ),
        );
      }
    );
  }

}
