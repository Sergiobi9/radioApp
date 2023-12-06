// ignore_for_file: non_constant_identifier_names

import 'package:get_it/get_it.dart';
import 'package:radio_app/core/manager/audio/audio_player_manager.dart';
import 'package:radio_app/core/module/interface/i_base_module.dart';

class BaseModule implements IBaseModule {
  @override
  GetIt sl = GetIt.instance;

  @override
  Future<void> getRoutes() async {
    await injectDependencies();
  }

  @override
  Future<void> injectDependencies() async {}
}
