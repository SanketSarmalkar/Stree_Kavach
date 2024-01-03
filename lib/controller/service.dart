// ignore_for_file: avoid_print, unused_field, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:geocode/geocode.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:stree_kavach/controller/geocoding_location.dart';
import 'package:telephony/telephony.dart';
// import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Service extends GetxController {
  final _hasCallSupport = true.obs();
  var latitude = 0.0.obs();
  var longitude = 0.0.obs();
  GeocodingLocation geocodingLocation = GeocodingLocation();

  Future<void> makePhoneCall(String phoneNumber) async {
    try {
      await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendSms() async {
    final Telephony telephony = Telephony.instance;

    try {
      await telephony.sendSms(
          to: '9960564634',
          message:
              'Alert By StreeKavach \n !! Help !!\n My co-ordinates\n Latitude:$latitude\n Longitude:$longitude,\n Address: ${"${geocodingLocation.street},${geocodingLocation.city}"}' /*, statusListener: listener*/);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getLocation() async {
    Location location = Location();
    LocationData locationData = await location.getLocation();
    print(locationData.longitude);
    print(locationData.latitude);
    latitude = locationData.latitude ?? 78.0;
    longitude = locationData.longitude ?? 78.0;
    await geocodingLocation.getPlacemark(latitude, longitude);
  }
}
