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
    return AppBar(
      title: Center(
          child: Text(
        widget.title,
        style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: deviceWidth * 0.1),
      )),
    );
  }
}
