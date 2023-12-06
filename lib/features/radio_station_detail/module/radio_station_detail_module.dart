import 'package:go_router/go_router.dart';
import 'package:radio_app/core/manager/audio/interface/i_audio_player_manager.dart';
import 'package:radio_app/core/manager/radio_station/interface/i_radio_station_manager.dart';
import 'package:radio_app/core/module/base_module.dart';
import 'package:radio_app/core/module/interface/i_base_module.dart';
import 'package:radio_app/features/radio_station_detail/ui/pages/radio_station_detail_page.dart';
import 'package:radio_app/features/radio_station_detail/ui/view_model/radio_station_detail_view_model.dart';

class RadioStationDetailModule extends BaseModule implements IBaseModule {
  @override
  String TAG = "RadioDetailModule";

  static String PATH_NAME = "/radio_detail";

  @override
  Future<GoRoute> getRoutes() async {
    await super.getRoutes();
    return GoRoute(
      name: PATH_NAME,
      path: PATH_NAME,
      builder: (context, state) {
        return RadioStationDetailPage();
      },
    );
  }

  @override
  Future<void> injectDependencies() async {
    sl.registerFactory<RadioStationDetailViewModel>(() =>
        RadioStationDetailViewModel(
            radioStationManager: sl.get<IRadioStationManager>(),
            audioPlayerManager: sl.get<IAudioPlayerManager>()));
  }
}
