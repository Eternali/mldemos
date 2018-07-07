import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:mldemos/themes.dart';
import 'package:mldemos/models/models.dart';

class DemoActivity extends StatelessWidget {

  final ViewModelBuilder<DemoVM> builder;

  DemoActivity({ Key key, @required this.builder }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DemoVM>(
      distinct: true,
      converter: DemoVM.fromStore,
      // see comment in main
      builder: builder,
    );
  }

}

class DemoVM {
  final dynamic prediction;

  DemoVM({ @required this.prediction });

  static DemoVM fromStore(Store<AppState> store) => DemoVM(
    prediction: store.state.prediction,
  );
}
