// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:stree_kavach/controller/geocoding_location.dart';
import 'package:stree_kavach/controller/service.dart';

class LocationScreen extends StatefulWidget {
  final MapController mapController;
  const LocationScreen({Key? key, required this.mapController})
      : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GeocodingLocation geocodingLocation = Get.put(GeocodingLocation());
  Service service = Get.put(Service());

  @override
  void initState() {
    super.initState();
    service.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
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
            height: height * 0.77,
            //width: 400,
            child: FlutterMap(
              mapController: widget.mapController,
              options: MapOptions(
                keepAlive: true,
                center: LatLng(service.latitude, service.longitude),
                zoom: 10.0,
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
