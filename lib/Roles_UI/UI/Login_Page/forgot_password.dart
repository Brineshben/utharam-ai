import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patient/Service/Api_Service.dart';
import 'package:patient/utils/color_util.dart';

import '../Common_Widget/connectivity.dart';
import '../Common_Widget/popups.dart';
import '../Register_Page/Register.dart';
import 'Otpforgotpassword.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
          padding: const EdgeInsets.only(left: 10, top: 60, right: 10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    padding: EdgeInsets.only(top: 40.h, left: 15),
                    child: Text(
                      'Please Enter your Registered Email',
                      style: GoogleFonts.roboto(
                          color: Colors.blueGrey,
                          fontSize: 20.h,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  buildTextField2Email(
                    "Email",
                    "assets/images/envelope.svg",
                    false,
                    email,
                    true,
                    _formKey,
                    true,
                    isEmail: true,
                  ),
                ],
              ),
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

              if (_formKey.currentState!.validate()) {
                context.loaderOverlay.show();

                Map<String, dynamic> resp =
                await ApiServices.forgotPasswordEmail(
                 email:email.text );
                context.loaderOverlay.hide();

                // resp['data']['message'] == "Leave Applied Successfully"
                if (resp['message'] == "OTP has been sent to your email") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotOtpScreen( id:resp['user_id'] ?? 0,)

                      ));

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
            },
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
              'SEND OTP',
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
