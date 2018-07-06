import 'package:mldemos/themes.dart';

class AppState {

  final String activeRoute;
  final bool isLoading;
  final String theme;

  final dynamic prediction;

  AppState({
    this.activeRoute = '/',
    this.isLoading = false,
    this.theme,
    this.prediction,
  });

  factory AppState.loading() => AppState(
    isLoading: true,
    theme: 'light',
  );

  AppState copyWith({
    String activeRoute,
    bool isLoading,
    String theme,
  }) => AppState(
    activeRoute: activeRoute ?? this.activeRoute,
    isLoading: isLoading ?? this.isLoading,
    theme: theme ?? this.theme,
  );

  @override
  int get hashCode => activeRoute.hashCode ^ isLoading.hashCode ^ theme.hashCode ^ theme.hashCode;

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is AppState &&
      runtimeType == other.runtimeType &&
      activeRoute == other.activeRoute &&
      isLoading == other.isLoading &&
      theme == other.theme &&
      prediction == other.prediction;

}