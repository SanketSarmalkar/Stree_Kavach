import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:stree_kavach/components/app_bar_mode.dart';
import 'package:stree_kavach/components/location_screen.dart';
import 'package:stree_kavach/controller/geocoding_location.dart';
import 'package:stree_kavach/controller/permissions_handler.dart';
import 'package:stree_kavach/controller/service.dart';
import 'package:stree_kavach/screens/request_access.dart';
import 'package:stree_kavach/screens/setting.dart';

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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(deviceHeight * 0.15),
        child: AppBarMode(
          title: "StreeKavach",
        ),
      ),
      body: Container(
        height: deviceHeight * 0.9,
        decoration: BoxDecoration(
          color: Colors.blue[50],
        ),
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 5.0,
                bottom: 16.0,
                left: 16.0,
                right: 16.0,
              ),
              child: LocationScreen(
                mapController: myController,
              ),
            ),
            Positioned(
              bottom: deviceHeight * 0.15,
              child: MaterialButton(
                elevation: deviceWidth * 0.02,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(75)),
                ),
                height: deviceHeight * 0.1,
                minWidth: deviceWidth * 0.8,
                color: Colors.red,
                onPressed: () async {
                  await service.getLocation();
                  // geocodingLocation.getPlacemark(
                  //     service.latitude, service.longitude);
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
            Positioned(
              bottom: deviceHeight * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(75)),
                      ),
                      height: 50,
                      color: Colors.blue[400],
                      onPressed: () async {
                        await service.getLocation();
                        myController.move(
                            LatLng(service.latitude, service.longitude), 18.0);
                        // geocodingLocation.getPlacemark(
                        //     service.latitude, service.longitude);
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
                        borderRadius: BorderRadius.all(Radius.circular(75)),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
