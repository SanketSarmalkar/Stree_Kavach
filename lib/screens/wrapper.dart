import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stree_kavach/controller/permissions_handler.dart';
import 'package:stree_kavach/screens/home.dart';
import 'package:stree_kavach/screens/request_access.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    PermissionsHandler permissionsHandler = Get.put(PermissionsHandler());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Obx(() => (permissionsHandler.checkPermission())
          ? const Home()
          : const Scaffold(body: SafeArea(child: RequestAccess()))),
    );
  }
}
