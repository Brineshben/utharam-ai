import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patient/Roles_UI/UI/Register_Page/Register.dart';
import 'package:patient/utils/color_util.dart';
import 'package:pinput/pinput.dart';

import '../../../Service/Api_Service.dart';
import '../Common_Widget/connectivity.dart';
import '../Common_Widget/popups.dart';
import 'SetPassword.dart';

class ForgotOtpScreen extends StatefulWidget {
  int id;

  ForgotOtpScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ForgotOtpScreen> createState() => ForgotOtpScreenState();
}

class ForgotOtpScreenState extends State<ForgotOtpScreen> {
  bool _showResendButton = false;
  int _secondsRemaining = 60;
  Timer? _timer;
  TextEditingController otpCode = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startResendOtpTimer();
  }

  void _startResendOtpTimer() {
    _showResendButton = false;
    _secondsRemaining = 60;
    _timer?.cancel();

    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_secondsRemaining == 0) {
        setState(() {
          _showResendButton = true;
          timer.cancel();
        });
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  void _submitOtp() {
    if (otpCode.text.length == 4) {
      Get.snackbar(
        'Failed',
        'Submitted OTP: $otpCode',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 10, left: 8, right: 8),
      );
      // You can validate OTP here
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text("Submitted OTP: $_otpCode")),
      //
      // );
    } else {
      Get.snackbar(
        'Failed',
        'Please enter full OTP',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 10, left: 8, right: 8),
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text("Please enter full OTP")),
      // );
    }
  }

  // void _resendOtp() async {
  //   Map<String, dynamic> resp = await ApiServices.sendOTP(widget.phoneNumber);
  //
  //   Get.snackbar(
  //     'Success',
  //     'OTP Resent Successfully',
  //     snackPosition: SnackPosition.BOTTOM,
  //     margin: const EdgeInsets.only(bottom: 10, left: 8, right: 8),
  //   );
  //   _startResendOtpTimer();
  //
  //   // ScaffoldMessenger.of(context).showSnackBar(
  //   //   const SnackBar(content: Text("OTP Resent")),
  //   // );
  // }

  final defaultPinTheme = PinTheme(

    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 18,
      color: Colors.grey,
      fontWeight: FontWeight.w300,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    ),
  );

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal.shade50,
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 50.h),
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
                        color: Colors.blueGrey,
                        fontSize: 25.h,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.w),
                  child: Text(
                    'Welcome to MetroMind',
                    style: TextStyle(
                        fontSize: 12.h,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.h, left: 15),
                  child: Text(
                    'Enter the 6-digit OTP sent to your Email.',
                    style: GoogleFonts.roboto(
                        color: Colors.blueGrey,
                        fontSize: 20.h,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 30),
                Center(
                  child: Pinput(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      // allows only digits (0-9)
                    ],
                    showCursor: true,
                    controller: otpCode,
                    length: 6,
                    autofocus: true,
                    defaultPinTheme: defaultPinTheme.copyWith(
                      textStyle: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w400),
                    ),
                    keyboardType: TextInputType.number,
                    onCompleted: (pin) {
                      setState(() {
                        otpCode.text = pin;




                      });
                    },
                  ),
                ),
                // OTP Text Field
                // OtpTextField(
                //
                //   inputFormatters: [
                //     FilteringTextInputFormatter.digitsOnly, // allows only digits (0-9)
                //   ],
                //   numberOfFields: 4,
                //   borderColor: Colors.blue,
                //   focusedBorderColor:Colorutils.userdetailcolor,
                //   showFieldAsBox: true,
                //   onCodeChanged: (String code) {
                //     // Handle validation if needed
                //   },
                //   onSubmit: (String verificationCode) {
                //     setState(() {
                //       otpCode.text = verificationCode;
                //     });
                //   }, // end onSubmit
                // ),
                const SizedBox(height: 50),


                // Resend Button
                // const SizedBox(height: 15),
                // Center(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       if (_showResendButton)
                //         TextButton(
                //           onPressed: _resendOtp,
                //           child: const Text(
                //             "Resend OTP",
                //             style: TextStyle(color: Colors.blue),
                //           ),
                //         )
                //       else
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text("Resend OTP in "),
                //             Text(
                //               "$_secondsRemaining",
                //               style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   color: Colors.blue),
                //             ),
                //             Text(" seconds"),
                //           ],
                //         ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: GestureDetector(
        onTap: (){
          checkInternet2(
            context: context,
            function: () async {
              FocusScope.of(context).unfocus();

                context.loaderOverlay.show();

                Map<String, dynamic> resp =
                await ApiServices.checkOTp(
                    id: widget.id, otp: otpCode.text);
                context.loaderOverlay.hide();

                // resp['data']['message'] == "Leave Applied Successfully"
                if (resp["message"] == "OTP verified successfully. You can now reset your password.") {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SetPassword(id: widget.id,)));
                  _submitOtp;

                  ProductAppPopUps.submit(
                    title: "Success",
                    message: resp['message'],
                    actionName: "Close",
                    iconData: Icons.done,
                    iconColor: Colors.green,
                  );
                } else {
                  ProductAppPopUps.submit(
                    title: "Error",
                    message: "Something went wrong",
                    actionName: "Close",
                    iconData: Icons.error_outline_outlined,
                    iconColor: Colors.red,
                  );
                }
              }

          );
        },
        // onTap: () async {
        //
        //
        //
        //
        //

        // },
        child: Container(

          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [Colors.green.shade300, Colors.blue.shade300], // Adjust colors to match your design
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // ),
            color: Colorutils.userdetailcolor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          width: 250.w,
          height: 45.h,

          child: Center(
            child: Text(
              'SUBMIT OTP',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 16.h,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
