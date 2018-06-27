import 'dart:async';

import 'package:mldemos/repository/local_db.dart';
import 'package:mldemos/repository/shared_pref.dart';
import 'package:mldemos/repository/remote_db.dart';

class MLDemosRepository {

  final LocalDB localdb;
  final RemoteDB remotedb;
  final SharedPref sharedprefs;

  const MLDemosRepository({
    this.localdb = const LocalDB(),
    this.remotedb = const RemoteDB(),
    this.sharedprefs = const SharedPref(),
  });

}