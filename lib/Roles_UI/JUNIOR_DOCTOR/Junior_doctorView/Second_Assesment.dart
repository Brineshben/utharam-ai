import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../Controller/EnquiredListController.dart';
import '../../../Controller/GenerateReport_Controller.dart';
import '../../../Service/Api_Service.dart';
import '../../../utils/color_util.dart';
import '../../UI/Common_Widget/connectivity.dart';
import '../../UI/Common_Widget/popups.dart';

class SecondAssesment extends StatefulWidget {

  final String token;
  final String name;
  final int userID;


  const SecondAssesment({
    super.key, required this.token, required this.userID, required this.name,
  });

  @override
  State<SecondAssesment> createState() => _SecondAssesmentState();
}

class _SecondAssesmentState extends State<SecondAssesment> {
  final TextEditingController textcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal.shade50,
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Top App Bar
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50.h,
                            width: 50.h,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              border: Border.all(color: Colors.blue, width: 0.1),
                              borderRadius: BorderRadius.circular(15).r,
                            ),
                            child: const Icon(Icons.arrow_back_ios_sharp, color: Colors.grey),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        SingleChildScrollView(
                          child: Container(
                          width: 300.w,
                            child: Text(
                              "${widget.name.toUpperCase()} Second Assessment",
                              style: GoogleFonts.shanti(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w900,
                                fontSize: 16.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              
              
              
                  // Observation Section
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Therapist Input",
                        style: GoogleFonts.shanti(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w900,
                          fontSize: 18.h,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20.w, top: 5.h, right: 20.w, bottom: 10.h),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: textcontroller,
                      validator: (val) =>
                      val!.trim().isEmpty ? 'Please Enter Therapist Input' : null,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black26),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 20.w,
                        ),
                        hintText: " Enter Therapist Input  ",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)).r,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colorutils.userdetailcolor, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10)).r,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colorutils.userdetailcolor, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)).r,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      maxLines:15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () async {
                        checkInternet2(
                          context: context,
                          function: () async {
                            FocusScope.of(context).unfocus();
              
                            if (_formKey.currentState!.validate()) {
                              context.loaderOverlay.show();
              
                              Map<String, dynamic> resp =
                              await ApiServices.addSecondAssesment(
              
                                  token: widget.token, userID: widget.userID, vaLUE: textcontroller.text);

                              if (resp['status'] == "ok") {
                                await Get.find<EnquiredListController>().enquiryListData(widget.token);
                                context.loaderOverlay.hide();

                                ProductAppPopUps.submit22Back(
                                  title: "Success",
                                  message: "Second Assessment Report is Generated",
                                  actionName: "Close",
                                  iconData: Icons.done,
                                  iconColor: Colors.green,
                                );
                              } else {
                                context.loaderOverlay.hide();

                                ProductAppPopUps.submit(
                                  title: "Error",
                                  message: "Second Assessment Report Generating is Failed",
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
                            'Generate Second Assessment Report',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
