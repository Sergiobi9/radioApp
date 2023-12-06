// ignore_for_file: non_constant_identifier_names

import 'package:get_it/get_it.dart';

abstract class IBaseModule {
  abstract GetIt sl;

  Future<void> getRoutes();
  Future<void> injectDependencies();
}
