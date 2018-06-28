import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:mldemos/keys.dart';
import 'package:mldemos/localizations.dart';
import 'package:mldemos/containers/active_activity.dart';
import 'package:mldemos/models/models.dart';

class HomeScreen extends StatefulWidget {

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
  State<HomeScreen> createState() => HomeScreenState();

}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 5), vsync: this)..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locales = MLDemosLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
    final baseButtons = demos.values.map((demo) => demo.button).toList();
    final buttonIdxs = List.generate(baseButtons.length, (b) => b);

    return ActiveActivity(
      builder: (BuildContext context, String activeRoute) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      Colors.indigo[800],
                      Colors.indigo[700],
                      Colors.indigo[600],
                      Colors.indigo[400],
                    ],
                  ),
                ),
              ),
              StaggeredGridView.count(
                padding: EdgeInsets.only(top: 60.0),
                primary: false,
                crossAxisCount: 3,
                children: buttonIdxs.map((b) => [
                  [ baseButtons[b]..withDelay((b / buttonIdxs.length) + 0.2) ],
                  b % 2 == 0 ? [ Container(), Container() ] : null,
                ].where((b) => b != null)).expand((b) => b.expand((s) => s)).toList(),
                staggeredTiles: buttonIdxs.map((b) {
                  const spacers = [
                    const StaggeredTile.count(1, 2),
                    const StaggeredTile.count(2, 2)
                  ];
                  return b % 2 == 0 ? spacers.reversed : spacers;
                }).expand((s) => s).toList(),
              ),
              AppBar(
                backgroundColor: Colors.transparent,
                iconTheme: theme.iconTheme,
                elevation: 0.0,
                centerTitle: true,
                title: Text(
                  widget.title ?? locales.appTitle,
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
                    itemBuilder: (BuildContext context) => widget.overflow.map(
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
            ]
          ),
        );
      }
    );
  }

}
