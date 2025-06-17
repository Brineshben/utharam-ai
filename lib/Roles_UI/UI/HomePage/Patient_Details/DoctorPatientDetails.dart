import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:loader_overlay/loader_overlay.dart';

import '../../../../Controller/AssignedDoctorPatients_Controller.dart';
import '../../../../Controller/DoctorParticularPatientMedicineController.dart';
import '../../../../Controller/Medicine_Controller/Brand_Controller.dart';
import '../../../../Controller/Medicine_Controller/FrequencyController.dart';
import '../../../../Controller/Medicine_Controller/Medicine_Controller.dart';
import '../../../../Controller/Medicine_Controller/Particular_medicineList_Controller.dart';
import '../../../../Controller/SeniorDashboardController.dart';
import '../../../../Service/Api_Service.dart';
import '../../../../utils/color_util.dart';
import '../../Common_Widget/DateFormat.dart';
import '../../Common_Widget/Download.dart';
import '../../Common_Widget/connectivity.dart';
import '../../Common_Widget/pdfview.dart';
import '../../Common_Widget/popups.dart';
import '../../Medicine/Medicine.dart';
import '../../Medicine/Medicine_List_Widget.dart';

class DoctorsPatientDetails extends StatefulWidget {
  final String role;
  final String url;
  final String name;
  final String token;
  final String patientId;
  final int id;
  final int assignedId;
  final int age;
  final int doctorID;
  final int diagnosisID;
  final String gender;
  final String email;
  final String phone;
  final String disease;
  final String severity;
  final String diagnosissummary;

  const DoctorsPatientDetails(
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
      required this.role,
      required this.doctorID, required this.url, required this.diagnosisID, required this.assignedId})
      : super(key: key);

  @override
  State<DoctorsPatientDetails> createState() => _DoctorsPatientDetailsState();
}

