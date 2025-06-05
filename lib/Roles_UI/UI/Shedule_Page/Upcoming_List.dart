import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Controller/SheduleController.dart';
import '../../../utils/color_util.dart';
import '../Common_Widget/DateFormat.dart';

class PatientExpandableCardList extends StatefulWidget {
  final String token;

  const PatientExpandableCardList({super.key, required this.token});
  @override
  State<PatientExpandableCardList> createState() => _PatientExpandableCardListState();
}

class _PatientExpandableCardListState extends State<PatientExpandableCardList> {
  @override
  void initState() {
    Get.find<ScheduleController>().scheduleDataz(widget.token);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        child: GetX<ScheduleController>(
          builder: (ScheduleController controller) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 60.h, bottom: 0.h, left: 20.w, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "PATIENT LIST ",
                        style: GoogleFonts.shanti(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w900,
                          fontSize: 20.h,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18,),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    height: 50.h,
                    decoration: const BoxDecoration(
                        border: Border(),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    width: double.infinity,
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s')), // 👈 Disallows all whitespace
                      ],
                      autofocus: false,
                      onChanged: (value) {
                        Get.find<ScheduleController>().sehduleList(value);
                      },
                      validator: (val) => val!.isEmpty ? 'Enter the Topic' : null,
                      cursorColor: Colors.grey,
                      keyboardType: TextInputType.text,
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
                controller.scheduleList.isEmpty
                    ? Expanded(
                      child: Center(
                          child: Text(
                            "No patient details found",
                            style: TextStyle(
                              fontSize: 16.h,
                              fontStyle: FontStyle.italic,
                              color: Colors.red,
                            ),
                          ),
                        ),
                    )
                    : Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.only(left: 8, right: 8, bottom: 1),
                          itemCount: controller.scheduleList.length,
                          itemBuilder: (context, index) {
                            return Card(
                                color: Colors.white,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 1,
                                child: ExpansionTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide.none),
                                  collapsedShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide.none),
                                  title: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            Colors.white,
                                        child: ClipOval(
                                          child: Image.asset(
                                            "assets/images/profileimage.jpg",
                                            fit: BoxFit.cover,
                                            width: 30,
                                            height: 30,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 250.w,
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "PATIENT: ",
                                                      style: TextStyle(
                                                        fontSize: 13.h,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.blueGrey,
                                                      ),
                                                    ),

                                                    Text(
                                                      controller
                                                              .scheduleList[index]
                                                              ?.patientName
                                                              ?.toUpperCase() ??
                                                          "",
                                                      style: TextStyle(
                                                        fontSize: 13.h,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.blueGrey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 250.w,
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "PATIENT ID: ",
                                                      style: TextStyle(
                                                        fontSize: 12.h,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.blueGrey,
                                                      ),
                                                    ),
                                                    Text(
                                                      controller
                                                              .scheduleList[index]
                                                              ?.patientId
                                                              ?.toUpperCase() ??
                                                          "",
                                                      style: TextStyle(
                                                        fontSize: 12.h,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.blueGrey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 250.w,
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Row(
                                                  children: [
                                                    Text("APPOINMENT DATE: ",
                                                        style: TextStyle(
                                                            fontSize: 12.h,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.blueGrey)),
                                                    Text(
                                                        formatDate(controller
                                                                .scheduleList[
                                                                    index]
                                                                ?.assignedAt ??
                                                            ""),
                                                        style: TextStyle(
                                                            fontSize: 12.h,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.blueGrey)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  children: [
                                    Container(
                                       width:double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colorutils.userdetailcolor
                                            .withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("AI SUMMARY",
                                              style: TextStyle(
                                                  fontSize: 15.h,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.blueGrey)),
                                          SizedBox(height: 10),
                                          Text(
                                            controller
                                                .scheduleList[index]
                                                ?.aiSummary?.patientReport?.patientSummary ??
                                                "No Summary Generated",
                                            style: TextStyle(
                                                fontSize: 15.h,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(height: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "ASSIGNED DOCTOR:  ${controller.scheduleList[index]?.doctorName ?? ""}",
                                                  style: TextStyle(
                                                      fontSize: 14.h,
                                                      fontWeight: FontWeight.w800,
                                                      color: Colors.green)),
                                              Text(
                                                  "SESSION:  ${formatDate(controller.scheduleList[index]?.assignedAt ?? "")}",
                                                  style: TextStyle(
                                                      fontSize: 14.h,
                                                      fontWeight: FontWeight.w800,
                                                      color: Colors.green)),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Text("DOCTOR OBSERVATION",
                                              style: TextStyle(
                                                  fontSize: 15.h,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.blueGrey)),
                                          SizedBox(height: 10),
                                          Text(
                                            controller.scheduleList[index]
                                                    ?.observations ??
                                                "NO OBSERVATION ADDED",
                                            style: TextStyle(
                                                fontSize: 14.h,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),

                                    ),
                                  ],
                                ));
                          },
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
