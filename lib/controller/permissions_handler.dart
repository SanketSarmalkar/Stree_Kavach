// ignore_for_file: prefer_typing_uninitialized_variables, unrelated_type_equality_checks

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';
import 'package:app_settings/app_settings.dart';

class PermissionsHandler extends GetxController {
  var allPermissionsGranted = "0".obs;
  var locationPermission = false.obs;
  var phonePermission = false.obs;
  var smsPermission = false.obs;
  Location location = Location();

  Future<void> checkService() async {
    if (await Permission.phone.request().isGranted &&
        await Permission.location.request().isGranted &&
        await Permission.sms.request().isGranted) {
      allPermissionsGranted.value = "1";
    } else {
      (await Permission.location.request() == true)
          ? locationPermission.value = true
          : null;
      (await Permission.phone.request() == true)
          ? phonePermission.value = true
          : null;
      (await Permission.sms.request() == true)
          ? smsPermission.value = true
          : null;
    }
    // print(_permissionGrantedLocation);
  }

  Future<void> checkServiceAfterDenied() async {
    if (!await Permission.location.request().isGranted) {
      AppSettings.openLocationSettings();
    }
  }
}
