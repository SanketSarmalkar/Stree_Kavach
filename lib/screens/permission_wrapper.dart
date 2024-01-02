import 'package:flutter/material.dart';
import 'package:stree_kavach/controller/permissions_handler.dart';
import 'package:stree_kavach/screens/home.dart';
import 'package:stree_kavach/screens/request_access.dart';

class PermissionWrapper extends StatefulWidget {
  const PermissionWrapper({super.key});

  @override
  State<PermissionWrapper> createState() => _PermissionWrapperState();
}

class _PermissionWrapperState extends State<PermissionWrapper> {
  PermissionsHandler permissionsHandler = PermissionsHandler();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: permissionsHandler.checkService(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const RequestAccess();
        } else {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return (snapshot.data == true)
                ? const Home()
                : const RequestAccess();
          }
        }
      },
    );
  }
}
