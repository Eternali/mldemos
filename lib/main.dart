import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:mldemos/localizations.dart';
import 'package:mldemos/routes.dart';
import 'package:mldemos/themes.dart';
import 'package:mldemos/models/models.dart';
import 'package:mldemos/presentation/home_screen.dart';
import 'package:mldemos/reducers/app_reducer.dart';

void main() async {
  runApp(
    new MLDemos()
  );
}

class MLDemos extends StatelessWidget {

  final store = new Store<AppState>(
    appReducer,
    initialState: new AppState.loading(),
    middleware: createStoreMiddleware()
  );

  MLDemos();

  @override
  Widget build(BuildContext context) {

    return StoreProvider(
      store: store,
      child: new MaterialApp(
        title: 'MLDemos',
        localizationsDelegates: [
          new MLDemosLocalizationsDelegate()
        ],
        routes: {
          Routes.home: (context) => StoreBuilder<AppState>(
            onInit: (store) => store.dispatch(Load),
            builder: (context, store) => HomeScreen(title: 'MLDemos'),
          ),
        },
        builder: (BuildContext context, Widget child) => new Theme(
          data: Provider.of(context).value.theme ?? themes['light'],
          child: child,
        ),
      ),
    );
  }

}
