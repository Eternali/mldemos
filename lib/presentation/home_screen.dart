import 'package:flutter/material.dart';

import 'package:mldemos/keys.dart';
import 'package:mldemos/containers/active_activity.dart';
import 'package:mldemos/models/models.dart';

class HomeScreen extends StatelessWidget {

  final String title;

  HomeScreen({ this.title }) : super(key: MLDemosKeys.homeScreen);

  @override
  Widget build(BuildContext context) {
    return ActiveActivity(
      builder: (BuildContext context, AppActivity activeActivity) {
        return Scaffold(
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
