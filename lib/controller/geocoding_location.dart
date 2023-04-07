import 'package:get/get.dart';

import 'package:geocoding/geocoding.dart';

class GeocodingLocation extends GetxController {
  List<Placemark> placemark = <Placemark>[];
  var street = ''.obs;
  var city = ''.obs;
  var state = ''.obs;
  var name = ''.obs;

  Future<void> getPlacemark(double latitude, double longitude) async {
    placemark = await placemarkFromCoordinates(latitude, longitude);
    // print(placemark[0]);
    street.value = placemark[0].street.toString();
    city.value = placemark[0].locality.toString();
    state.value = placemark[0].administrativeArea.toString();
    name.value = placemark[0].name.toString();
  }
}
