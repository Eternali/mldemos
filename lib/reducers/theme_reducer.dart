import 'package:redux/redux.dart';

import 'package:mldemos/actions/actions.dart';
import 'package:mldemos/models/models.dart';

final themeReducer = combineReducers<String>([
  TypedReducer<String, SetThemeAction>(_setTheme),
]);

String _setTheme(String state, action) {
  return 'dark';
}
