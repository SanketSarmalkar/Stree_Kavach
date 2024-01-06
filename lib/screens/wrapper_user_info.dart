import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stree_kavach/screens/home.dart';
import 'package:stree_kavach/screens/user_info_page.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  String userName = "";
  void changeUserName(String newName) {
    setState(() {
      userName = newName;
    });
  }

  final _myBox = Hive.box("mybox");

  @override
  Widget build(BuildContext context) {
    return (_myBox.get('user') == "" || _myBox.get('user') == null)
        ? UserInfoPage(
            changeUserName: changeUserName,
          )
        : const Home();
  }
}
