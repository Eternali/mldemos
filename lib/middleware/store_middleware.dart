import 'package:redux/redux.dart';

import 'package:mldemos/models/models.dart';
import 'package:mldemos/repository/remote_db.dart';
import 'package:mldemos/repository/shared_pref.dart';
import 'package:mldemos/repository/repository.dart';

List<Middleware<AppState>> createStoreMiddleware([
  MLDemosRepository repository = const MLDemosRepository(
    sharedprefs: SharedPref(),
    remotedb: RemoteDB(),
  )
]) {
  
  return [];
}