class RadioStation {
  String id = "";
  String name = "";
  String image = "";
  String stream = "";
  bool isPlaying = false;
  List<String> tags = [];

  RadioStation.fromJsonMap(dynamic json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    image = json['favicon'] ?? "";
    stream = json['urlResolved'] ?? "";
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
  }
}
