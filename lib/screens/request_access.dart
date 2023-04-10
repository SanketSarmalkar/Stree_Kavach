import 'package:flutter/material.dart';
import 'package:stree_kavach/controller/permissions_handler.dart';
import 'package:get/get.dart';

class RequestAccess extends StatefulWidget {
  RequestAccess({Key? key}) : super(key: key);

  @override
  State<RequestAccess> createState() => _RequestAccessState();
}

class _RequestAccessState extends State<RequestAccess> {
  PermissionsHandler permissionsHandler = Get.put(PermissionsHandler());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(75)),
              ),
              height: 150,
              minWidth: 150,
              color: Colors.blue,
              onPressed: () async {
                permissionsHandler.checkService();
              },
              child: const Text(
                "Request Permissions",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Note: Give all necessary permissions",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(" and get all security features"),
          ],
        ),
      ),
    );
  }
}
