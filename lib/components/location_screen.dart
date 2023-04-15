// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:stree_kavach/controller/geocoding_location.dart';
import 'package:stree_kavach/controller/service.dart';

class LocationScreen extends StatelessWidget {
  final MapController mapController;
  LocationScreen({Key? key, required this.mapController}) : super(key: key);

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
          SizedBox(
            height: 400,
            width: 400,
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                keepAlive: true,
                center: LatLng(service.latitude, service.longitude),
                zoom: 12.0,
                // onMapEvent: (p0) {
                //   Marker(
                //       point: LatLng(service.latitude, service.longitude),
                //       builder: (ctx) => Container(
                //             child: const Icon(Icons.location_on),
                //           ));
                // },
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(service.latitude, service.longitude),
                      builder: (ctx) => const Icon(Icons.location_on),
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
