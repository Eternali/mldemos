import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:mldemos/models/models.dart';

class PredictionListener extends StatelessWidget {

  final ViewModelBuilder<PredictionListenerVM> builder;
  
  PredictionListener({ Key key, @required this.builder }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PredictionListenerVM>(
      distinct: true,
      converter: PredictionListenerVM.fromStore,
      builder: builder,
    );
  }

}

class PredictionListenerVM {
  final bool isLoading;
  final bool isPredicting;

  PredictionListenerVM({
    this.isLoading,
    this.isPredicting,
  });

  static PredictionListenerVM fromStore(Store<AppState> store) => PredictionListenerVM(
    isLoading: store.state.isLoading,
    isPredicting: store.state.isPredicting,
  )
}
