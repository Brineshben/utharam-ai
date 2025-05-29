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
import 'login.dart';

class SetPassword extends StatefulWidget {
  final int id;
  const SetPassword({super.key, required this.id});

  @override
  SetPasswordState createState() => SetPasswordState();
}

class SetPasswordState extends State<SetPassword> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText1 = true;
  bool _obscureText2 = true;
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
          padding: const EdgeInsets.only(left: 10, top: 40, right: 10),
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
                  SizedBox(height: 20.h),
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
                      'Enter New Password',
                      style: GoogleFonts.roboto(
                          color: Colors.blueGrey,
                          fontSize: 20.h,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 15, right: 15, top: 8),
                    child: TextFormField(
                      onChanged: (val) {
                        if (_formKey.currentState != null) {
                          _formKey.currentState!
                              .validate(); // Re-validate when typing
                        }
                      },
                      validator: (val) {
                        if (val == null || val.trim().isEmpty) {
                          return 'Please enter password.';
                        }
                        String password = val.trim();

                        // Password validation rules
                        if (password.length < 8) {
                          return 'Password must be at least 8 characters long.';
                        }
                        if (!RegExp(r'[A-Z]').hasMatch(password)) {
                          return 'Password must contain at least one uppercase letter.';
                        }
                        if (!RegExp(r'[a-z]').hasMatch(password)) {
                          return 'Password must contain at least one lowercase letter.';
                        }
                        if (!RegExp(r'[0-9]').hasMatch(password)) {
                          return 'Password must contain at least one number.';
                        }
                        if (!RegExp(r'[!@#\$&*~^%()_+\-=\[\]{};:"\\|,.<>\/?]').hasMatch(password)) {
                          return 'Password must contain at least one special character.';
                        }

                        return null;
                      },
                      controller: password,
                      obscureText: _obscureText1,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 15.h,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colorutils.userdetailcolor,
                                width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3)),
                          ),
                          prefixIcon: Icon(Icons.lock_outline_rounded,
                              color: Colors.blueGrey),
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3)),
                          ),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText1 = !_obscureText1;
                                });
                              },
                              child: Icon(_obscureText1
                                  ? Icons.visibility_off
                                  : Icons.visibility))),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 15, right: 15, top: 8),
                    child: TextFormField(
                      onChanged: (val) {
                        if (_formKey.currentState != null) {
                          _formKey.currentState!
                              .validate(); // Re-validate when typing
                        }
                      },
                      validator: (val) {
                        if (val == null || val.trim().isEmpty) {
                          return 'Please enter confirm password.';
                        }
                        String password = val.trim();

                        // Password validation rules
                        if (password.length < 8) {
                          return 'Password must be at least 8 characters long.';
                        }
                        if (!RegExp(r'[A-Z]').hasMatch(password)) {
                          return 'Password must contain at least one uppercase letter.';
                        }
                        if (!RegExp(r'[a-z]').hasMatch(password)) {
                          return 'Password must contain at least one lowercase letter.';
                        }
                        if (!RegExp(r'[0-9]').hasMatch(password)) {
                          return 'Password must contain at least one number.';
                        }
                        if (!RegExp(r'[!@#\$&*~^%()_+\-=\[\]{};:"\\|,.<>\/?]').hasMatch(password)) {
                          return 'Password must contain at least one special character.';
                        }

                        return null;
                      },
                      controller: confirmPassword,
                      obscureText: _obscureText2,
                      decoration: InputDecoration(
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(
                            fontSize: 15.h,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colorutils.userdetailcolor,
                                width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3)),
                          ),
                          prefixIcon: Icon(Icons.lock_outline_rounded,
                              color: Colors.grey),
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3)),
                          ),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText2 = !_obscureText2;
                                });
                              },
                              child: Icon(_obscureText2
                                  ? Icons.visibility_off
                                  : Icons.visibility))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: GestureDetector(
        onTap: () async {
          checkInternet2(
              context: context,
              function: () async {
                FocusScope.of(context).unfocus();

                context.loaderOverlay.show();

                Map<String, dynamic> resp =
                await ApiServices.resetPassword(
                    id: widget.id, newPassword: password.text, confirm: confirmPassword.text);
                context.loaderOverlay.hide();

                // resp['data']['message'] == "Leave Applied Successfully"
                if (resp["message"] == "Password has been reset successfully") {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
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

          );
        },
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
              'RESET PASSWORD',
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
