import 'package:redux/redux.dart';

import 'package:mldemos/actions/actions.dart';
import 'package:mldemos/models/models.dart';

final predictReducer = combineReducers<String>([
  TypedReducer<String, SwitchRouteAction>(_switchRoute),
]);

String _switchRoute(String state, action) {
  return '/';
}

final predictingReducer = combineReducers<bool>([
  TypedReducer<bool, LoadPredictionAction>(_setPredicting),
]);

bool _setPredicting(bool state, action) {
  return false;
}
