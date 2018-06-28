import 'package:flutter/material.dart';

import 'package:mldemos/keys.dart';
import 'package:mldemos/localizations.dart';
import 'package:mldemos/containers/active_activity.dart';
import 'package:mldemos/models/models.dart';

class HomeScreen extends StatelessWidget {

  final String title;
  final List<MenuChoice> overflow = [
    MenuChoice(
      route: '/settings',
      icon: Icons.settings,
      title: 'Settings',
    ),
    MenuChoice(
      route: '/about',
      icon: Icons.info,
      title: 'About',
    ),
  ];

  HomeScreen({ this.title }) : super(key: MLDemosKeys.homeScreen);

  @override
  Widget build(BuildContext context) {
    final locales = MLDemosLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
    final baseButtons = demos.values.map((demo) => demo.button).toList();

    return ActiveActivity(
      builder: (BuildContext context, String activeRoute) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: theme.iconTheme,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              title ?? locales.appTitle,
              style: TextStyle(
                color: theme.primaryColor,
              ),
            ),
            actions: <Widget>[
              PopupMenuButton<MenuChoice>(
                icon: Icon(Icons.scatter_plot),
                onSelected: (MenuChoice choice) {
                  Navigator.of(context).pushNamed(choice.route);
                },
                itemBuilder: (BuildContext context) => overflow.map(
                  (MenuChoice choice) => PopupMenuItem<MenuChoice>(
                    value: choice,
                    child: Row(
                      children: <Widget>[
                        Icon(choice.icon),
                        Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0)),
                        Text(choice.title),
                      ],
                    ),
                  )
                ).toList(),
              ),
            ],
          ),
          body: GridView.count(
            crossAxisCount: 2,
            children: baseButtons.map((btn) => btn..withDelay(baseButtons.indexOf(btn) / baseButtons.length)).toList(),
          ),
        );
      }
    );
  }

}
