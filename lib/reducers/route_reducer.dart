import 'package:redux/redux.dart';

import 'package:mldemos/actions/actions.dart';
import 'package:mldemos/models/models.dart';

final routeReducer = combineReducers<String>([
  TypedReducer<String, SwitchRouteAction>(_switchRoute),
]);

String _switchRoute(String state, action) {
  return '/';
}
