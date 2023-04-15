// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:stree_kavach/controller/permissions_handler.dart';
import 'package:get/get.dart';

class RequestAccess extends StatefulWidget {
  const RequestAccess({Key? key}) : super(key: key);

  @override
  State<RequestAccess> createState() => _RequestAccessState();
}

class _RequestAccessState extends State<RequestAccess> {
  PermissionsHandler permissionsHandler = Get.put(PermissionsHandler());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => Column(
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
                permissionsHandler.checkServiceAfterDenied();
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
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Note: Give all necessary permissions",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(" and get all security features"),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Access to Location"),
                (permissionsHandler.locationPermission == true)
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    : const Icon(Icons.close_rounded, color: Colors.red)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Access to Phone"),
                (permissionsHandler.phonePermission == true)
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    : const Icon(Icons.close_rounded, color: Colors.red)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Access to SMS"),
                (permissionsHandler.smsPermission == true)
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    : const Icon(Icons.close_rounded, color: Colors.red)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
