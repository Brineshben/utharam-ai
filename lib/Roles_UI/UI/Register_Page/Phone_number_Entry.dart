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
    {'name': 'Afghanistan', 'code': '+93'},
    {'name': 'Albania', 'code': '+355'},
    {'name': 'Algeria', 'code': '+213'},
    {'name': 'Andorra', 'code': '+376'},
    {'name': 'Angola', 'code': '+244'},
    {'name': 'Argentina', 'code': '+54'},
    {'name': 'Armenia', 'code': '+374'},
    {'name': 'Australia', 'code': '+61'},
    {'name': 'Austria', 'code': '+43'},
    {'name': 'Azerbaijan', 'code': '+994'},
    {'name': 'Bahamas', 'code': '+1-242'},
    {'name': 'Bahrain', 'code': '+973'},
    {'name': 'Bangladesh', 'code': '+880'},
    {'name': 'Belarus', 'code': '+375'},
    {'name': 'Belgium', 'code': '+32'},
    {'name': 'Belize', 'code': '+501'},
    {'name': 'Benin', 'code': '+229'},
    {'name': 'Bhutan', 'code': '+975'},
    {'name': 'Bolivia', 'code': '+591'},
    {'name': 'Bosnia and Herzegovina', 'code': '+387'},
    {'name': 'Botswana', 'code': '+267'},
    {'name': 'Brazil', 'code': '+55'},
    {'name': 'Brunei', 'code': '+673'},
    {'name': 'Bulgaria', 'code': '+359'},
    {'name': 'Burkina Faso', 'code': '+226'},
    {'name': 'Burundi', 'code': '+257'},
    {'name': 'Cambodia', 'code': '+855'},
    {'name': 'Cameroon', 'code': '+237'},
    {'name': 'Canada', 'code': '+1'},
    {'name': 'Chad', 'code': '+235'},
    {'name': 'Chile', 'code': '+56'},
    {'name': 'China', 'code': '+86'},
    {'name': 'Colombia', 'code': '+57'},
    {'name': 'Costa Rica', 'code': '+506'},
    {'name': 'Croatia', 'code': '+385'},
    {'name': 'Cuba', 'code': '+53'},
    {'name': 'Cyprus', 'code': '+357'},
    {'name': 'Czech Republic', 'code': '+420'},
    {'name': 'Denmark', 'code': '+45'},
    {'name': 'Dominican Republic', 'code': '+1-809'},
    {'name': 'Ecuador', 'code': '+593'},
    {'name': 'Egypt', 'code': '+20'},
    {'name': 'El Salvador', 'code': '+503'},
    {'name': 'Estonia', 'code': '+372'},
    {'name': 'Ethiopia', 'code': '+251'},
    {'name': 'Finland', 'code': '+358'},
    {'name': 'France', 'code': '+33'},
    {'name': 'Georgia', 'code': '+995'},
    {'name': 'Germany', 'code': '+49'},
    {'name': 'Ghana', 'code': '+233'},
    {'name': 'Greece', 'code': '+30'},
    {'name': 'Guatemala', 'code': '+502'},
    {'name': 'Honduras', 'code': '+504'},
    {'name': 'Hong Kong', 'code': '+852'},
    {'name': 'Hungary', 'code': '+36'},
    {'name': 'Iceland', 'code': '+354'},
    {'name': 'India', 'code': '+91'},
    {'name': 'Indonesia', 'code': '+62'},
    {'name': 'Iran', 'code': '+98'},
    {'name': 'Iraq', 'code': '+964'},
    {'name': 'Ireland', 'code': '+353'},
    {'name': 'Israel', 'code': '+972'},
    {'name': 'Italy', 'code': '+39'},
    {'name': 'Jamaica', 'code': '+1-876'},
    {'name': 'Japan', 'code': '+81'},
    {'name': 'Jordan', 'code': '+962'},
    {'name': 'Kazakhstan', 'code': '+7'},
    {'name': 'Kenya', 'code': '+254'},
    {'name': 'Kuwait', 'code': '+965'},
    {'name': 'Kyrgyzstan', 'code': '+996'},
    {'name': 'Laos', 'code': '+856'},
    {'name': 'Latvia', 'code': '+371'},
    {'name': 'Lebanon', 'code': '+961'},
    {'name': 'Lithuania', 'code': '+370'},
    {'name': 'Luxembourg', 'code': '+352'},
    {'name': 'Malaysia', 'code': '+60'},
    {'name': 'Maldives', 'code': '+960'},
    {'name': 'Mali', 'code': '+223'},
    {'name': 'Malta', 'code': '+356'},
    {'name': 'Mexico', 'code': '+52'},
    {'name': 'Monaco', 'code': '+377'},
    {'name': 'Mongolia', 'code': '+976'},
    {'name': 'Morocco', 'code': '+212'},
    {'name': 'Nepal', 'code': '+977'},
    {'name': 'Netherlands', 'code': '+31'},
    {'name': 'New Zealand', 'code': '+64'},
    {'name': 'Nigeria', 'code': '+234'},
    {'name': 'North Korea', 'code': '+850'},
    {'name': 'Norway', 'code': '+47'},
    {'name': 'Oman', 'code': '+968'},
    {'name': 'Pakistan', 'code': '+92'},
    {'name': 'Panama', 'code': '+507'},
    {'name': 'Paraguay', 'code': '+595'},
    {'name': 'Peru', 'code': '+51'},
    {'name': 'Philippines', 'code': '+63'},
    {'name': 'Poland', 'code': '+48'},
    {'name': 'Portugal', 'code': '+351'},
    {'name': 'Qatar', 'code': '+974'},
    {'name': 'Romania', 'code': '+40'},
    {'name': 'Russia', 'code': '+7'},
    {'name': 'Rwanda', 'code': '+250'},
    {'name': 'Saudi Arabia', 'code': '+966'},
    {'name': 'Senegal', 'code': '+221'},
    {'name': 'Serbia', 'code': '+381'},
    {'name': 'Singapore', 'code': '+65'},
    {'name': 'Slovakia', 'code': '+421'},
    {'name': 'Slovenia', 'code': '+386'},
    {'name': 'Somalia', 'code': '+252'},
    {'name': 'South Africa', 'code': '+27'},
    {'name': 'South Korea', 'code': '+82'},
    {'name': 'Spain', 'code': '+34'},
    {'name': 'Sri Lanka', 'code': '+94'},
    {'name': 'Sudan', 'code': '+249'},
    {'name': 'Sweden', 'code': '+46'},
    {'name': 'Switzerland', 'code': '+41'},
    {'name': 'Syria', 'code': '+963'},
    {'name': 'Taiwan', 'code': '+886'},
    {'name': 'Tanzania', 'code': '+255'},
    {'name': 'Thailand', 'code': '+66'},
    {'name': 'Tunisia', 'code': '+216'},
    {'name': 'Turkey', 'code': '+90'},
    {'name': 'Uganda', 'code': '+256'},
    {'name': 'Ukraine', 'code': '+380'},
    {'name': 'United Arab Emirates', 'code': '+971'},
    {'name': 'United Kingdom', 'code': '+44'},
    {'name': 'United States', 'code': '+1'},
    {'name': 'Uruguay', 'code': '+598'},
    {'name': 'Uzbekistan', 'code': '+998'},
    {'name': 'Venezuela', 'code': '+58'},
    {'name': 'Vietnam', 'code': '+84'},
    {'name': 'Yemen', 'code': '+967'},
    {'name': 'Zambia', 'code': '+260'},
    {'name': 'Zimbabwe', 'code': '+263'},
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
          padding: const EdgeInsets.only(left: 10, top: 60, right: 10),
          child: SingleChildScrollView(
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
                  padding: EdgeInsets.only(top: 50.h, left: 15),
                  child: Text(
                    'Please Enter your phone number',
                    style: GoogleFonts.roboto(
                        color: Colors.blueGrey,
                        fontSize: 20.h,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      // Country Code Dropdown
                      Container(
                        width: 150.w,
                        // Set a smaller width
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                        // Add slight vertical padding too
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blueGrey),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            // Make sure dropdown fills the container nicely
                            value: selectedCountry,
                            onChanged: (value) {
                              setState(() {
                                selectedCountry = value!;
                              });
                            },
                            items: countryCodes.map((country) {
                              String fullName =
                                  '${country['name']} (${country['code']})';
                              return DropdownMenuItem<String>(
                                value: fullName,
                                child: Text(
                                  fullName,
                                  style: TextStyle(fontSize: 14),
                                  overflow: TextOverflow
                                      .ellipsis, // Prevent overflow text
                                ),
                              );
                            }).toList(),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      // Phone Number TextField
                      Expanded(
                        child: TextField(
                          maxLength: 15,
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            // allows only digits (0-9)
                          ],
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 15),
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
                              borderSide: BorderSide(
                                  color: Colorutils.userdetailcolor, width: 2),
                            ),
                            counterText: '', // This hides the character count
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: GestureDetector(
        onTap: () async {
          FocusScope.of(context).unfocus();

          String selectedCode = selectedCountry.substring(
              selectedCountry.indexOf('(') + 1, selectedCountry.indexOf(')'));

          String fullPhoneNumber =
              '$selectedCode${phoneController.text.trim()}';

          print('Phone Number: $fullPhoneNumber');

          if (phoneController.text.isEmpty) {
            Get.snackbar(
              'Error',
              'Please enter your phone number',
              snackPosition: SnackPosition.BOTTOM,
              margin: const EdgeInsets.only(
                  bottom: 10,
                  left: 8,
                  right: 8), // Adjust the bottom space here
            );
          } else {
            context.loaderOverlay.show();

            Map<String, dynamic> resp =
                await ApiServices.sendOTP(fullPhoneNumber);
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
