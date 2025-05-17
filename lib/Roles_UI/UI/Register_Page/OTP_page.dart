import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patient/Roles_UI/UI/Register_Page/Register.dart';
import 'package:patient/utils/color_util.dart';

import '../../../Service/Api_Service.dart';
import '../Common_Widget/popups.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _otpCode = "";

  void _submitOtp() {
    if (_otpCode.length == 6) {
      Get.snackbar('Failed', 'Submitted OTP: $_otpCode',
          snackPosition: SnackPosition.BOTTOM);
      // You can validate OTP here
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text("Submitted OTP: $_otpCode")),
      //
      // );
    } else {
      Get.snackbar('Failed', 'Please enter full OTP',
          snackPosition: SnackPosition.BOTTOM);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text("Please enter full OTP")),
      // );
    }
  }

  void _resendOtp() async{
    Map<String,dynamic> resp = await ApiServices.sendOTP(widget.phoneNumber);

    Get.snackbar('Success', 'OTP Resent Successfully',
        snackPosition: SnackPosition.BOTTOM);

    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(content: Text("OTP Resent")),
    // );
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Enter the 6-digit OTP sent to your number",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // OTP Text Field
              OtpTextField(
                numberOfFields: 4,
                borderColor: Colors.blue,
                focusedBorderColor:Colorutils.userdetailcolor,
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  // Handle validation if needed
                },
                onSubmit: (String verificationCode) {
                  setState(() {
                    _otpCode = verificationCode;
                  });
                }, // end onSubmit
              ),
              const SizedBox(height: 50),


              GestureDetector(
                onTap: ()async {
                  context.loaderOverlay.show();

                  Map<String,dynamic> resp = await ApiServices.checkOTP(widget.phoneNumber ,_otpCode  );
                  context.loaderOverlay.hide();

                  if (resp['status'] == "ok") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register(phoneNumbers:widget.phoneNumber,),
                      ),
                    );
                    ProductAppPopUps.submit(
                      title: "Success",
                      message:"Phone Number Registered Successfully,Please Enter Your Details to Register",
                      actionName: "Close",
                      iconData: Icons.done,
                      iconColor: Colors.green,
                    );
                  } else {
                    ProductAppPopUps.submit(
                      title: "Failed",
                      message: resp['message'] ?? 'Something went wrong.',
                      actionName: "Close",
                      iconData: Icons.error_outline,
                      iconColor: Colors.red,
                    );
                  }

                  _submitOtp
                  ;
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colorutils.userdetailcolor,
                    // gradient: LinearGradient(
                    //   colors: [
                    //     Colors.green.shade200,
                    //     Colors.blue.shade200
                    //   ], // Adjust colors to match your design
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    // ),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  // width: 250.w,
                  height: 45.h,
                  child: Center(
                    child: Text(
                      'SUBMIT',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.h,
                      ),
                    ),
                  ),
                ),
              ),
              // Resend Button
              const SizedBox(height: 15),

              TextButton(
                onPressed: _resendOtp,
                child: const Text(
                  "Resend OTP",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
