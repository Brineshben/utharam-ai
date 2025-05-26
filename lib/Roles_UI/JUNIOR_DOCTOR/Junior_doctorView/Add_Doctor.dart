import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                    'Please Enter Your Details',
                    style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 12.h,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                buildTextField(
                    "Name", "assets/images/user.svg", false, name, true),
                buildTextField("Username", "assets/images/user.svg", false,
                    username, true),
                buildTextField(
                    "Email", "assets/images/envelope.svg", false, email, true),
                buildTextField("Phone Number", "assets/images/phone-call.svg",
                    false, phoneNumber, true),
                Row(
                  children: [
                    Expanded(
                      child: buildTextField(
                          "Age", "assets/images/age.svg", false, age, false),
                    ),
                    Expanded(
                      child: buildTextFieldDropdown(
                        'Gender',
                        'assets/icons/gender.svg',
                        false,
                        gender,
                        true,
                        dropdownOptions: [
                          'male',
                          'female',
                        ],
                      ),
                    )

                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: buildTextField(
                          "Education",
                          "assets/images/graduation-cap.svg",
                          false,
                          education,
                          false),
                    ),
                    Expanded(
                      child: buildTextField(
                          "Occupation",
                          "assets/images/briefcase-blank.svg",
                          false,
                          occupation,
                          false),
                    ),
                  ],
                ),
                buildTextFieldDropdown(
                  'Select Role',
                  'assets/icons/gender.svg',
                  false,
                  dropdownController,
                  true,
                  dropdownOptions: [
                    'psychiatrist',
                    'junior_psychologist',
                    'senior_psychologist',
                  ],
                ),
                buildTextField("Address", "assets/images/address-book.svg",
                    false, address, false),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
                  child: TextFormField(
                    validator: (val) =>
                        val!.trim().isEmpty ? 'Please Enter Password.' : null,
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

                          if (_formKey.currentState!.validate()) {
                            context.loaderOverlay.show();

                            Map<String, dynamic> resp =
                                await ApiServices.doctorRegister(
                                    name: name.text,
                                    userName: username.text,
                                    email: email.text,
                                    mobileNumber: phoneNumber.text,
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
                          } else {
                            ProductAppPopUps.submit(
                              title: "Error",
                              message: "Something went wrong",
                              actionName: "Close",
                              iconData: Icons.error_outline_outlined,
                              iconColor: Colors.red,
                            );
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
                padding: const EdgeInsets.all(13.0),
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
