import 'package:go_router/go_router.dart';
import 'package:radio_app/core/manager/audio/audio_player_manager.dart';
import 'package:radio_app/core/manager/audio/interface/i_audio_player_manager.dart';
import 'package:radio_app/core/manager/radio_station/interface/i_radio_station_manager.dart';
import 'package:radio_app/core/manager/radio_station/radio_station_manager.dart';
import 'package:radio_app/core/module/base_module.dart';
import 'package:radio_app/core/module/interface/i_base_module.dart';
import 'package:radio_app/features/radio_station_list/network/data_source/interface/i_radio_station_list_data_source.dart';
import 'package:radio_app/features/radio_station_list/network/data_source/radio_station_list_data_source.dart';
import 'package:radio_app/features/radio_station_list/network/repository/radio_station_list_repository.dart';
import 'package:radio_app/features/radio_station_list/ui/pages/radio_station_list_page.dart';
import 'package:radio_app/features/radio_station_list/ui/view_model/radio_station_list_view_model.dart';

class RadioStationListModule extends BaseModule implements IBaseModule {
  @override
  String TAG = "RadioStationListModule";

  static String PATH_NAME = "/radio_station_list";

  @override
  Future<GoRoute> getRoutes() async {
    await super.getRoutes();
    return GoRoute(
      name: PATH_NAME,
      path: PATH_NAME,
      builder: (context, state) {
        return RadioStationListPage();
      },
    );
  }

  @override
  Future<void> injectDependencies() async {
    sl.registerSingleton<IAudioPlayerManager>(AudioPlayerManager());
    sl.registerSingleton<IRadioStationManager>(RadioStationManager());

    sl.registerFactory<RadioStationListViewModel>(() =>
        RadioStationListViewModel(
            repository: RadioStationListRepository(
                dataSource: RadioStationListDataSource()),
            radioStationManager: sl.get<IRadioStationManager>(),
            audioPlayerManager: sl.get<IAudioPlayerManager>()));
  }
}
