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
  void initState() {
    super.onInit();
    // UrlLauncher.canLaunchUrl(Uri(scheme: 'tel', path: '123'))
    //     .then((bool result) {
    //   _hasCallSupport = true;
    // });
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    // final Uri launchUri = Uri(
    //   scheme: 'tel',
    //   path: phoneNumber,
    // );
    // (_hasCallSupport)
    //     ? await UrlLauncher.launchUrl(launchUri)
    //     : const GetSnackBar(
    //         titleText: Text("permissions not given!!"),
    //       );
    try {
      await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendSms() async {
    // final Uri launchUri = Uri(
    //     scheme: 'sms',
    //     path: '9960590535',
    //     queryParameters: <String, String>{
    //       'body': Uri.encodeComponent('Example Subject')
    //     });
    // await UrlLauncher.launchUrl(launchUri);
    final Telephony telephony = Telephony.instance;

    // final SmsSendStatusListener listener = (SendStatus status) {
    //   print(status);
    // };
    try {
      await telephony.sendSms(
          to: '9960564634', message: ' ' /*, statusListener: listener*/);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getLocation() async {
    Location location = Location();
    LocationData locationData = await location.getLocation();
    print(locationData.longitude);
    print(locationData.latitude);
    // GeoCode geoCode = GeoCode();
    // Address addresses = await geoCode.reverseGeocoding(
    //     latitude: _locationData.latitude ?? 78.00,
    //     longitude: _locationData.longitude ?? 78.00);
    // print(addresses.city);
    latitude = locationData.latitude ?? 78.0;
    longitude = locationData.longitude ?? 78.0;
    await geocodingLocation.getPlacemark(latitude, longitude);
  }
}
