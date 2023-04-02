import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

// ignore: camel_case_types
class mapSample extends StatefulWidget {
  const mapSample({super.key});

  @override
  State<mapSample> createState() => _mapSampleState();
}

class _mapSampleState extends State<mapSample> {
  GoogleMapController? _controller;
  Location currentLocation = Location();
  Set<Marker> _markers = {};

  void getLocation() async {
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc) {
      _controller
          ?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        zoom: 12.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      setState(() {
        _markers.add(Marker(
            markerId: MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)));
      });
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     getLocation();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          child: GoogleMap(
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(48.8561, 2.2930),
              zoom: 12.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
            markers: _markers,
          ),
        ),
        FloatingActionButton(onPressed: () {
          setState(() {
            getLocation();
          });
        }),
      ],
    );
  }
}
