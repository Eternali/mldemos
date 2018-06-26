import 'package:mldemos/themes.dart';
import 'package:mldemos/models/app_activity.dart';

@immutable
class AppState {

  final AppActivity activeActivity;
  final bool isLoading;
  final String theme;

  AppState({
    this.activeActivity = AppActivity.HOME,
    this.isLoading = false,
    this.theme,
  });

  factory AppState.loading() => AppState(
    isLoading: true,
    theme: 'light',
  );

  AppState copyWith({
    AppActivity activeActivity,
    bool isLoading,
    String theme,
  }) => AppState(
    activeActivity: activeActivity ?? this.activeActivity,
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