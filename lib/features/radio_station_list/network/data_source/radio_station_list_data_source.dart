import 'package:radio_app/core/data_source/base_data_source.dart';
import 'package:radio_app/features/radio_station_list/api/radio_station_list_api.dart';
import 'package:radio_app/features/radio_station_list/network/data_source/interface/i_radio_station_list_data_source.dart';

class RadioStationListDataSource extends BaseDataSource
    implements IRadioStationListDataSource {
  @override
  Future fetchRadioStations(
      {String countryCode = "", List<String> tags = const []}) {
    return super.get(
        endpoint: RadioStationListApi.FETCH_RADIO_STATIONS_ENDPOINT,
        queryParameters: {"countryCode": countryCode, 'tags': tags});
  }
}
