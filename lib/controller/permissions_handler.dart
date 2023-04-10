// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';

class PermissionsHandler extends GetxController {
  var allPermissionsGranted = "0".obs;
  Location location = Location();

  Future<void> checkService() async {
    if (await Permission.phone.request().isGranted &&
        await Permission.location.request().isGranted &&
        await Permission.sms.request().isGranted) {
      allPermissionsGranted.value = "1";
    } else {
      await Permission.location.request();
      await Permission.phone.request();
      await Permission.sms.request();
    }
    // print(_permissionGrantedLocation);
  }
}
