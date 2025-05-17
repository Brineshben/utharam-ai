import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../Controller/Login_Controller.dart';
import '../../../Model/Login_Model.dart';
import '../../../Service/SharedPreference.dart';
import '../../../utils/Constants.dart';
import '../../CHIEF_DOCTOR/bottom_Navigation_Chief.dart';
import '../../JUNIOR_DOCTOR/bottom_navigation_Junior.dart';
import '../../PATIENT/UI_PATIENT/bottom_Navigation_Patient.dart';
import '../ChatScreen/Chat.dart';
import '../ChatScreen/chat2.dart';
import '../HomePage/home_widgets/bottom_Navigationbar.dart';
import '../Login_Page/login.dart';
import '../Register_Page/Phone_number_Entry.dart';
import '../Register_Page/Register.dart';
import 'Carousle.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future<void> initialize() async {
    LoginModel? loginApi = await SharedPrefs().getLoginData();
    if (loginApi != null) {
      await Get.find<UserAuthController>().getUserLoginSaved(loginApi);

      String role


      =
          Get.find<UserAuthController>().loginData.value?.data?.role ?? "";
      String name =
          Get.find<UserAuthController>().loginData.value?.data?.name ?? "";
      String token =
          Get.find<UserAuthController>().loginData.value?.data?.accessToken ??
              "";

      int doctorId =
          Get.find<UserAuthController>().loginData.value?.data?.userId ?? 0;
      bool firsttime =
          Get.find<UserAuthController>().loginData.value?.data?.firstTime ?? false;

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
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemUiOverlayStyleDark,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            height: ScreenUtil().screenHeight,
            width: ScreenUtil().screenWidth,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 80.h),
                                child: SizedBox(
                                  height: 100.h,
                                  // height: 180.h,
                                  child: Image.asset(
                                    "assets/images/Utaram3d_Logo.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 10.h),

                            CarouseWidget(carouselItems: items),

                            SizedBox(height: 60.h),
                            // Text(
                            //   "SWIPE TO DISCOVER MORE",
                            //   style: TextStyle(
                            //     fontSize: 15.h,
                            //     fontWeight: FontWeight.w400,
                            //     color: Colors.black87,
                            //   ),
                            // ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return PhoneNumberEntryPage();
                                },));
                                // Navigator.push(context, MaterialPageRoute(
                                //   builder: (context) {
                                //     return Register(phoneNumbers: "hshsh");
                                //   },
                                // ));
                              },
                              child: Center(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30)
                                        .w,
                                child: GestureDetector(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    // width: 250.w,
                                    height: 50.h,
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'GET STARTED',
                                            style: GoogleFonts.roboto(
                                              color: Colors.white,
                                              fontSize: 20.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return LoginPage();
                                  },
                                ));
                              },
                              child: Center(
                                child: SizedBox(
                                  width: 280.w,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Already have an account?',
                                          style: GoogleFonts.oxygen(
                                            color: Colors.black,
                                            fontSize: 17.h,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' LOGIN',
                                          style: GoogleFonts.oxygen(
                                            color: Colors.black,
                                            fontSize: 20.h,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                            // Center(
                            //   child: Padding(
                            //     padding:
                            //         const EdgeInsets.symmetric(horizontal: 30).w,
                            //     child: GestureDetector(
                            //       onTap: () async {
                            //         // context.loaderOverlay.show();
                            //         // await signIn().then(
                            //         //         (_) => context.loaderOverlay.hide());
                            //       },
                            //       child: Container(
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(30.r),
                            //           border: Border.all(
                            //             color: Colorutils.userdetailcolor,
                            //             width: 0.8,
                            //           ),
                            //         ),
                            //         // width: 250.w,
                            //         height: 45.h,
                            //         child: Center(
                            //           child: Row(
                            //             mainAxisSize: MainAxisSize.min,
                            //             children: [
                            //               Image.asset(
                            //                 height: 25.h,
                            //                 "assets/google_logo.png",
                            //                 fit: BoxFit.fitHeight,
                            //               ),
                            //               SizedBox(width: 8.w),
                            //               Text(
                            //                 'Sign in with Google',
                            //                 style: GoogleFonts.inter(
                            //                   fontSize: 16.h,
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 150,
                            ),
                            Center(
                              child: Text(
                                "Version 0.1",
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 10.h,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

// Example Usage:
final List<CarouselItem> items = [
  CarouselItem(
    content: Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo at the top
          Image.asset(
            "assets/images/treatment.png", // Replace with your image
            height: 80, // Adjust size as needed
          ),
          SizedBox(height: 16), // Spacing

          // Title Text
          Text(
            "Metromind",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
          Text(
            "Therapy",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12), // Spacing

          // Description
          Text(
            "Metro Mind Therapy utilizes a scientific approach to improve mood, thoughts, and behaviors through a combination of pharmacological treatments, psychological interventions, and electromagnetic therapies.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    ),
  ),
  CarouselItem(
    content: Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo at the top
          Image.asset(
            "assets/images/emergency.png", // Replace with your image
            height: 80, // Adjust size as needed
          ),
          SizedBox(height: 16), // Spacing

          // Title Text
          Text(
            "Psychedelic",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
          Text(
            "Therapy",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12), // Spacing

          // Description
          Text(
            "By integrating cutting-edge research with patient-centered care, this therapy aims to provide transformative mental health outcomes.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    ),
  ),
  CarouselItem(
    content: Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo at the top
          Image.asset(
            "assets/images/staff.png", // Replace with your image
            height: 80, // Adjust size as needed
          ),
          SizedBox(height: 16), // Spacing

          // Title Text
          Text(
            "rTMS",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
          Text(
            "Therapy",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12), // Spacing

          // Description
          Text(
            "Repetitive Transcranial Magnetic Stimulation (rTMS) is a non-invasive, evidence-based therapy used to treat mental health conditions like depression, anxiety, and OCD.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    ),
  ),
  CarouselItem(
    content: Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo at the top
          Image.asset(
            "assets/images/doctors.png", // Replace with your image
            height: 80, // Adjust size as needed
          ),
          SizedBox(height: 16), // Spacing

          // Title Text
          Text(
            "IV Therapy",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
          Text(
            "Clinic",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12), // Spacing

          // Description
          Text(
            "IV Drip Therapy or Intravenous Therapy, is the ultimate in delivering essential nutrients directly into the bloodstream via a cannula. Bypassing the gut barrier, IV administartion allows for maximum bio availability of the nutrients meaning your body may absorb what it needs quickly.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    ),
  ),
];
