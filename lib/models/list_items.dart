import 'package:flutter/material.dart';

import 'package:mldemos/models/routes.dart';

class MenuChoice {
  final String title;
  final IconData icon;
  final MLDemosRoute route;
  const MenuChoice({
    this.title,
    this.icon,
    this.route,
  });
}
