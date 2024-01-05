import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserInfoPage extends StatefulWidget {
  final Function changeUserName;
  const UserInfoPage({required this.changeUserName, Key? key})
      : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final _myBox = Hive.box("mybox");

  // write data
  void writeData(String userName) {
    _myBox.put('user', userName);
    print(_myBox.get('user').toString());
  }

  String newName = '';
  void changeName(String value) {
    setState(() {
      newName = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/wall_paper_1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.8),
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'StreeKavach',
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.headlineMedium!.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.07,
                right: MediaQuery.of(context).size.width * 0.07,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.8),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Note: Give The information for emergency conditions",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const Text(" to get all security features"),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                          vertical: MediaQuery.of(context).size.height * 0.02),
                      child: TextField(
                        onChanged: (value) {
                          changeName(value);
                        },
                        decoration: const InputDecoration(
                          labelText: "Enter Your Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    MaterialButton(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      height: 60,
                      onPressed: () {
                        writeData(newName);
                        widget.changeUserName(_myBox.get('user').toString());
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
