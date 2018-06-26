import 'package:mldemos/themes.dart';

@immutable
class AppState {

  final bool isLoading;
  final String theme;

  AppState({
    this.isLoading = false,
    this.theme,
  });

  factory AppState.loading() => AppState(isLoading: true);

  AppState copyWith({
    bool isLoading,
    String theme,
  }) => AppState(
    isLoading: isLoading ?? this.isLoading,
    theme: theme ?? this.theme,
  );

  @override
  int get hashCode => isLoading.hashCode ^ theme.hashCode;

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is AppState &&
      runtimeType == other.runtimeType &&
      isLoading == other.isLoading &&
      theme == other.theme;

}