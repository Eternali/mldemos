import 'package:mldemos/models/models.dart';

class LoadHomeAction {
  
}

class LoadDemoAction {
  final String demo;
  LoadDemoAction(demo) {
    demos[demo].load();
  }
}
