// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:stree_kavach/controller/geocoding_location.dart';
import 'package:stree_kavach/controller/service.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({Key? key}) : super(key: key);

  GeocodingLocation geocodingLocation = Get.put(GeocodingLocation());
  Service service = Get.put(Service());

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
          Text(geocodingLocation.name.value),
          Container(
            height: 300,
            width: 300,
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(15.4080101, 74.0099979),
                zoom: 18.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                ),
                CircleLayer(
                  circles: [],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(15.4080101, 74.0099979),
                      builder: (ctx) => Container(
                        child: const Icon(Icons.location_on),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
