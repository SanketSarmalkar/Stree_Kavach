import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';

class PermissionsHandler extends GetxController {
  var _permissionGrantedLocation;
  var _permissionGrantedPhone;
  var _permissionGrantedSms;
  Location location = Location();
  void initState() async {
    await checkService();
    super.onInit();
  }

  Future<void> checkService() async {
    _permissionGrantedPhone = await Permission.phone.status.obs();
    _permissionGrantedLocation = await location.hasPermission().obs();
    _permissionGrantedSms = await Permission.sms.status.obs();
    if (_permissionGrantedPhone.isDenied) {
      _permissionGrantedPhone = await Permission.phone.request();
    }
    if (_permissionGrantedLocation.isDenied) {
      _permissionGrantedLocation = await Permission.location.request();
    }
    if (_permissionGrantedSms.isDenied) {
      _permissionGrantedSms = await Permission.sms.request();
    }
    print(_permissionGrantedLocation);
  }
}
