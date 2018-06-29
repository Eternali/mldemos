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
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 20), vsync: this);
    animation = CurvedAnimation(parent: _controller, curve: Curves.ease)
      ..addListener(() {
        setState(() {  });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) _controller.reverse();
        else if (status == AnimationStatus.dismissed) _controller.forward();
      });
    _controller.forward();
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
    final screenSize = MediaQuery.of(context).size;

    return ActiveActivity(
      builder: (BuildContext context, String activeRoute) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              Positioned(
                left: 0.0,
                top: -screenSize.height + (animation.value * screenSize.height),
                width: screenSize.width,
                height: screenSize.height * 2,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.2, 0.5, 0.8],
                      colors: [
                        Color(0xFF2C5364),
                        Color(0xFF203A43),
                        Color(0xFF0F2027),
                      ],
                    ),
                  ),
                ),
              ),
              StaggeredGridView.count(
                padding: EdgeInsets.only(top: 68.0),
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
              SafeArea(
                child: Stack(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 13.0),
                          child: Text(
                            (widget.title ?? locales.appTitle).toUpperCase(),
                            textAlign: TextAlign.center,
                            style: theme.textTheme.title.copyWith(
                              color: Colors.white70,
                              letterSpacing: 2.0
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        PopupMenuButton<MenuChoice>(
                          icon: Icon(Icons.scatter_plot, color: Colors.white70),
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
                  ],
                ),
              ),
            ]
          ),
        );
      }
    );
  }

}
