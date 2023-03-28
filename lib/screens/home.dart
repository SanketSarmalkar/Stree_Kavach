import 'package:flutter/material.dart';
import 'package:stree_kavach/controller/service.dart';
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
                Center(
                    child: MaterialButton(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(75)),
                  ),
                  height: 150,
                  minWidth: 150,
                  color: Colors.red,
                  onPressed: () => {service.makePhoneCall('9960590535')},
                  child: Text("Call"),
                )),
                Center(
                    child: MaterialButton(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(75)),
                  ),
                  height: 150,
                  minWidth: 150,
                  color: Colors.red,
                  onPressed: () => {},
                  child: Text("mail"),
                )),
                Center(
                    child: MaterialButton(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(75)),
                  ),
                  height: 150,
                  minWidth: 150,
                  color: Colors.red,
                  onPressed: () => {service.sendsms()},
                  child: Text("sms"),
                )),
              ],
            ),
          )),
    );
  }
}
