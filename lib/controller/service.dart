import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Service extends GetxController {
  bool _hasCallSupport = true.obs();
  void initState() {
    super.onInit();
    UrlLauncher.canLaunchUrl(Uri(scheme: 'tel', path: '123'))
        .then((bool result) {
      _hasCallSupport = true;
    });
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    (_hasCallSupport)
        ? await UrlLauncher.launchUrl(launchUri)
        : const GetSnackBar(
            titleText: Text("permissions not given!!"),
          );
  }

  Future<void> sendsms() async {
    final Uri launchUri = Uri(
        scheme: 'sms',
        path: '9960590535',
        queryParameters: <String, String>{
          'body': Uri.encodeComponent('Example Subject')
        });
    await UrlLauncher.launchUrl(launchUri);
  }
}
