// ignore_for_file: avoid_print, unused_field, unused_import
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:geocode/geocode.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:location/location.dart';
import 'package:stree_kavach/controller/geocoding_location.dart';
import 'package:stree_kavach/model/user_info.dart';
import 'package:telephony/telephony.dart';
// import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Service extends GetxController {
  final _hasCallSupport = true.obs();
  final myBox = Hive.box('mybox');
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
    final String helperNumber1 = await myBox.get('helper_1_phone') ?? '';
    final String helperNumber2 = await myBox.get('helper_2_phone') ?? '';
    String message =
        ' Alert By StreeKavach \n !! Help !!\n  My co-ordinates\n Latitude:$latitude\n Longitude:$longitude,\n Address: ${"${geocodingLocation.street},${geocodingLocation.city}"}';

    if (helperNumber1 != '' && helperNumber1.length == 10) {
      try {
        await telephony.sendSms(
          to: helperNumber1,
          message: message,
        );
      } catch (e) {
        print(e);
      }
    }
    if (helperNumber2 != '' && helperNumber2.length == 10) {
      try {
        await telephony.sendSms(
          to: helperNumber2,
          message: message,
        );
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> telegramBotAlert() async {
    final client = http.Client();
    UserInfo userInfo = UserInfo(
      name: myBox.get('user'),
      latitude: latitude.toString(),
      longitude: longitude.toString(),
      address: geocodingLocation.name.toString() +
          geocodingLocation.street.toString() +
          geocodingLocation.city.toString(),
    );
    try {
      final response = await client.post(
        Uri.parse(dotenv.env['BACKEND_API']!),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userInfo.toJson()),
      );
      print(response.body);
    } catch (e) {
      print(e);
    } finally {
      client.close();
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