class _DoctorsPatientDetailsState extends State<DoctorsPatientDetails> {
  @override
  void initState() {
    Get.find<DoctorParticularPatientMedicineController>().DoctorParticularPatientMedicineDataz(widget.token,widget.id);
    super.initState();
  }
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _observationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
          child: Form(
            key: _formKey,
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
                    age: widget.age,
                    patientId: widget.patientId,
                    name: widget.name,
                    phone: widget.phone,
                    sevirity: widget.severity,
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
                      summary: widget.diagnosissummary, details: "details", repoturl: widget.url, name:widget.name,),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 10.h, left: 20.w, right: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Observation",
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
                      controller: _observationController,
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
                  Padding(
                    padding: EdgeInsets.only(
                        top: 15.h, bottom: 5.h, left: 20.w, right: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "SUGGESTED MEDICINE LIST",
                          style: GoogleFonts.shanti(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GetX<DoctorParticularPatientMedicineController>(
                    builder: (DoctorParticularPatientMedicineController controller) {
                      if (controller.DoctorParticularPatientMedicineList.isEmpty) {
                        return Padding(
                            padding:
                            const EdgeInsets.only(top: 20),
                            child: Center(
                              child: const Text(
                                "No Medicine Assigned Yet",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontStyle: FontStyle.italic),
                              ),
                            ));
                      } else {
                        return  ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.DoctorParticularPatientMedicineList[0]?.medicines?.length,
                          itemBuilder: (context, index) {
                            final medicine = controller.DoctorParticularPatientMedicineList;

                            return Padding(
                              padding:
                              EdgeInsets.only(top: 1.h, left: 10.w, right: 8.w),
                              child: MedicineCard(
                                brandName: medicine.first?.medicines?[index].medicine ?? "--",
                                frequency: medicine.first?.medicines?[index].frequency ?? "--",
                                dosage:medicine.first?.medicines?[index].dosage ?? "--",
                                date: formatDate(medicine.first?.date ?? "--"),
                              ),
                            );

                          },
                        );


                      }
                    },
                  ),
                  // Padding(
                  //   padding:
                  //   EdgeInsets.only(top: 10.h, left: 20.w, right: 10.w),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         "Suggested Medicine List",
                  //         style: GoogleFonts.shanti(
                  //           color: Colors.blueGrey,
                  //           fontWeight: FontWeight.w900,
                  //           fontSize: 18.h,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Obx(() {
                  //   final controller = Get.find<ParticularMedicinelistController>();
                  //   return ListView.builder(
                  //     shrinkWrap: true,
                  //     physics: NeverScrollableScrollPhysics(),
                  //     itemCount: controller.particularMedicineList.length,
                  //     itemBuilder: (context, index) {
                  //       final medicine = controller.particularMedicineList[index];
                  //       return Padding(
                  //         padding: EdgeInsets.only(top: 8.h, left: 10.w, right: 8.w),
                  //         child: MedicineCard(
                  //           brandName: medicine?.remarks ?? "",
                  //           frequency: medicine?.remarks ?? "",
                  //           dosage: medicine?.remarks ?? "", date: '',
                  //         ),
                  //       );
                  //     },
                  //   );
                  // })

                ],
              ),
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
                if(widget.role == "psychiatrist")
                GestureDetector(
                  child: Center(
                    child: GestureDetector(
                      onTap: () async {
                        Get.find<MedicineController>().medicineDataz(widget.token);
                        Get.find<BrandController>().brandDataz(widget.token);
                        Get.find<FrequencyController>().frequencyDataz(widget.token);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Medicine(patientToken: widget.token, patientId: widget.id,);
                          },
                        ));
                      },
                      child: Container(
                        width: 180.w,
                        height: 45.h,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: Colorutils.userdetailcolor,
                        ),
                        // width: 250.w,
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'ADD MEDICINE',
                                style: GoogleFonts.inter(
                                    fontSize: 16.h, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: Center(
                    child: GestureDetector(
                      onTap: () async {
                        checkInternet2(
                          context: context,
                          function: () async {
                            FocusScope.of(context).unfocus();

                            if (_formKey.currentState!.validate()) {
                              context.loaderOverlay.show();

                              Map<String, dynamic> resp =
                                  await ApiServices.addObservation(
                                      token: widget.token,
                                      observation: _observationController.text,
                                      patientId: widget.id,
                                      doctorId: widget.doctorID, diagnosis: widget.diagnosisID, assignedId: widget.assignedId);

                              if (resp['status'] == "ok") {
                                await Get.find<SeniorDashboardController>().SeniorDashboardData(widget.token);
                                await Get.find<AssignedDoctorToPatientController>()
                                    .assignedDoctorPatientData(widget.token, widget.doctorID);
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
                            } else {}
                          },
                        );
                      },
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
                                'SUBMIT',
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

class PatientCard extends StatelessWidget {
  final String name;
  final String patientId;

  final int age;
  final String email;
  final String phone;
  final String sevirity;


  const PatientCard({
    Key? key,
    required this.email,
    required this.age,
    required this.patientId,
    required this.name,
    required this.phone,
    required this.sevirity,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: width * 0.92,
        // 90% of screen width
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.blue, // Border color
            width: 0.1, // Border width
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle('Name :', name),
            _buildTitle('Patient ID :', patientId),
            _buildTitle('Age :', age.toString()),
            // _buildTitle('Email :', email),
            // _buildTitle('Phone :', phone),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:getSeverityColor(sevirity),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.w),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 3, bottom: 3),
                      child: Text(
                        getSeverityLevel(sevirity).toUpperCase(),
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12
                              .h,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 15.h, color: Colors.blueGrey),
          children: [
            TextSpan(
              text: '$title  ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}

class AiReport extends StatelessWidget {
  final String summary;
  final String name;
  final String repoturl;
  final String details;

  const AiReport({
    Key? key,
    required this.summary,
    required this.details, required this.repoturl, required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: width * 0.92,
        // 90% of screen width
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.blue, // Border color
            width: 0.1, // Border width
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 1.h, left: 5.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SUMMARY : ",
                    style: GoogleFonts.inter(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _buildTitle('      ', summary),
            if(repoturl.isNotEmpty && repoturl!= "")
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      downloadPdfToDownloads(repoturl,name)  ;               },
                    icon: Icon(Icons.download),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenPdfViewer(
                            pdfUrl:repoturl,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colorutils.userdetailcolor,
                      ),
                      padding:
                      EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.w),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 3, bottom: 3),
                        child: Text(
                          "VIEW FULL REPORT",
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            // Ensure ColorUtils is defined or use a custom color.
                            fontWeight: FontWeight.w600,
                            fontSize: 12
                                .h, // Ensure you're using flutter_screenutil to define font size responsively.
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 2,
                  // ),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       color: Colorutils.userdetailcolor,
                  //     ),
                  //     padding:
                  //     EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.w),
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(
                  //           left: 10, right: 10, top: 3, bottom: 3),
                  //       child: Text(
                  //         "APPROVE",
                  //         style: GoogleFonts.nunito(
                  //           color: Colors.white,
                  //           // Ensure ColorUtils is defined or use a custom color.
                  //           fontWeight: FontWeight.w600,
                  //           fontSize: 12
                  //               .h, // Ensure you're using flutter_screenutil to define font size responsively.
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              )
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
              fontSize: 14.h,
              color: Colors.blueGrey,
              fontStyle: FontStyle.italic),
          children: [
            TextSpan(
              text: '$title ',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
