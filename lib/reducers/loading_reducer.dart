import 'package:redux/redux.dart';

import 'package:mldemos/actions/actions.dart';
import 'package:mldemos/models/models.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, LoadHomeAction>(_setLoaded),
  TypedReducer<bool, LoadActivityAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}
