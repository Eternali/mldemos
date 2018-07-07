import 'package:mldemos/models/models.dart';
import 'package:mldemos/reducers/loading_reducer.dart';
import 'package:mldemos/reducers/predict_reducer.dart';
import 'package:mldemos/reducers/route_reducer.dart';
import 'package:mldemos/reducers/theme_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    activeRoute: routeReducer(state.activeRoute, action),
    isLoading: loadingReducer(state.isLoading, action),
    isPredicting: predictingReducer(state.isPredicting, action),
    theme: themeReducer(state.theme, action),
    prediction: predictReducer(state.prediction, action),
  );
}