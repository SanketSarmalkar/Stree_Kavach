// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stree_kavach/controller/geocoding_location.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({Key? key}) : super(key: key);

  GeocodingLocation geocodingLocation = Get.put(GeocodingLocation());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: <Widget>[
          const Text("Your Location",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(geocodingLocation.name.value)
        ]),
      ),
    );
  }
}
