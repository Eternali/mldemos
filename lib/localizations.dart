import 'dart:async';

import 'package:flutter/material.dart';

typedef String StrGet();

class MLDemosLocalizations {
  static MLDemosLocalizations of(BuildContext context) {
    return Localizations.of<MLDemosLocalizations>(context, MLDemosLocalizations);
  }

  String get appTitle => 'MLDemos';
  String get description => 'Description';
  String get instructions => 'Instructions';
  String get noText => '<Oops, there\'s nothing here!>';

}

class MLDemosLocalizationsDelegate
    extends LocalizationsDelegate<MLDemosLocalizations> {

  @override
  Future<MLDemosLocalizations> load(Locale locale) {
    return Future(() => MLDemosLocalizations());
  }

  @override
  bool shouldReload(MLDemosLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode.toLowerCase().contains('en');

}
