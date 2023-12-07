import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:radio_app/core/module/base_module.dart';
import 'package:radio_app/features/radio_station_detail/module/radio_station_detail_module.dart';
import 'package:radio_app/features/radio_station_list/module/radio_station_list_module.dart';

class AppInit {
  static Future<GoRouter> init() async {
    return await _initializeRoutes();
  }

  static Future<GoRouter> _initializeRoutes() async {
    var radioStationListModule = await RadioStationListModule().getRoutes();
    var radioStationDetailModule = await RadioStationDetailModule().getRoutes();

    return GoRouter(
        navigatorKey: GlobalKey<NavigatorState>(),
        initialLocation: RadioStationListModule.PATH_NAME,
        routes: <RouteBase>[radioStationListModule, radioStationDetailModule]);
  }
}
