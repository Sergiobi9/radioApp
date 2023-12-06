abstract class IRadioStationListDataSource {
  Future<dynamic> fetchRadioStations(
      {String countryCode = "", List<String> tags = const []});
}
