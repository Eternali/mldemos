import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:mldemos/themes.dart';
import 'package:mldemos/models/models.dart';

class ActiveActivity extends StatelessWidget {
  final ViewModelBuilder<String> builder;

  ActiveActivity({ Key key, @required this.builder }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ActivityVM>(
      distinct: true,
      converter: ActivityVM.fromStore,
      // see comment in main
      builder: (BuildContext context, ActivityVM vm) => Theme(
        data: vm.theme ?? themes['light'].theme,
        child: builder(context, vm.activeRoute),
      ),
    );
  }
}

class ActivityVM {
  final String activeRoute;
  final String theme;

  ActivityVM({ @required this.activeRoute, @required this.theme });

  static ActivityVM fromStore(Store<AppState> store) => ActivityVM(
    activeRoute: store.state.activeRoute,
    theme: store.state.theme,
  );
}
