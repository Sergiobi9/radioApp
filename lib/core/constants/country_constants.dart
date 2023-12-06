class Country {
  String countryCode = "";
  String name = "";

  Country({required this.countryCode, required this.name});
}

class CountryConstants {
  static List<Country> COUNTRIES = [
    Country(countryCode: "ES", name: "Spain"),
    Country(countryCode: "US", name: "United States"),
    Country(countryCode: "IT", name: "Italy"),
    Country(countryCode: "PT", name: "Portugal"),
    Country(countryCode: "NL", name: "Netherlands"),
    Country(countryCode: "CA", name: "Canada"),
    Country(countryCode: "CN", name: "China"),
    Country(countryCode: "DE", name: "Germany"),
    Country(countryCode: "JP", name: "Japan")
  ];
}
