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
    _controller = AnimationController(duration: Duration(seconds: 5), vsync: this);
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
                    stops: [0.1, 0.9],
                    colors: [
                      Color(0xFF1D2671),
                      Color(0xFFC33764),
                    ],
                  ),
                ),
                child: StaggeredGridView.count(
                  padding: EdgeInsets.only(top: 64.0),
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
              ),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(IconData(0)),
                    Expanded(
                      child: Text(
                        widget.title ?? locales.appTitle,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.title.copyWith(color: Colors.white)
                      ),
                    ),
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
              ),
              // AppBar(
              //   backgroundColor: Colors.transparent,
              //   iconTheme: theme.iconTheme.copyWith(color: Colors.white),
              //   elevation: 0.0,
              //   centerTitle: true,
              //   title: Text(
              //     widget.title ?? locales.appTitle,
              //     style: TextStyle(
              //       color: Colors.white,
              //     ),
              //   ),
              //   actions: <Widget>[
              //     PopupMenuButton<MenuChoice>(
              //       icon: Icon(Icons.scatter_plot),
              //       onSelected: (MenuChoice choice) {
              //         Navigator.of(context).pushNamed(choice.route);
              //       },
              //       itemBuilder: (BuildContext context) => widget.overflow.map(
              //         (MenuChoice choice) => PopupMenuItem<MenuChoice>(
              //           value: choice,
              //           child: Row(
              //             children: <Widget>[
              //               Icon(choice.icon),
              //               Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0)),
              //               Text(choice.title),
              //             ],
              //           ),
              //         )
              //       ).toList(),
              //     ),
              //   ],
              // ),
            ]
          ),
        );
      }
    );
  }

}
