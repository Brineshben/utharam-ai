import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:patient/Roles_UI/UI/Common_Widget/popups.dart';

Future<void> checkInternet2(
    {required BuildContext context, required Function() function}) async {
  bool connected = await CheckConnectivity().check();
  print("internect connection is $connected");
  if (connected) {
    function();
  } else {
    ProductAppPopUps.submit(
      title: "Warning",
      message:
      "No internet connection. Please check your network and try again.",
      actionName: "Close",
      iconData: Icons.info_outline,
      iconColor: Colors.red,
    );
  }
}

class CheckConnectivity {
  Future<bool> check() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    } else {
      return true;
    }
  }
}