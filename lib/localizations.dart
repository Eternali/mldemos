import 'dart:async';

import 'package:flutter/material.dart';

typedef String StrGet();

class MLDemosLocalizations {
  static MLDemosLocalizations of(BuildContext context) {
    return Localizations.of<MLDemosLocalizations>(context, MLDemosLocalizations);
  }

}

class MLDemosLocalizationsDelegate
    extends LocalizationsDelegate<MLDemosLocalizations> {

  @override
  Future<MLDemosLocalizations> load(Locale locale) {
    return new Future(() => new MLDemosLocalizations());
  }

  @override
  bool shouldReload(MLDemosLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode.toLowerCase().contains('en');

}
