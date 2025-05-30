import 'package:dropdown_button2/dropdown_button2.dart';
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
  String selectedCountry = 'Ind (+91)'; // Default

  TextEditingController phoneController = TextEditingController();

  final List<Map<String, String>> countryCodes = [
    {'name': 'Afg', 'code': '+93'},
    {'name': 'Alb', 'code': '+355'},
    {'name': 'Alg', 'code': '+213'},
    {'name': 'And', 'code': '+376'},
    {'name': 'Ang', 'code': '+244'},
    {'name': 'Arg', 'code': '+54'},
    {'name': 'Arm', 'code': '+374'},
    {'name': 'Aus', 'code': '+61'},
    {'name': 'Aus', 'code': '+43'},
    {'name': 'Aze', 'code': '+994'},
    {'name': 'Bah', 'code': '+1-242'},
    {'name': 'Bah', 'code': '+973'},
    {'name': 'Ban', 'code': '+880'},
    {'name': 'Bel', 'code': '+375'},
    {'name': 'Bel', 'code': '+32'},
    {'name': 'Bel', 'code': '+501'},
    {'name': 'Ben', 'code': '+229'},
    {'name': 'Bhu', 'code': '+975'},
    {'name': 'Bol', 'code': '+591'},
    {'name': 'Bos', 'code': '+387'},
    {'name': 'Bot', 'code': '+267'},
    {'name': 'Bra', 'code': '+55'},
    {'name': 'Bru', 'code': '+673'},
    {'name': 'Bul', 'code': '+359'},
    {'name': 'Bur', 'code': '+226'},
    {'name': 'Bur', 'code': '+257'},
    {'name': 'Cam', 'code': '+855'},
    {'name': 'Cam', 'code': '+237'},
    {'name': 'Can', 'code': '+1'},
    {'name': 'Cha', 'code': '+235'},
    {'name': 'Chi', 'code': '+56'},
    {'name': 'Chi', 'code': '+86'},
    {'name': 'Col', 'code': '+57'},
    {'name': 'Cos', 'code': '+506'},
    {'name': 'Cro', 'code': '+385'},
    {'name': 'Cub', 'code': '+53'},
    {'name': 'Cyp', 'code': '+357'},
    {'name': 'Cze', 'code': '+420'},
    {'name': 'Den', 'code': '+45'},
    {'name': 'Dom', 'code': '+1-809'},
    {'name': 'Ecu', 'code': '+593'},
    {'name': 'Egy', 'code': '+20'},
    {'name': 'El ', 'code': '+503'},
    {'name': 'Est', 'code': '+372'},
    {'name': 'Eth', 'code': '+251'},
    {'name': 'Fin', 'code': '+358'},
    {'name': 'Fra', 'code': '+33'},
    {'name': 'Geo', 'code': '+995'},
    {'name': 'Ger', 'code': '+49'},
    {'name': 'Gha', 'code': '+233'},
    {'name': 'Gre', 'code': '+30'},
    {'name': 'Gua', 'code': '+502'},
    {'name': 'Hon', 'code': '+504'},
    {'name': 'Hon', 'code': '+852'},
    {'name': 'Hun', 'code': '+36'},
    {'name': 'Ice', 'code': '+354'},
    {'name': 'Ind', 'code': '+91'},
    {'name': 'Ind', 'code': '+62'},
    {'name': 'Ira', 'code': '+98'},
    {'name': 'Ira', 'code': '+964'},
    {'name': 'Ire', 'code': '+353'},
    {'name': 'Isr', 'code': '+972'},
    {'name': 'Ita', 'code': '+39'},
    {'name': 'Jam', 'code': '+1-876'},
    {'name': 'Jap', 'code': '+81'},
    {'name': 'Jor', 'code': '+962'},
    {'name': 'Kaz', 'code': '+7'},
    {'name': 'Ken', 'code': '+254'},
    {'name': 'Kuw', 'code': '+965'},
    {'name': 'Kyr', 'code': '+996'},
    {'name': 'Lao', 'code': '+856'},
    {'name': 'Lat', 'code': '+371'},
    {'name': 'Leb', 'code': '+961'},
    {'name': 'Lit', 'code': '+370'},
    {'name': 'Lux', 'code': '+352'},
    {'name': 'Mal', 'code': '+60'},
    {'name': 'Mal', 'code': '+960'},
    {'name': 'Mal', 'code': '+223'},
    {'name': 'Mal', 'code': '+356'},
    {'name': 'Mex', 'code': '+52'},
    {'name': 'Mon', 'code': '+377'},
    {'name': 'Mon', 'code': '+976'},
    {'name': 'Mor', 'code': '+212'},
    {'name': 'Nep', 'code': '+977'},
    {'name': 'Net', 'code': '+31'},
    {'name': 'New', 'code': '+64'},
    {'name': 'Nig', 'code': '+234'},
    {'name': 'Nor', 'code': '+850'},
    {'name': 'Nor', 'code': '+47'},
    {'name': 'Oma', 'code': '+968'},
    {'name': 'Pak', 'code': '+92'},
    {'name': 'Pan', 'code': '+507'},
    {'name': 'Par', 'code': '+595'},
    {'name': 'Per', 'code': '+51'},
    {'name': 'Phi', 'code': '+63'},
    {'name': 'Pol', 'code': '+48'},
    {'name': 'Por', 'code': '+351'},
    {'name': 'Qat', 'code': '+974'},
    {'name': 'Rom', 'code': '+40'},
    {'name': 'Rus', 'code': '+7'},
    {'name': 'Rwa', 'code': '+250'},
    {'name': 'Sau', 'code': '+966'},
    {'name': 'Sen', 'code': '+221'},
    {'name': 'Ser', 'code': '+381'},
    {'name': 'Sin', 'code': '+65'},
    {'name': 'Slo', 'code': '+421'},
    {'name': 'Slo', 'code': '+386'},
    {'name': 'Som', 'code': '+252'},
    {'name': 'Sou', 'code': '+27'},
    {'name': 'Sou', 'code': '+82'},
    {'name': 'Spa', 'code': '+34'},
    {'name': 'Sri', 'code': '+94'},
    {'name': 'Sud', 'code': '+249'},
    {'name': 'Swe', 'code': '+46'},
    {'name': 'Swi', 'code': '+41'},
    {'name': 'Syr', 'code': '+963'},
    {'name': 'Tai', 'code': '+886'},
    {'name': 'Tan', 'code': '+255'},
    {'name': 'Tha', 'code': '+66'},
    {'name': 'Tun', 'code': '+216'},
    {'name': 'Tur', 'code': '+90'},
    {'name': 'Uga', 'code': '+256'},
    {'name': 'Ukr', 'code': '+380'},
    {'name': 'Uni', 'code': '+971'},
    {'name': 'Uni', 'code': '+44'},
    {'name': 'Uni', 'code': '+1'},
    {'name': 'Uru', 'code': '+598'},
    {'name': 'Uzb', 'code': '+998'},
    {'name': 'Ven', 'code': '+58'},
    {'name': 'Vie', 'code': '+84'},
    {'name': 'Yem', 'code': '+967'},
    {'name': 'Zam', 'code': '+260'},
    {'name': 'Zim', 'code': '+263'},
  ];
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
              key:_formKey ,
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
                      'Please enter your phone number',
                      style: GoogleFonts.roboto(
                          color: Colors.blueGrey,
                          fontSize: 20.h,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                offset: const Offset(0, 8),
                                maxHeight: 330.h// Drop down appears below the field
                            ),
                            buttonStyleData: ButtonStyleData(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.blueGrey),
                              ),
                            ),
                            value: selectedCountry,
                            items: countryCodes.map((country) {
                              String fullName = '${country['name']} (${country['code']})';
                              return DropdownMenuItem<String>(
                                value: fullName,
                                child: Text(
                                  fullName,
                                  style: const TextStyle(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedCountry = value!;
                              });
                            },
                            hint: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),

                        SizedBox(height: 15.w),
                        // Phone Number TextField
                        // TextFormField(
                        //   autovalidateMode: AutovalidateMode.onUserInteraction,
                        //
                        //   maxLength: 12,
                        //   controller: phoneController,
                        //   keyboardType: TextInputType.number,
                        //   inputFormatters: [
                        //     FilteringTextInputFormatter.digitsOnly,
                        //     // allows only digits (0-9)
                        //   ],
                        //   validator: (value) {
                        //     if (value == null || value.trim().length < 10) {
                        //       return 'Enter at least 10 digits';
                        //     }
                        //     return null;
                        //   },
                        //   decoration: InputDecoration(
                        //     hintText: 'Phone Number',
                        //     filled: true,
                        //     fillColor: Colors.white,
                        //     contentPadding: EdgeInsets.symmetric(
                        //         horizontal: 5, vertical: 15),
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(12),
                        //       borderSide: BorderSide(color: Colors.blueGrey),
                        //     ),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(12),
                        //       borderSide: BorderSide(color: Colors.blueGrey),
                        //     ),
                        //     focusedBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(12),
                        //       borderSide: BorderSide(
                        //           color: Colorutils.userdetailcolor, width: 2),
                        //     ),
                        //     counterText: '', // This hides the character count
                        //   ),
                        // ),
                        TextFormField(
                          maxLength: 15,
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            // allows only digits (0-9)
                          ],
                          validator: (value) {
                            if (value == null || value.trim().length < 10) {
                              return 'Enter at least 10 digits';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            label: RichText(
                              text: TextSpan(
                                text: "Phone Number",
                                style: TextStyle(
                                  fontSize: 15.h,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' *',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15.h,
                                    ),
                                  ),
                                ],
                              ),
                            ),                                  hintStyle: TextStyle(
                              color: Colors.blueGrey
                          ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color:Colors.grey.withOpacity(0.5)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color:Colors.grey.withOpacity(0.5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: Colorutils.userdetailcolor, width: 2),
                            ),
                            counterText: '', // This hides the character count
                          ),
                        )
                      ],
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

      if (_formKey.currentState!.validate()) {

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
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.only(
                top: 15,
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
            Navigator.push(
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
