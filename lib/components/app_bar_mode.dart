// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class AppBarMode extends StatefulWidget with PreferredSizeWidget {
  final String title;
  AppBarMode({Key? key, required this.title}) : super(key: key);

  @override
  State<AppBarMode> createState() => _AppBarModeState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarModeState extends State<AppBarMode> {
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        color: Colors.blue[50],
        height: deviceHeight * 0.1,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: deviceWidth * 0.03, vertical: deviceHeight * 0.015),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text("StreeKavach",
                  style: TextStyle(
                      fontSize: deviceWidth * 0.09,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
          ),
        ),
      ),
    );
  }
}
