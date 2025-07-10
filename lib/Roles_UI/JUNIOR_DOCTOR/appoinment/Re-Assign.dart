import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../Controller/Consult_Doctor_Controller.dart';
import '../../../Controller/PatientListController.dart';
import '../../../Model/Consult_Doctor_Model.dart';
import '../../../Service/Api_Service.dart';
import '../../../utils/color_util.dart';
import '../../UI/Common_Widget/popups.dart';
import '../../UI/DoctorListSenior/doctorListSenior.dart';

class Reassign extends StatefulWidget {
  final int patientId;
  final int doctorId;
  final int assignmentId;
  final String token;
  final String doctorName;

  const Reassign({
    super.key,
    required this.token,
    required this.doctorName, required this.patientId, required this.assignmentId, required this.doctorId,
  });

  @override
  State<Reassign> createState() => _ReassignState();
}

class _ReassignState extends State<Reassign> {
  Users? data;

  void _showDoctorBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // Important for resizing
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        final screenHeight = MediaQuery.of(context).size.height;
        return SizedBox(
          height: screenHeight * 0.8, // 80% of screen height

          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                // Drag Handle
                Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "DOCTOR LIST",
                        style: GoogleFonts.shanti(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w900,
                          fontSize: 20.h,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    height: 50.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    width: double.infinity,
                    child: TextFormField(
                      onChanged: (value) {
                        Get.find<ConsultDoctorListController>()
                            .SearchDoctorList(value);
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s')), // Disallow spaces
                      ],
                      validator: (val) =>
                      val!.isEmpty ? 'Enter the Topic' : null,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: "Search Doctors",
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: SvgPicture.asset(
                              "assets/images/MagnifyingGlass.svg",
                              color: Colorutils.userdetailcolor,
                            ),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 25.0,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colorutils.userdetailcolor),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(25)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colorutils.userdetailcolor,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                // Doctor List
                GetX<ConsultDoctorListController>(
                  builder: (controller) {
                    if (controller.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colorutils.userdetailcolor,
                        ),
                      );
                    }
                    if (controller.consultDoctorList.isEmpty) {
                      return Center(
                        child: const Text(
                          "No Doctor Found.",
                          style: TextStyle(
                              color: Colors.red, fontStyle: FontStyle.italic),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.consultDoctorList.length,
                        itemBuilder: (context, index) {
                          final doctor = controller.consultDoctorList[index];
                          return ListTile(
                            leading: ClipOval(
                              child: Image.asset(
                                "assets/images/profileimage.jpg",
                                fit: BoxFit.cover,
                                width: 35.w,
                                height: 35.w,
                              ),
                            ),
                            title: Text(
                              doctor?.name?.toUpperCase() ?? "",
                              style:  TextStyle(
                                fontSize: 15.h,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              formatString(doctor?.role ?? "No Role"),

                              style:  TextStyle(
                                fontSize: 13.h,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () async {
                              setState(() {
                                data = doctor;
                              });
                              // await Get.find<DoctorToPatientController>()
                              //     .doctorToPatientData(
                              //     widget.token, doctor?.id ?? 0, widget.id);
                              Navigator.of(context)
                                  .pop(); // Dismisses the BottomSheet
                            },
                          );
                        },
                      );
                    }
                  },
                ),
                const SizedBox(height: 20), // Optional space at bottom
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Title
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  "RE-ASSIGN DOCTOR",
                  style: GoogleFonts.shanti(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w900,
                    fontSize: 22.sp,
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              // Doctor InCharge Label
              Text(
                "Doctor InCharge",
                style: GoogleFonts.shanti(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w900,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 10.h),

              // Doctor Selection Container
              GestureDetector(
                onTap: () {
                  // Handle doctor reassignment logic here
                },
                child: Container(
                  height: 55.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colorutils.userdetailcolor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        widget.doctorName.toUpperCase(),
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Assign New Doctor",
                style: GoogleFonts.shanti(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w900,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding:
                const EdgeInsets.only(left: 1, right: 1, top: 10),
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colorutils.userdetailcolor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    height: 55.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: Text(
                                'Recommend Specialists: ${data?.name?.toUpperCase() ?? "Select Doctor"}',
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 16.h,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.find<ConsultDoctorListController>()
                        .ConsultdoctorListData(widget.token);

                    _showDoctorBottomSheet(context);
                  },
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 85.h,
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
                print("wefergegerger${ widget.doctorId}");
                context.loaderOverlay.show();
                Map<String,dynamic> resp = await ApiServices.reAssign(patientId: widget.patientId, assignmentId: widget.assignmentId, doctorId:data?.id ?? 0 );
                if (resp['status'] == "ok") {

                  await  Get.find<PatientListController>().PatientListData();

                  context.loaderOverlay.hide();

                  ProductAppPopUps.submit22Back(
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
                        'RE-ASSIGN DOCTOR',
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
