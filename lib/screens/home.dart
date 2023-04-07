// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stree_kavach/controller/geocoding_location.dart';
import 'package:stree_kavach/controller/permissions_handler.dart';
import 'package:stree_kavach/controller/service.dart';
import 'package:stree_kavach/screens/google_map_sample.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Service service = Service();

  final PermissionsHandler permissionsController = PermissionsHandler();

  final GeocodingLocation geocodingLocation = GeocodingLocation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stree Kavach"),
      ),
      body: Container(
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Column(children: <Widget>[
                //     Text("Your Location",
                //         style: TextStyle(
                //             fontSize: 20, fontWeight: FontWeight.bold)),
                //     Container(
                //       //height: MediaQuery.of(context).size.height,
                //       child: mapSample(),
                //     )
                //   ]),
                // ),
                // Text("Your Location",
                //     style:
                //         TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                // Obx(
                //   () => Text((geocodingLocation.placemark.isNotEmpty)
                //       ? geocodingLocation.placemark[0].name.toString()
                //       : "Loading..."),
                // ),
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
                      // await service.sendSms();
                      // //await service.sendEmail();
                      // String temp = "";
                      // await service.makePhoneCall(temp);
                      await service.GetLocation();
                      // print(geocodingLocation.placemark);
                    },
                    child: const Text("EMERGENCY",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
