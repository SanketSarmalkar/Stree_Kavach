class UserInfo {
  final String name;
  final String latitude;
  final String longitude;
  final String address;

  UserInfo(
      {required this.name,
      required this.latitude,
      required this.longitude,
      required this.address});

  toJson() {
    return {
      "name": name,
      "latitude": latitude,
      "longitude": longitude,
      "address": address
    };
  }
}
