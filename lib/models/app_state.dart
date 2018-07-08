import 'package:mldemos/themes.dart';

class AppState {

  final String activeRoute;
  final String theme;
  final bool isLoading;

  final bool isPredicting;
  final bool correctionExpaneded;
  final dynamic prediction;

  AppState({
    this.activeRoute = '/',
    this.isLoading = false,
    this.isPredicting = false,
    this.theme,
    this.prediction,
    this.correctionExpaneded = false,
  });

  factory AppState.loading() => AppState(
    isLoading: true,
    theme: 'light',
  );

  AppState copyWith({
    String activeRoute,
    bool isLoading,
    bool isPredicting,
    String theme,
    dynamic prediction,
    bool correctionExpanded,
  }) => AppState(
    activeRoute: activeRoute ?? this.activeRoute,
    isLoading: isLoading ?? this.isLoading,
    isPredicting: isPredicting ?? this.isPredicting,
    theme: theme ?? this.theme,
    prediction: prediction ?? this.prediction,
    correctionExpaneded: correctionExpanded ?? this.correctionExpaneded,
  );

  @override
  int get hashCode =>
    activeRoute.hashCode ^
    isLoading.hashCode ^
    isPredicting.hashCode ^
    theme.hashCode ^
    prediction.hashCode ^
    correctionExpaneded.hashCode;

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is AppState &&
      runtimeType == other.runtimeType &&
      activeRoute == other.activeRoute &&
      isLoading == other.isLoading &&
      isPredicting == other.isPredicting &&
      theme == other.theme &&
      prediction == other.prediction &&
      correctionExpaneded == other.correctionExpaneded;

}