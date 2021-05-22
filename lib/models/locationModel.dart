class LocationModel {
  final double longitude;
  final double latitude;

  LocationModel({this.longitude, this.latitude});

  static LocationModel fromJson(dynamic json) {
    return LocationModel(
      latitude: json['coord']['lat'].toDouble(),
      longitude: json['coord']['lon'].toDouble(),
    );
  }
}
