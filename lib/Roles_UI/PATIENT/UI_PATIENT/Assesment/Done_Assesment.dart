import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../Controller/Assignement_Controller/PatientAssesMentLIst_Controller.dart';
import '../../../../Service/Api_Service.dart';
import '../../../../utils/color_util.dart';
import '../../../UI/Common_Widget/Patient_cards.dart';
import '../../../UI/Common_Widget/popups.dart';

class DoneAssesment extends StatefulWidget {
  final String token;
  final int thoughtID;
  final int patientID;
  final String name;
  final String dataSubmited;
  final String patientId;
  final String questionText;
  final String phone;
  const DoneAssesment({super.key, required this.name, required this.patientId,required this.questionText, required this.token, required this.phone, required this.thoughtID, required this.dataSubmited, required this.patientID,});

  @override
  State<DoneAssesment> createState() => _DoneAssesmentState();
}

class _DoneAssesmentState extends State<DoneAssesment> {
  late TextEditingController controller;
  TextEditingController replyController = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.questionText);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
          height: double.infinity,
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
          child: SingleChildScrollView(
              child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 48.h, bottom: 5.h, left: 20.w, right: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 50,
                              width: 50.h,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  border: Border.all(
                                    color: Colors.blue, // Border color
                                    width: 0.1, // Border width
                                  ),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.grey.withOpacity(0.3),
                                  //     blurRadius: 1,
                                  //     spreadRadius: 0,
                                  //   ),
                                  // ],
                                  borderRadius: BorderRadius.circular(15).r),
                              child: Icon(
                                Icons.arrow_back_ios_sharp,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "ASSIGNMENT",
                              style: GoogleFonts.shanti(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w900,
                                fontSize: 20.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    PatientCardAssignemnt(

                      patientId: widget.patientId,
                      name: widget.name,
                      phone: widget.phone,

                    ),

                    Padding(
                      padding:
                      EdgeInsets.only(top: 10.h, left: 20.w, right: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Assignment",
                            style: GoogleFonts.shanti(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w900,
                              fontSize: 18.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        top: 5.h,
                        right: 20.w,
                        bottom: 5.h,
                      ),
                      child: TextFormField(
                        readOnly: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller,
                        validator: (val) => val!.trim().isEmpty
                            ? 'Please Enter Observation.'
                            : null,
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.black26),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 20.w),
                            hintText: " Enter Observation   ",
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ).r,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colorutils.userdetailcolor, width: 1.0),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10)).r,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colorutils.userdetailcolor, width: 1.0),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)).r,
                            ),
                            fillColor: Colors.white,
                            filled: true),
                      ),
                    ), Padding(
                      padding:
                      EdgeInsets.only(top: 10.h, left: 20.w, right: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Reply",
                            style: GoogleFonts.shanti(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w900,
                              fontSize: 18.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        top: 5.h,
                        right: 20.w,
                        bottom: 5.h,
                      ),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: replyController,
                        validator: (val) => val!.trim().isEmpty
                            ? 'Please Enter Observation.'
                            : null,
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.black26),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 20.w),
                            hintText: " Enter Observation   ",
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ).r,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colorutils.userdetailcolor, width: 1.0),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10)).r,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colorutils.userdetailcolor, width: 1.0),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)).r,
                            ),
                            fillColor: Colors.white,
                            filled: true),
                        maxLines: 5,
                      ),
                    ),
                  ]
              ))
      ),

      bottomNavigationBar: Container(
        height: 70.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          gradient: LinearGradient(
            colors: [Colors.teal.shade50, Colors.white],
            // Adjust colors to match your design
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.teal.withOpacity(0.3),
              blurRadius: 0.1,
              spreadRadius: 0.1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: GestureDetector(
              onTap: () async {
                context.loaderOverlay.show();
                Map<String,dynamic> resp = await ApiServices.Editassignment( token: widget.token, thoughtsID:widget.thoughtID, response: replyController.text);
                if (resp['status'] == "Ok") {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => OtpScreen(
                  //       phoneNumber: fullPhoneNumber,
                  //     ),
                  //   ),
                  // );
                  await Get.find<PatientAssignmentController>().patientAssesmentListDataz(widget.token,widget.patientID);
                  context.loaderOverlay.hide();

                  ProductAppPopUps.submit2Back(
                    title: "Success",
                    message: resp['message'] ?? 'Something went wrong.',
                    actionName: "Close",
                    iconData: Icons.done,
                    iconColor: Colorutils.userdetailcolor,
                  );

                } else {
                  ProductAppPopUps.submit(
                    title: "Failed",
                    message:'Something went wrong.',
                    actionName: "Close",
                    iconData: Icons.error_outline,
                    iconColor: Colors.red,
                  );
                }            },
              child: Container(
                width: 180.w,
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(
                    color: Colorutils.userdetailcolor,
                    width: 0.8,
                  ),
                ),
                // width: 250.w,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'SUBMIT ASSIGNMENT',
                        style: GoogleFonts.inter(
                          fontSize: 14.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

    );





  }
}
