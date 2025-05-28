import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../Controller/Doctor_List_Controller.dart';
import '../../../Service/Api_Service.dart';
import '../../../utils/color_util.dart';
import '../../UI/Common_Widget/connectivity.dart';
import '../../UI/Common_Widget/popups.dart';
import '../../UI/Register_Page/Register.dart';

class AddDoctor extends StatefulWidget {
  final String token;

  const AddDoctor({
    super.key,
    required this.token,
  });

  @override
  State<AddDoctor> createState() => _AddDoctorState();
}

class _AddDoctorState extends State<AddDoctor> {
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
  TextEditingController name = TextEditingController();
  TextEditingController dropdownController = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController education = TextEditingController();
  bool _obscureText1 = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Text
                SizedBox(
                  height: 30,
                ),

                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15.w),
                      child: Text(
                        'ADD DOCTOR',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 18.h,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Icon(Icons.person_add,color: Colorutils.userdetailcolor,),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.w),
                  child: Text(
                    'Please Enter Doctor Details',
                    style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 12.h,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                buildTextField2("Name", "assets/images/user.svg", false,
                    name, true, _formKey, false),
                buildTextField2("Username", "assets/images/user.svg",
                    false, username, true, _formKey, false),
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

                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14,right: 14,bottom: 8,top: 8),
                        child: Row(
                          children: [
                            // Country Code Dropdown
                            Container(
                              width: 150.w,
                              // Set a smaller width
                              padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                              // Add slight vertical padding too
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.withOpacity(0.5)),
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
                                  hintStyle: TextStyle(
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    
                    
                    // Expanded(
                    //   child: buildTextField2("Phone Number", "assets/images/phone-call.svg",
                    //       false, phoneNumber, true, _formKey, true),
                    // ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: buildTextField22(
                          "Age",
                          "assets/images/age.svg",
                          false,
                          age,
                          true,
                          _formKey),
                    ),
                    Expanded(
                      child: buildTextFieldDropdown(
                        'Gender',
                        'assets/images/venus.svg',
                        // 'assets/icons/gender.svg',
                        false,
                        gender,
                        true,
                        dropdownOptions: [
                          'Male',
                          'Female',
                        ],
                      ),
                    ),
                    // Expanded(
                    //   child: buildTextField("Gender",
                    //       "assets/images/venus.svg", false, gender, false),
                    // ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: buildTextField2(
                          "Education",
                          "assets/images/graduation-cap.svg",
                          false,
                          education,
                          false,
                          _formKey,
                          false),
                    ),
                    Expanded(
                      child: buildTextField2(
                          "Occupation",
                          "assets/images/briefcase-blank.svg",
                          false,
                          occupation,
                          false,
                          _formKey,
                          false),
                    ),
                  ],
                ),
                buildTextFieldDropdown(
                  'Select Role',
                  'assets/images/user.svg',
                  false,
                  dropdownController,
                  true,
                  dropdownOptions: [
                    'psychiatrist',
                    'junior_psychologist',
                    'senior_psychologist',
                  ],
                ),
                buildTextField2("Address", "assets/images/address-book.svg",
                    false, address, true, _formKey, false),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
                  child: TextFormField(
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
                              color: Colorutils.userdetailcolor, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.3)),
                        ),
                        prefixIcon: Icon(Icons.lock_outline_rounded,
                            color: Colors.blueGrey),
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.3)),
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
                SizedBox(
                  height: 40,
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30).w,
                  child: GestureDetector(
                    onTap: () async {
                      checkInternet2(
                        context: context,
                        function: () async {
                          FocusScope.of(context).unfocus();
                          String selectedCode = selectedCountry.substring(
                              selectedCountry.indexOf('(') + 1, selectedCountry.indexOf(')'));

                          String fullPhoneNumber =
                              '$selectedCode${phoneController.text.trim()}';

                          print('Phone Number: $fullPhoneNumber');

                          if (_formKey.currentState!.validate()) {
                            context.loaderOverlay.show();

                            Map<String, dynamic> resp =
                                await ApiServices.doctorRegister(
                                    name: name.text,
                                    userName: username.text,
                                    email: email.text,
                                    mobileNumber: fullPhoneNumber,
                                    password: password.text,
                                    age: age.text,
                                    gender: gender.text,
                                    occupation: occupation.text,
                                    address: address.text,
                                    education: education.text,
                                    role: dropdownController.text,
                                    token: widget.token);
                            context.loaderOverlay.hide();

                            if (resp['status'] == "ok") {
                              Get.find<DoctorListController>().doctorListData(widget.token);

                              ProductAppPopUps.submit2Back(
                                title: "Success",
                                message: resp['message'],
                                actionName: "Close",
                                iconData: Icons.done,
                                iconColor: Colors.green,
                              );
                            } else {
                              ProductAppPopUps.submit(
                                title: "Error",
                                message: resp['message'],
                                actionName: "Close",
                                iconData: Icons.error_outline_outlined,
                                iconColor: Colors.red,
                              );
                            }
                          }
                        },
                      );
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
                          'ADD DOCTOR',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  height: 40,
                ),
                // Doctor List View
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildTextFieldDropdown(
  String hintText,
  String svgAssetPath,
  bool isPassword,
  TextEditingController controller,
  bool validation, {
  List<String>? dropdownOptions, // Optional dropdown list
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, top:0, bottom: 0),
    child: dropdownOptions != null && dropdownOptions.isNotEmpty
        ? DropdownButtonFormField<String>(
            validator: validation
                ? (val) => val == null || val.trim().isEmpty
                    ? 'Please select $hintText'
                    : null
                : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,

      decoration: InputDecoration(
              hintText: hintText,
              labelText: hintText,

              labelStyle: TextStyle(
                fontSize: 15.h,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Colorutils.userdetailcolor, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SvgPicture.asset(
                  svgAssetPath,
                  width: 8.w,
                  height: 8.h,
                  color: Colors.blueGrey,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colorutils.userdetailcolor),
              ),
            ),
            value: controller.text.isNotEmpty ? controller.text : null,
            items: dropdownOptions.map((option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (value) {
              controller.text = value!;
            },
          )
        : TextFormField(
            validator: validation
                ? (val) => val!.trim().isEmpty ? 'Please enter $hintText' : null
                : null,
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hintText,
              labelText: hintText,
              labelStyle: TextStyle(
                fontSize: 15.h,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Colorutils.userdetailcolor, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SvgPicture.asset(
                  svgAssetPath,
                  width: 10.w,
                  height: 10.h,
                  color: Colors.blueGrey,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colorutils.userdetailcolor),
              ),
            ),
          ),
  );
}
