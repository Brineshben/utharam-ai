import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../Controller/Login_Controller.dart';
import '../../../utils/Constants.dart';
import '../../../utils/color_util.dart';
import '../../CHIEF_DOCTOR/bottom_Navigation_Chief.dart';
import '../../JUNIOR_DOCTOR/bottom_navigation_Junior.dart';
import '../../PATIENT/UI_PATIENT/Home_Screen/Home_Screen_Patient.dart';
import '../../PATIENT/UI_PATIENT/bottom_Navigation_Patient.dart';
import '../ChatScreen/Chat.dart';
import '../ChatScreen/chat2.dart';
import '../Common_Widget/connectivity.dart';
import '../Common_Widget/popups.dart';
import '../HomePage/home_widgets/bottom_Navigationbar.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:intl/intl.dart';

import '../SplashScreen/splash.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate to Splash screen manually
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Splash()),
        );
        return false; // prevent default back action
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: systemUiOverlayStyleDark,
          child: Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade50,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
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
                                SizedBox(height: 40.h),
                                Container(
                                  margin: EdgeInsets.only(left: 15.w),
                                  child: Text(
                                    'Hello !',
                                    style: GoogleFonts.roboto(
                                        color: Colors.black,
                                        fontSize: 25.h,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15.w),
                                  child: Text(
                                    'Sign in to your account',
                                    style: TextStyle(
                                        fontSize: 12.h,
                                        color: Colors.grey,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),

                                SizedBox(height: 5.h),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 2.h),
                                  child: TextFormField(
                                    cursorColor: Colors.grey,
                                    controller: _usernameController,
                                    autofillHints: const [AutofillHints.username],
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                        focusedBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 2)),
                                        enabledBorder: const UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey)),
                                        // border: UnderlineInputBorder(),
                                        labelText: 'Email',
                                        labelStyle: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 16.h)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 5.h),
                                  child: TextFormField(
                                    cursorColor: Colors.grey,
                                    textInputAction: TextInputAction.done,
                                    obscureText: _obscureText,
                                    controller: _passwordController,
                                    autofillHints: const [AutofillHints.password],
                                    onEditingComplete: () =>
                                        TextInput.finishAutofillContext(),
                                    decoration: InputDecoration(
                                        focusedBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 2)),
                                        enabledBorder: const UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey)),
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 16.h),
                                        suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _obscureText = !_obscureText;
                                              });
                                            },
                                            child: Icon(_obscureText
                                                ? Icons.visibility_off
                                                : Icons.visibility))),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                          horizontal: 20.w, vertical: 5.h)
                                      .w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ForgotPassword()

                                              ));

                                        },
                                        child: Text(
                                          "Forgot Password?",
                                          style: TextStyle(
                                              fontSize: 11.h,
                                              color: Colors.blue[900]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 60.h),
                                GestureDetector(
                                  onTap: () async {
                                    FocusScope.of(context).unfocus();

                                    checkInternet2(
                                      context: context,
                                      function: () async {
                                        print("Doctor Id${ Get.find<UserAuthController>()
                                            .loginData
                                            .value
                                            ?.data
                                            ?.userId ??
                                            ""}");
                                        String user = _usernameController.text.trim();
                                        String psw = _passwordController.text.trim();
                                        if (user.isNotEmpty) {
                                          if (psw.isNotEmpty) {
                                            context.loaderOverlay.show();

                                            await Get.find<UserAuthController>()
                                                .fetchUserData(
                                                username: user, password: psw);
                                            context.loaderOverlay.hide();

                                            if (Get.find<UserAuthController>()
                                                .isLoaded
                                                .value) {
                                              String role =
                                                  Get.find<UserAuthController>()
                                                      .loginData
                                                      .value
                                                      ?.data
                                                      ?.role ??
                                                      "";  String name =
                                                  Get.find<UserAuthController>()
                                                      .loginData
                                                      .value
                                                      ?.data
                                                      ?.name ??
                                                      ""; String token =
                                                  Get.find<UserAuthController>()
                                                      .loginData
                                                      .value
                                                      ?.data
                                                      ?.accessToken ??
                                                      "";

                                                      int doctorId =
                                                  Get.find<UserAuthController>()
                                                      .loginData
                                                      .value
                                                      ?.data
                                                      ?.userId ??
                                                      0; bool firsttime =
                                                  Get.find<UserAuthController>()
                                                      .loginData
                                                      .value
                                                      ?.data
                                                      ?.firstTime ??
                                                      false;

                                              String formattedDate = Get.find<UserAuthController>()
                                                  .loginData
                                                  .value
                                                  ?.data
                                                  ?.registeredDate != null
                                                  ? DateFormat('dd-MM-yyyy').format(
                                                  DateTime.parse(Get.find<UserAuthController>()
                                                      .loginData
                                                      .value!
                                                      .data!
                                                      .registeredDate!))
                                                  : '';
                                                      String patientId =
                                                  Get.find<UserAuthController>()
                                                      .loginData
                                                      .value
                                                      ?.data
                                                      ?.patientId ??
                                                      ""; int userid =
                                                  Get.find<UserAuthController>()
                                                      .loginData
                                                      .value
                                                      ?.data
                                                      ?.userId ??
                                                      0;
                                              print("object$role");
                                              if (role == "user") {
                                                if(firsttime== false){

                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ChatScreen(tokenPatient: Get.find<UserAuthController>()
                                                                .loginData
                                                                .value
                                                                ?.data
                                                                ?.accessToken ??
                                                                "", role:role, name: name, date:formattedDate, patientId: patientId, userid: userid,),
                                                      ));
                                                }
                                                else{
                                                  Navigator.pushReplacement(
                                                    context,
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
                                                      ),
                                                    ),
                                                  );
                                                }



                                              } else if (role == "admin") {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PageIndexNavigationChief(role:role, name: name, token: token, doctorId: doctorId,),
                                                    ));
                                              } else if (role == "junior_psychologist" ) {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PageIndexNavigationJunior(role:role, name: name, token: token, doctorId: doctorId,),
                                                    ));
                                              }else if (role == "senior_psychologist" ||role == "psychiatrist") {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PageIndexNavigationTherapist(role:role, name: name, token: token, doctorId: doctorId,),
                                                    ));
                                              }
                                              // Get.snackbar('SUCCESS', 'Login successful',
                                              //   snackPosition: SnackPosition.BOTTOM,
                                              //   margin: const EdgeInsets.only(
                                              //       bottom: 10,
                                              //       left: 8,
                                              //       right: 8), );

                                            }
                                          } else {
                                            ProductAppPopUps.submit(
                                              title: "FAILED",
                                              message: "Please Enter your Password.",
                                              actionName: "Close",
                                              iconData: Icons.error_outline,
                                              iconColor: Colors.red,
                                            );
                                          }
                                        } else {
                                          ProductAppPopUps.submit(
                                            title: "FAILED",
                                            message: "Please Enter Your Email.",
                                            actionName: "Close",
                                            iconData: Icons.error_outline,
                                            iconColor: Colors.red,
                                          );
                                        }
                                      },
                                    );



                                  },
                                  child: Center(
                                      child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 30)
                                            .w,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        // gradient: LinearGradient(
                                        //   colors: [Colors.green.shade300, Colors.blue.shade300], // Adjust colors to match your design
                                        //   begin: Alignment.topLeft,
                                        //   end: Alignment.bottomRight,
                                        // ),
                                        color: Colorutils.userdetailcolor,
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      // width: 250.w,
                                      height: 45.h,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'LOGIN',
                                              style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontSize: 18.h,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            // SizedBox(
                                            //   width: 10,
                                            // ),
                                            // Icon(
                                            //   Icons.arrow_forward_ios,
                                            //   color: Colors.white,
                                            //   size: 16,
                                            // )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                                ),
                                SizedBox(height: 10.h),
                                // Row(
                                //   children: <Widget>[
                                //     Expanded(
                                //       child: Divider(
                                //         indent: 30.w,
                                //         thickness: 0.5,
                                //         color: Colors.grey[400],
                                //       ),
                                //     ),
                                //     Padding(
                                //       padding:
                                //           EdgeInsets.symmetric(horizontal: 8.w),
                                //       child: Text(
                                //         'or',
                                //         style: TextStyle(
                                //           color: Colors.grey[600],
                                //           fontSize: 12.h,
                                //         ),
                                //       ),
                                //     ),
                                //     Expanded(
                                //       child: Divider(
                                //         thickness: 0.5,
                                //         color: Colors.grey[400],
                                //         endIndent: 30.w,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(height: 10.h),
                                // SizedBox(height: 10.h),
                                // GestureDetector(
                                //   child: Center(
                                //     child: Padding(
                                //       padding: const EdgeInsets.symmetric(
                                //               horizontal: 30)
                                //           .w,
                                //       child: GestureDetector(
                                //         onTap: () {
                                //           Get.snackbar('Failed', 'Feature is under Maintenance',
                                //               snackPosition: SnackPosition.BOTTOM,
                                //             margin: const EdgeInsets.only(
                                //                 bottom: 10,
                                //                 left: 8,
                                //                 right: 8),);
                                //         },
                                //         child: Container(
                                //           decoration: BoxDecoration(
                                //             borderRadius:
                                //                 BorderRadius.circular(30.r),
                                //             border: Border.all(
                                //               color: Colorutils.userdetailcolor,
                                //               width: 0.8,
                                //             ),
                                //           ),
                                //           // width: 250.w,
                                //           height: 50.h,
                                //           child: Center(
                                //             child: Row(
                                //               mainAxisSize: MainAxisSize.min,
                                //               children: [
                                //                 Image.asset(
                                //                   height: 25.h,
                                //                   "assets/images/google_logo.png",
                                //                   fit: BoxFit.fitHeight,
                                //                 ),
                                //                 SizedBox(width: 8.w),
                                //                 Text(
                                //                   'Sign in with Google',
                                //                   style: GoogleFonts.inter(
                                //                     fontSize: 16.h,
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),

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
                                  child: GestureDetector(
                                    onTap: () {

                                    },
                                    child: Text(
                                      "Version 0.1",
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 10.h,
                                      ),
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
        ),
      ),
    );
  }
}
