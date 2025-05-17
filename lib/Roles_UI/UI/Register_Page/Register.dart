import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient/Service/Api_Service.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../utils/color_util.dart';
import '../../JUNIOR_DOCTOR/Junior_doctorView/Add_Doctor.dart';
import '../ChatScreen/Chat.dart';
import '../Common_Widget/connectivity.dart';
import '../Common_Widget/popups.dart';
import '../Login_Page/login.dart';
import 'OTP_page.dart';

class Register extends StatefulWidget {
  final String phoneNumbers;
  const Register({super.key, required this.phoneNumbers});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
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
  bool _obscureText2 = true;
  final _formKey = GlobalKey<FormState>();
@override
  void initState() {
  phoneNumber = TextEditingController(text: widget.phoneNumbers);

  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
          child: Stack(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h),
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
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15.w),
                          child: Text(
                            'CREATE ACCOUNT',
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
                    buildTextField("Email", "assets/images/envelope.svg", false,
                        email, true),buildTextFieldReadonly("Phone Number", "assets/images/phone-call.svg", false,
                        phoneNumber, true),
                    // buildTextFieldPhone(
                    //     "Phone Number",
                    //     "assets/images/phone-call.svg",
                    //     false,
                    //     phoneNumber,
                    //     true),
                    Row(
                      children: [
                        Expanded(
                          child: buildTextField("Age", "assets/images/age.svg",
                              false, age, false),
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
                    buildTextField("Address", "assets/images/address-book.svg",
                        false, address, false),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 8),
                      child: TextFormField(
                        validator: (val) => val!.trim().isEmpty
                            ? 'Please Enter Password.'
                            : null,
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
                        validator: (val) => val!.trim().isEmpty
                            ? 'Please Enter Confirm Password.'
                            : null,
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
                                  color: Colorutils.userdetailcolor, width: 1),
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
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30).w,
                      child: GestureDetector(
                        onTap: () async {
                          // Navigator.pushReplacement(context,
                          //     MaterialPageRoute(
                          //       builder: (context) {
                          //         return LoginPage();
                          //       },
                          //     ));
                          checkInternet2(
                            context: context,
                            function: () async {
                              FocusScope.of(context).unfocus();

                              if (_formKey.currentState!.validate()) {
                                context.loaderOverlay.show();

                                Map<String, dynamic> resp =
                                    await ApiServices.patientRegister(

                                        name: name.text,
                                        userName: username.text,
                                        email: email.text,
                                        mobileNumber: phoneNumber.text,
                                        password: password.text,
                                        confirmPassword: confirmPassword.text,
                                        age: age.text,
                                        gender: gender.text,
                                        occupation: occupation.text,
                                        address: address.text,
                                        education: education.text);
                                context.loaderOverlay.hide();

                                // resp['data']['message'] == "Leave Applied Successfully"
                                if (resp['status'] == "ok") {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
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
                              'REGISTER',
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
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

// Widget buildTextField(String hintText, String svgAssetPath, bool isPassword,
//     TextEditingController controller, bool validation) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 15, right: 15, top: 4, bottom: 4),
//     child: TextFormField(
//       validator: validation
//           ? (val) => val!.trim().isEmpty ? 'Please enter $hintText' : null
//           : null,
//       controller: controller,
//       obscureText: isPassword,
//       decoration: InputDecoration(
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
//         ),
//         prefixIcon: Padding(
//           padding: const EdgeInsets.all(14.0), // Adjust padding as needed
//           child: SvgPicture.asset(
//             svgAssetPath,
//             width: 10.w,
//             height: 10.h,
//             color: Colors.grey,
//           ),
//         ),
//         hintText: hintText,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: Colorutils.userdetailcolor),
//         ),
//       ),
//     ),
//   );
// }
Widget buildTextField(String hintText, String svgAssetPath, bool isPassword,
    TextEditingController controller, bool validation) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, top: 4, bottom: 4),
    child: TextFormField(
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
          borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14.0), // Adjust padding as needed
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
Widget buildTextFieldReadonly(String hintText, String svgAssetPath, bool isPassword,
    TextEditingController controller, bool validation) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, top: 4, bottom: 4),
    child: TextFormField(
      readOnly: true,
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
          borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14.0), // Adjust padding as needed
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


Widget buildTextFieldPhone(String hintText, String svgAssetPath, bool isPassword,
    TextEditingController controller, bool validation) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, top: 4, bottom: 4),
    child: TextFormField(
      enabled: false,
      maxLength: 10,
      keyboardType: TextInputType.number,
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
          borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14.0), // Adjust padding as needed
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
