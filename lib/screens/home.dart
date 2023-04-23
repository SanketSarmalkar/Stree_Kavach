// ignore_for_file: unused_import, unused_local_variable, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:stree_kavach/components/app_bar_mode.dart';
import 'package:stree_kavach/components/location_screen.dart';
import 'package:stree_kavach/controller/geocoding_location.dart';
import 'package:stree_kavach/controller/permissions_handler.dart';
import 'package:stree_kavach/controller/service.dart';
import 'package:stree_kavach/screens/google_map_sample.dart';
import 'package:stree_kavach/screens/request_access.dart';
import 'package:stree_kavach/screens/setting.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Service service = Get.put(Service());
  GeocodingLocation geocodingLocation = Get.put(GeocodingLocation());
  PermissionsHandler permissionsController = Get.put(PermissionsHandler());
  MapController myController = MapController();
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    permissionsController.checkService();
    return Obx(
      () => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(deviceHeight * 0.07),
          child: AppBarMode(
            title: "StreeKavach",
          ),
        ),
        body: (permissionsController.allPermissionsGranted == "0")
            ? const RequestAccess()
            : Container(
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: LocationScreen(
                        mapController: myController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MaterialButton(
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(75)),
                        ),
                        height: 150,
                        minWidth: 150,
                        color: Colors.red,
                        onPressed: () async {
                          await service.getLocation();
                          geocodingLocation.getPlacemark(
                              service.latitude, service.longitude);
                          // await service.sendSms();
                          // //await service.sendEmail();
                          // String temp = "";
                          // await service.makePhoneCall(temp);
                          // print(geocodingLocation.state.value);
                        },
                        child: const Text("EMERGENCY",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(75)),
                            ),
                            height: 50,
                            color: Colors.blue[400],
                            onPressed: () async {
                              await service.getLocation();
                              myController.move(
                                  LatLng(service.latitude, service.longitude),
                                  18.0);
                              geocodingLocation.getPlacemark(
                                  service.latitude, service.longitude);
                              // myController.latLngToScreenPoint(
                              //     LatLng(service.latitude, service.longitude));
                            },
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Current Location",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Icon(Icons.location_on, color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(75)),
                            ),
                            height: 50,
                            color: Colors.blue[400],
                            onPressed: () {
                              Get.to(() => const Setting());
                            },
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Text("Settings",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
