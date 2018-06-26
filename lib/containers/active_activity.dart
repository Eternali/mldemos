import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:mldemos/models/models.dart';


class ActiveActivity extends StatelessWidget {
  final ViewModelBuilder<AppActivity> builder;

  ActiveActivity({ Key key, @required this.builder }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, AppActivity>(
      distinct: true,
      converter: (Store<AppState> store) => store.state.activeActivity,
      builder: builder,
    );
  }
}