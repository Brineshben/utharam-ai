import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Controller/Consult_Doctor_Controller.dart';
import '../../../Controller/DoctorToPatientController.dart';
import '../../../Controller/EnquiredListController.dart';
import '../../../Controller/JuniorDashoard_Controller.dart';
import '../../../Controller/Patient_queue_Controller.dart';
import '../../../Controller/Slottopateient_Controller.dart';
import '../../../Model/Consult_Doctor_Model.dart';
import '../../../Service/Api_Service.dart';
import '../../../utils/color_util.dart';
import '../../UI/Common_Widget/Patient_cards.dart';
import '../../UI/Common_Widget/pdfview.dart';
import '../../UI/Common_Widget/popups.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../UI/DoctorListSenior/doctorListSenior.dart';

class PatientDetails extends StatefulWidget {
  final String name;
  final String url;
  final String token;
  final String patientId;
  final int id;
  final dynamic age;
  final String gender;
  final String email;
  final String phone;
  final bool disease;
  final dynamic severity;
  final String diagnosissummary;

  const PatientDetails(
      {Key? key,
      required this.name,
      required this.age,
      required this.gender,
      required this.email,
      required this.phone,
      required this.disease,
      required this.severity,
      required this.diagnosissummary,
      required this.patientId,
      required this.token,
      required this.id,
      required this.url})
      : super(key: key);

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  late bool isSwitched;

  @override
  void initState() {
  isSwitched = widget.disease;
  super.initState();
  }
  void toggleSwitch(bool value, int patientId) async {
    setState(() {
      isSwitched = !isSwitched;
    });

    try {
      if (value== true) {
        context.loaderOverlay.show();
        final response = await ApiServices.enableChat(patientId: patientId);
        context.loaderOverlay.hide();
        print('Enable Chat Response: $response');

        if (response['status'] == true) {
          Get.find<EnquiredListController>().enquiryListData(widget.token);
          Get.find<PatientQueueController>().patientData(widget.token);

          ProductAppPopUps.submit(
            title: "Success",
            message: "Chat Functionality Enabled",
            actionName: "Close",
            iconData: Icons.done,
            iconColor: Colors.green,
          );
        }
      } else {
        context.loaderOverlay.show();
        final response = await ApiServices.disableChat(patientId: patientId);
        context.loaderOverlay.hide();
        print('Enable Chat Response: $response');

        if (response['status'] == true) {
          Get.find<EnquiredListController>().enquiryListData(widget.token);
          Get.find<PatientQueueController>().patientData(widget.token);

          ProductAppPopUps.submit(
            title: "Success",
            message: "Chat Functionality Disabled",
            actionName: "Close",
            iconData: Icons.done,
            iconColor: Colors.green,
          );
        }      }
    } catch (e) {
      print('Error in toggleSwitch API call: $e');
    }
  }

  Users? data;
  var fromDate = 'YYYY-MM-DD';
  DateTime? pickedFrom;
  int? selectedIndex;

  final DateFormat _examformatter = DateFormat('yyyy-MM-dd');

  final TextEditingController doctorNameController = TextEditingController();

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

  Future<void> _selectFromDate(BuildContext context) async {
    pickedFrom = await showDatePicker(
      context: context,

      initialDate: DateTime.now(),
      firstDate: DateTime.now(),

      // lastDate: new DateTime(2025),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    setState(() {
      fromDate = _examformatter.format(pickedFrom!);
    });
    print(fromDate);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                          "PATIENT DETAILS",
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
                PatientCard(
                  email: widget.email,
                  age: widget.age.toString(),
                  patientId: widget.patientId,
                  name: widget.name,
                  phone: widget.phone,
                  sevirity: widget.severity.toString(),
                ),

