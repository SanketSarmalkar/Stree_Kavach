import 'package:flutter/material.dart';
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
                      await service.sendSms();
                      //await service.sendEmail();
                      String temp = "";
                      await service.makePhoneCall(temp);
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
