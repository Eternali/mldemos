import 'package:redux/redux.dart';

import 'package:mldemos/actions/actions.dart';
import 'package:mldemos/models/models.dart';

final correctionExpansionReducer = combineReducers<bool>([
  TypedReducer<bool, ToggleCorrecterAction>(_toggleCorrectionExpansion),
]);

bool _toggleCorrectionExpansion(bool state, action) {
  return !state;
}
