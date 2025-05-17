import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patient/Service/Api_Service.dart';
import 'package:patient/utils/color_util.dart';

import '../Common_Widget/popups.dart';
import 'OTP_page.dart';

class PhoneNumberEntryPage extends StatefulWidget {
  @override
  _PhoneNumberEntryPageState createState() => _PhoneNumberEntryPageState();
}

class _PhoneNumberEntryPageState extends State<PhoneNumberEntryPage> {
  String selectedCountry = 'India (+91)'; // Default

  TextEditingController phoneController = TextEditingController();

  final List<Map<String, String>> countryCodes = [
    {'name': 'United States', 'code': '+1'},
    {'name': 'India', 'code': '+91'},
    {'name': 'United Kingdom', 'code': '+44'},
    {'name': 'Canada', 'code': '+1'},
    {'name': 'Australia', 'code': '+61'},
    {'name': 'Germany', 'code': '+49'},
    {'name': 'France', 'code': '+33'},
    {'name': 'Japan', 'code': '+81'},
  ];

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
          padding: const EdgeInsets.only(left: 10,top: 60,right: 10),
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
                padding: EdgeInsets.only(top: 50.h,left: 15),
                child: Text(
                  'Please Enter your phone number',
                  style: GoogleFonts.roboto(
                      color: Colors.blueGrey,
                      fontSize: 20.h,
                      fontWeight: FontWeight.bold),                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    // Country Code Dropdown
                    Container(
                      width: 100, // Set a smaller width
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1), // Add slight vertical padding too
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blueGrey),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: Colors.white,
                          isExpanded: true, // Make sure dropdown fills the container nicely
                          value: selectedCountry,
                          onChanged: (value) {
                            setState(() {
                              selectedCountry = value!;
                            });
                          },
                          items: countryCodes.map((country) {
                            String fullName = '${country['name']} (${country['code']})';
                            return DropdownMenuItem<String>(
                              value: fullName,
                              child: Text(
                                fullName,
                                style: TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis, // Prevent overflow text
                              ),
                            );
                          }).toList(),
                          icon: Icon(Icons.arrow_drop_down,color: Colors.blueGrey,),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    // Phone Number TextField
                    Expanded(
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(horizontal:5 , vertical: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: ()async{
                  FocusScope.of(context).unfocus();

                  String selectedCode = selectedCountry
                      .substring(selectedCountry.indexOf('(') + 1,
                      selectedCountry.indexOf(')'));

                  String fullPhoneNumber =
                      '$selectedCode${phoneController.text.trim()}';

                  print('Phone Number: $fullPhoneNumber');

                  if (phoneController.text.isEmpty) {
                    Get.snackbar('Error', 'Please enter your phone number',
                        snackPosition: SnackPosition.BOTTOM);

                  } else {
                    context.loaderOverlay.show();

                    Map<String,dynamic> resp = await ApiServices.sendOTP(fullPhoneNumber);
                    context.loaderOverlay.hide();
print("----------resp---------?$resp");
                    if (resp['status'] == "ok") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(
                            phoneNumber: fullPhoneNumber,
                          ),
                        ),
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

                  }
                },
                child: Center(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10)
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
                    )),
              )

            ],
          ),
        ),
      ),
    );
  }
}
