import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient/utils/color_util.dart';

import '../../../Controller/Doctor_List_Controller.dart';
import '../../../Controller/PatientListController.dart';
import '../../CHIEF_DOCTOR/bottom_Navigation_Chief.dart';
import '../../UI/DoctorListSenior/doctorListSenior.dart';
import '../Junior_doctorView/EnquiryList_Page.dart';
import 'Re-Assign.dart';
import 'appointmentPage.dart';

class PatientList extends StatefulWidget {
  final String token;

  const PatientList({
    super.key,
    required this.token,
  });

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  void initState() {
    super.initState();
    Get.find<PatientListController>().PatientListData();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: Text(
                    "MAKE NEW APPOINTMENT ",
                    style: GoogleFonts.shanti(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w900,
                      fontSize: 20.h,
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 50, left: 20,right: 20),
                //   child: GestureDetector(
                //     onTap: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => AddDoctor(
                //               token: widget.token,
                //             ),
                //           ));
                //     },
                //     child: Container(
                //       height: 40.h,
                //       width: 110.w,
                //       decoration: BoxDecoration(
                //           color: Colorutils.userdetailcolor,
                //           borderRadius: BorderRadius.circular(10)),
                //       child: Center(
                //           child: Text(
                //             "ADD DOCTOR",
                //             style: TextStyle(color: Colors.white, fontSize: 14.h),
                //           )),
                //     ),
                //   ),
                // )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            // Doctor List View
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 50.h,
                decoration: const BoxDecoration(
                    border: Border(),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                width: double.infinity,
                child: TextFormField(
                  autofocus: false,
                  onChanged: (value) {
                    Get.find<PatientListController>().SearchPatientList(value);
                  },
                  validator: (val) => val!.isEmpty ? 'Enter the Topic' : null,
                  cursorColor: Colors.grey,
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    // 👈 Disallows all whitespace
                  ],
                  decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.grey),
                      hintText: "Search Patients",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: 25,
                            width: 25,
                            child: SvgPicture.asset(
                              "assets/images/MagnifyingGlass.svg",
                              color: Colorutils.userdetailcolor,
                            )),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(2.0),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colorutils.userdetailcolor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colorutils.userdetailcolor, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
            ),

            Expanded(
              child: GetX<PatientListController>(
                builder: (PatientListController controller) {
                  if (controller.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colorutils.userdetailcolor,
                      ),
                    );
                  }
                  if (controller.PatientList.isEmpty) {
                    return Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Center(
                          child: const Text(
                            "No Patient Data Found.",

                            style: TextStyle(
                                color: Colors.red, fontStyle: FontStyle.italic),
                          ),
                        ));
                  } else {
                    return ListView.builder(
                      // separatorBuilder: (context, index) => Divider(),
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      // Disable scrolling
                      itemCount: controller.PatientList.length,
                      itemBuilder: (context, index) {
                        final patientData = controller.PatientList[index];
                        return GestureDetector(
                          child: ListTile(
                            leading: ClipOval(
                              child: Image.asset(
                                "assets/images/profileimage.jpg",
                                fit: BoxFit.cover,
                                width: 30,
                                height: 30,
                              ),
                            ),
                            title: Text(
                              "${patientData?.patient?.name?.toUpperCase() ?? "No Name"}",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15.h,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ASSIGNED DOCTOR : ${patientData?.doctor?.name?.toUpperCase() ?? "No Name"}",
                                  style: TextStyle(
                                    fontSize: 12.h,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      child: buildTag(
                                          "MAKE APPOINTMENT", Colors.blue),
                                      onTap: () {
                                        final patientSummary = (patientData
                                                    ?.patientDiagnosis
                                                    ?.isNotEmpty ??
                                                false)
                                            ? patientData
                                                ?.patientDiagnosis
                                                ?.first
                                                .aiReport
                                                ?.patientReport
                                                ?.patientSummary
                                            : 'No diagnosis summary available';
                                        final severity = (patientData
                                                    ?.patientDiagnosis
                                                    ?.isNotEmpty ??
                                                false)
                                            ? (patientData!
                                                    .patientDiagnosis!
                                                    .first
                                                    .aiReport
                                                    ?.therapistReport
                                                    ?.severity ??
                                                "")
                                            : '---';
                                        final url = (patientData
                                                    ?.patientDiagnosis
                                                    ?.isNotEmpty ??
                                                false)
                                            ? patientData?.patientDiagnosis
                                                ?.last.aiSummaryFile
                                            : 'No Ai Summary File Generated yet';
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AppointmentPage(
                                              name:
                                                  patientData?.patient?.name ??
                                                      " ",
                                              age: (patientData?.patient?.age
                                                      ?.toString()) ??
                                                  "0",
                                              gender: patientData
                                                      ?.patient?.gender ??
                                                  " ",
                                              email:
                                                  patientData?.patient?.email ??
                                                      " ",
                                              phone: patientData
                                                      ?.patient?.mobileNumber ??
                                                  " ",
                                              disease: patientData
                                                      ?.patient?.chatEnabled ??
                                                  false,
                                              severity: severity ??
                                                  "No severity info available",
                                              diagnosissummary: patientSummary ??
                                                  "No diagnosis summary available",
                                              patientId: patientData
                                                      ?.patient?.patientId ??
                                                  " ",
                                              token: widget.token,
                                              id: patientData?.patient?.id ?? 0,
                                              url: url ??
                                                  "No File Generated yet ",
                                              doctorName:
                                                  patientData?.doctor?.name ??
                                                      " ",
                                              doctorId:
                                                  patientData?.doctor?.id ?? 0,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      child: buildTag(
                                          "Re-Assign Doctor", Colors.green),
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return Reassign(
                                              token: widget.token,
                                              doctorName:
                                                  patientData?.doctor?.name ??
                                                      "",
                                              patientId:
                                                  patientData?.patient?.id ?? 0,
                                              assignmentId:
                                                  patientData?.id ?? 0,
                                              doctorId:
                                                  patientData?.doctor?.id ?? 0,
                                            );
                                          },
                                        ));
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                            // trailing: Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: [
                            //       Icon(Icons.arrow_forward_ios,
                            //           size: 20.w, color: Colors.blueGrey),
                            //
                            //   ],
                            // ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
