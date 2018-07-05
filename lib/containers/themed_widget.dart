import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:mldemos/themes.dart';
import 'package:mldemos/models/models.dart';

class ThemedWidget extends StatelessWidget {
  final ViewModelBuilder<MLTheme> builder;

  ThemedWidget({ Key key, @required this.builder }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ThemedVM>(
      distinct: true,
      converter: ThemedVM.fromStore,
      builder: (BuildContext context, ThemedVM vm) => builder(context, vm.theme),
    );
  }

}

class ThemedVM {
  final MLTheme theme;

  ThemedVM({ this.theme });

  static ThemedVM fromStore(Store<AppState> store) => ThemedVM(
    theme: themes[store.state.theme ?? 'light']
  );
}