                Padding(
                  padding: EdgeInsets.only(
                      top: 5.h, bottom: 5.h, left: 20.w, right: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "AI Diagnosis Report",
                        style: GoogleFonts.shanti(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w900,
                          fontSize: 18.h,
                        ),
                      ),
                    ],
                  ),
                ),
                AiReport(
                  summary: widget.diagnosissummary,
                  details: "details",
                  repoturl: widget.url,
                  name: widget.name,
                ),
                // widget.disease == false
                //     ?
                Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 10.w),
                        child: Row(
                          children: [
                            Text(
                              "Enable Secondary Chat".toUpperCase(),
                              style: GoogleFonts.shanti(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w900,
                                fontSize: 18.h,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                print("------value----$value");
                                toggleSwitch(value, widget.id);
                              },
                              inactiveTrackColor: Colors.grey.withOpacity(0.2),
                              activeColor: Colorutils.userdetailcolor,
                              inactiveThumbColor: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    // : Padding(
                    //     padding: EdgeInsets.only(left: 20.w, right: 10.w),
                    //     child: Row(
                    //       children: [
                    //         Text(
                    //           "SECONDARY CHAT ENABLED".toUpperCase(),
                    //           style: GoogleFonts.shanti(
                    //             color: Colors.blueGrey,
                    //             fontWeight: FontWeight.w900,
                    //             fontSize: 18.h,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 5.h, bottom: 5.h, left: 20.w, right: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Doctor",
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
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
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
                          print("wsjhdwefhgyewugyeugy${widget.id}");
                          Get.find<ConsultDoctorListController>()
                              .ConsultdoctorListData(widget.token);

                          _showDoctorBottomSheet(context);
                        },
                      ),
                    ),
                  ],
                ),
                (data?.name == null || data?.name == " ")
                    ? SizedBox()
                    : Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 20.w, right: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Select Date",
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
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 10),
                            child: GestureDetector(
                              onTap: () async {
                                await _selectFromDate(context);

                                await Get.find<SlottopateientController>()
                                    .slotToPatientData(widget.token,
                                        data?.name ?? "", fromDate);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: Colorutils.userdetailcolor,
                                    width: 0.8,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('DATE : $fromDate',
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.blueGrey)),
                                      IconButton(
                                        icon: Icon(
                                          Icons.calendar_month,
                                          color: Colorutils.userdetailcolor,
                                          size: 20,
                                        ),
                                        onPressed: () async {
                                          await _selectFromDate(context);

                                          await Get.find<
                                                  SlottopateientController>()
                                              .slotToPatientData(widget.token,
                                                  data?.name ?? "", fromDate);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                fromDate != 'YYYY-MM-DD'
                    ? GetX<SlottopateientController>(
                        builder: (SlottopateientController controller) {
                        if (controller.isLoading.value) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: SizedBox(
                                height: 30.h, // Set your desired height
                                width: 30.w, // Set your desired width
                                child: CircularProgressIndicator(
                                  color: Colorutils.userdetailcolor,
                                  strokeWidth: 4, // Optional: adjust thickness
                                ),
                              ),
                            ),
                          );
                        }
                        if (controller.slotToPatientList.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Center(
                                child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: const Text(
                                "No Slot Available for particular doctor on particular date",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontStyle: FontStyle.italic),
                              ),
                            )),
                          );
                        } else {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 10.h, left: 20.w, right: 10.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Please Select Slot",
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
                                  padding: const EdgeInsets.all(16.0),
                                  child: Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: List.generate(
                                      controller.slotToPatientList.length,
                                      (index) => GestureDetector(
                                        onTap: () {
                                          print(selectedIndex);
                                          setState(() {
                                            selectedIndex = index;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 10,
                                              right: 10),
                                          decoration: BoxDecoration(
                                            color: selectedIndex == index
                                                ? Colors
                                                    .blue // Highlighted color
                                                : Colors.blue.shade100,
                                            // Normal color
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            "${controller.slotToPatientList[index]?.fromTime ?? ""}-${controller.slotToPatientList[index]?.toTime ?? ""}",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: selectedIndex == index
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          );
                        }
                      })
                    : SizedBox()

                // Padding(
                //   padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 10.w),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Add Observation",
                //         style: GoogleFonts.shanti(
                //           color: Colors.blueGrey,
                //           fontWeight: FontWeight.w900,
                //           fontSize: 18.h,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(
                //     left: 20.w,
                //     top: 5.h,
                //     right: 20.w,
                //     bottom: 5.h,
                //   ),
                //   child: TextFormField(
                //     autovalidateMode: AutovalidateMode.onUserInteraction,
                //
                //     maxLength: 100,
                //     // controller: _Remarkscontroller,
                //     validator: (val) => val!.trim().isEmpty
                //         ? 'Please Enter Observation.'
                //         : null,
                //     decoration: InputDecoration(
                //         hintStyle: const TextStyle(color: Colors.black26),
                //         contentPadding: EdgeInsets.symmetric(
                //             vertical: 10.h, horizontal: 20.w),
                //         hintText: " Enter Observation   ",
                //         border: OutlineInputBorder(
                //           borderRadius: const BorderRadius.all(
                //             Radius.circular(10.0),
                //           ).r,
                //         ),
                //         enabledBorder: OutlineInputBorder(
                //           borderSide: const BorderSide(
                //               color: Colorutils.userdetailcolor, width: 1.0),
                //           borderRadius:
                //               const BorderRadius.all(Radius.circular(10)).r,
                //         ),
                //         focusedBorder: OutlineInputBorder(
                //           borderSide: const BorderSide(
                //               color: Colorutils.userdetailcolor, width: 1.0),
                //           borderRadius:
                //               const BorderRadius.all(Radius.circular(10.0)).r,
                //         ),
                //         fillColor: Colors.white,
                //         filled: true),
                //     maxLines: 5,
                //   ),
                // ),
              ],
            ),
          ),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Center(
                    child: GestureDetector(
                      onTap: () async {
                        if (selectedIndex != null) {
                          context.loaderOverlay.show();

                          Map<String, dynamic> resp =
                              await ApiServices.addAppointment(
                                  token: widget.token,
                                  doctor: data?.id ?? 0,
                                  date: fromDate,
                                  patient: widget.id,
                                  slot: Get.find<SlottopateientController>()
                                          .slotToPatientList
                                          .value[selectedIndex!]
                                          ?.id ??
                                      0);


                          if (resp['status'] == "ok") {
                            // await Get.find<DoctorToPatientController>()
                            //     .doctorToPatientData(
                            //         widget.token, data?.id ?? 0, widget.id);
                            await Get.find<PatientQueueController>()
                                .patientData(widget.token);
                            await Get.find<JuniorDashboardController>()
                                .juniorData(widget.token);
                            context.loaderOverlay.hide();
                            ProductAppPopUps.submit22Back(
                              title: "Success",
                              message: resp['message'],
                              actionName: "Close",
                              iconData: Icons.done,
                              iconColor: Colors.green,
                            );
                          } else {
                            context.loaderOverlay.hide();
                            ProductAppPopUps.submit(
                              title: "Error",
                              message: resp['message'],
                              actionName: "Close",
                              iconData: Icons.error_outline_outlined,
                              iconColor: Colors.red,
                            );
                          }
                        } else {
                          context.loaderOverlay.hide();
                          ProductAppPopUps.submit(
                            title: "Error",
                            message: "Please Select the Doctor Slot to proceed",
                            actionName: "Close",
                            iconData: Icons.error_outline_outlined,
                            iconColor: Colors.red,
                          );
                        }
                      },
                      child: Container(
                        width: 250.w,
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
                                'Make Appointment',
                                style: GoogleFonts.inter(
                                  fontSize: 16.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
