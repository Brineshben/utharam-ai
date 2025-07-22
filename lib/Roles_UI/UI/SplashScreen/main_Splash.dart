import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:patient/Roles_UI/UI/SplashScreen/splash.dart';

import '../../../Controller/Login_Controller.dart';
import '../../../Model/Login_Model.dart';
import '../../../Service/Api_Service.dart';
import '../../../Service/SharedPreference.dart';
import '../../CHIEF_DOCTOR/bottom_Navigation_Chief.dart';
import '../../JUNIOR_DOCTOR/bottom_navigation_Junior.dart';
import '../../PATIENT/UI_PATIENT/bottom_Navigation_Patient.dart';
import '../ChatScreen/chat2.dart';
import '../HomePage/home_widgets/bottom_Navigationbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initialize();
    super.initState();

    // Timer for 3 seconds
    // Timer(Duration(seconds: 2), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => Splash()),
    //   );
    // });
  }
  Future<void> initialize() async {
    LoginModel? loginApi = await SharedPrefs().getLoginData();
    if (loginApi != null) {
      await Get.find<UserAuthController>().getUserLoginSaved(loginApi);
      final resp = await ApiServices.refreshToken(
        token:
        Get.find<UserAuthController>().loginData.value?.data?.refreshToken ??
            "",

      );
      print("objeewfrewfrw3frrct${resp['access']}");
      if (resp.containsKey('access')) {
        String role =
            Get.find<UserAuthController>().loginData.value?.data?.role ?? "";
        String name =
            Get.find<UserAuthController>().loginData.value?.data?.name ?? "";
        String token = resp['access'];

        int doctorId =
            Get.find<UserAuthController>().loginData.value?.data?.userId ?? 0;
        bool firsttime =
            Get.find<UserAuthController>().loginData.value?.data?.firstTime ??
                false;

        String formattedDate = Get.find<UserAuthController>()
            .loginData
            .value
            ?.data
            ?.registeredDate !=
            null
            ? DateFormat('dd_MM_yyyy').format(DateTime.parse(
            Get.find<UserAuthController>()
                .loginData
                .value!
                .data!
                .registeredDate!))
            : '';
        String patientId =
            Get.find<UserAuthController>().loginData.value?.data?.patientId ?? "";
        int userid =
            Get.find<UserAuthController>().loginData.value?.data?.userId ?? 0;
        print("object$role");
        if (role == "user") {
          if (firsttime == false) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    tokenPatient: Get.find<UserAuthController>()
                        .loginData
                        .value
                        ?.data
                        ?.accessToken ??
                        "",
                    role: role,
                    name: name,
                    date: formattedDate,
                    patientId: patientId,
                    userid: userid,
                  ),
                ),
                    (route) => false);
          } else {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => PageIndexNavigationPatient(
                      tokenPatient: Get.find<UserAuthController>()
                          .loginData
                          .value
                          ?.data
                          ?.accessToken ??
                          "",
                      role: role,
                      name: name,
                      date: formattedDate,
                      patientId: patientId,
                      userid: userid,
                    )),
                    (route) => false);
          }
        } else if (role == "admin") {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => PageIndexNavigationChief(
                  role: role,
                  name: name,
                  token: token,
                  doctorId: doctorId,
                ),
              ),
                  (route) => false);
        } else if (role == "junior_psychologist") {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => PageIndexNavigationJunior(
                  role: role,
                  name: name,
                  token: token,
                  doctorId: doctorId,
                ),
              ),
                  (route) => false);
        } else if (role == "senior_psychologist" || role == "psychiatrist") {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => PageIndexNavigationTherapist(
                  role: role,
                  name: name,
                  token: token,
                  doctorId: doctorId,
                ),
              ),
                  (route) => false);
        }
      } else {

        Get.snackbar('Error ', 'Session Expired',
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(
              bottom: 10,
              left: 8,
              right: 8),);
      }

    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Splash()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade50,
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child:SizedBox(
            width: size.width * 0.7,
            height: size.width * 0.7,
            child: Lottie.asset(
              "assets/images/Splash ScreenLQ.json",
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
