import 'package:get/get.dart';

import 'package:geocoding/geocoding.dart';

class GeocodingLocation extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getPlacemark(28.7041, 77.1025);
  }

  List<Placemark> placemark = <Placemark>[].obs();
  Future<void> getPlacemark(double latitude, double longitude) async {
    placemark = await placemarkFromCoordinates(latitude, longitude);
    print(placemark[0]);
  }
}
