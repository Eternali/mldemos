import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:mldemos/localizations.dart';
import 'package:mldemos/themes.dart';
import 'package:mldemos/actions/actions.dart';
import 'package:mldemos/middleware/store_middleware.dart';
import 'package:mldemos/models/models.dart';
import 'package:mldemos/presentation/about_screen.dart';
import 'package:mldemos/presentation/demo_screen.dart';
import 'package:mldemos/presentation/home_screen.dart';
import 'package:mldemos/presentation/settings_screen.dart';
import 'package:mldemos/reducers/app_reducer.dart';

void main() async {
  MaterialPageRoute.debugEnableFadingRoutes = true;
  runApp(MLDemos());
}

class MLDemos extends StatelessWidget {

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.loading(),
    middleware: createStoreMiddleware()
  );

  MLDemos();

  @override
  Widget build(BuildContext context) {

    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'MLDemos',
        localizationsDelegates: [
          MLDemosLocalizationsDelegate()
        ],
        routes: {
          '/': (context) => StoreBuilder<AppState>(
            onInit: (store) => store.dispatch(LoadHomeAction()),
            builder: (context, store) => HomeScreen(title: 'MLDemos'),
          ),
          '/settings': (context) => StoreBuilder<AppState>(
            builder: (context, store) => SettingsScreen(),
          ),
          '/about': (context) => AboutScreen(),
        }..addAll(demos.map(
          (name, demo) => MapEntry(
            demo.route,
            (context) => StoreBuilder<AppState>(
              onInit: (store) => store.dispatch(LoadDemoAction(demo.load)),
              builder: (context, store) => DemoScreen(demo),
          )
        ))),
        // Have to add this because builder in active_activity is not being applied
        builder: (context, child) => Theme(
          data: themes[store.state.theme] ?? themes['light'].theme,
          child: child,
        ),
      ),
    );
  }

}
