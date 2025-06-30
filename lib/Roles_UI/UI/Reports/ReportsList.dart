import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient/utils/color_util.dart';

import '../../../Controller/Doctor_List_Controller.dart';
import '../../../Controller/ReportPatientController.dart';
import '../../CHIEF_DOCTOR/bottom_Navigation_Chief.dart';
import 'ReportDetails.dart';

class ReportsList extends StatefulWidget {
  final String token;

  const ReportsList({super.key, required this.token});

  @override
  State<ReportsList> createState() => _ReportsListState();
}

class _ReportsListState extends State<ReportsList> {
  TextEditingController controllers = TextEditingController();
  @override
  void initState() {
    super.initState();
    Get.find<ReportPatientController>().reportListData(widget.token);
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
                    "PATIENT REPORT LIST",
                    style: GoogleFonts.shanti(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w900,
                      fontSize: 20.h,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
              child: Container(
                height: 50.h,
                decoration: const BoxDecoration(
                    border: Border(),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                width: double.infinity,
                child: TextFormField(
                  autofocus: false,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')), // 👈 Disallows all whitespace
                  ],
                  onChanged: (value) {
                    Get.find<ReportPatientController>().searchReportPatientList(value);
                  },
                  validator: (val) => val!.isEmpty ? 'Enter the Topic' : null,
                  cursorColor: Colors.grey,
                  keyboardType: TextInputType.text,
                  controller: controllers,
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
            ),            Expanded(
              child: GetX<ReportPatientController>(
                builder: (ReportPatientController controller) {
                  if (controller.reportList.isEmpty) {
                    return Center(
                      child: const Text(
                        "No Reports Found.",
                        style: TextStyle(
                            color: Colors.red, fontStyle: FontStyle.italic),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      // separatorBuilder: (context, index) => Divider(),
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      // Disable scrolling
                      itemCount: controller.reportList.length,
                      itemBuilder: (context, index) {
                        final report = controller.reportList[index];
                        return ListTile(
                          leading:  CircleAvatar(
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
                          title: Text(
                            report?.patient?.name?.toUpperCase() ?? "No Name",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 15.h,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            report?.patient?.mobileNumber ?? "No Role",
                            style: TextStyle(
                              fontSize: 14.h,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,

                            children: [
                              GestureDetector(

                                child:Image.asset(
                                  "assets/images/whatsapp.png",
                                  fit: BoxFit.cover,
                                  width: 22,
                                  height: 22,
                                ),
                                onTap: (){
                                  // makePhoneCall( callHuman?.callId ?? 0);
                                  //
                                  openWhatsAppChat( phoneNumber:report?.patient?.mobileNumber ?? "");

                                },
                              ),
                              SizedBox(width: 20,),
                              GestureDetector(

                                child: Icon(Icons.arrow_forward_ios,
                                    size: 17, color: Colors.blueGrey),
                                onTap: (){

                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return ReportsDetails(token:widget.token, id: report?.patient?.id ?? 0, name: report?.patient?.name ?? "",);
                                    },
                                  ));

                                },
                              ),

                            ],
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
