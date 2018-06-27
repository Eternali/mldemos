import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:mldemos/themes.dart';
import 'package:mldemos/models/models.dart';


class ActiveActivity extends StatelessWidget {
  final ViewModelBuilder<AppActivity> builder;

  ActiveActivity({ Key key, @required this.builder }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ActivityVM>(
      distinct: true,
      converter: ActivityVM.fromStore,
      builder: (BuildContext context, ActivityVM vm) => Theme(
        data: vm.theme ?? themes['light'],
        child: builder(context, vm.activeActivity),
      ),
    );
  }
}

class ActivityVM {
  final AppActivity activeActivity;
  final String theme;

  ActivityVM({ @required this.activeActivity, @required this.theme });

  static ActivityVM fromStore(Store<AppState> store) => ActivityVM(
    activeActivity: store.state.activeActivity,
    theme: store.state.theme,
  );
}
