import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:patient/utils/color_util.dart';

import '../../../Controller/Doctor_List_Controller.dart';
import '../../CHIEF_DOCTOR/bottom_Navigation_Chief.dart';
import '../../JUNIOR_DOCTOR/Junior_doctorView/Add_Doctor.dart';
import '../../JUNIOR_DOCTOR/Junior_doctorView/Slot_Create.dart';


class DoctorListSenior extends StatefulWidget {
  final String token;
  final int doctorId;

  const DoctorListSenior({super.key, required this.token, required this.doctorId});

  @override
  State<DoctorListSenior> createState() => _DoctorListSeniorState();
}

class _DoctorListSeniorState extends State<DoctorListSenior> {
  @override
  void initState() {
    super.initState();
    Get.find<DoctorListController>().doctorListData(widget.token);
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
                    "DOCTOR LIST",
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
                //       height: 50.h,
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
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')), // 👈 Disallows all whitespace
                  ],
                  autofocus: false,
                  onChanged: (value) {
                    Get.find<DoctorListController>().SearchDoctorList(value);
                  },
                  validator: (val) => val!.isEmpty ? 'Enter the Topic' : null,
                  cursorColor: Colors.grey,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.grey),
                      hintText: "Search Doctors",
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
              child: GetX<DoctorListController>(
                builder: (DoctorListController controller) {

                  if (controller.doctorList.isEmpty) {
                    return Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Center(
                          child: const Text(
                            "No Doctor Data Found.",
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
                      itemCount: controller.doctorList.length,
                      itemBuilder: (context, index) {
                        final doctor = controller.doctorList[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/doctorlogo.png",
                                fit: BoxFit.cover,
                                width: 50.w,
                                height: 50.h,
                              ),
                            ),
                          ),
                          title: Text(
                            "DR.${doctor?.name?.toUpperCase() ?? "No Name"}",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 15.h,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            formatString(doctor?.role ?? "No Role"),
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
                                  openWhatsAppChat( phoneNumber: doctor?.mobileNumber ??"");

                                },
                              ),
                              SizedBox(width: 10,),
                              (widget.doctorId ==  doctor?.id)?
                              IconButton(
                                icon: Icon(Icons.arrow_forward_ios, size: 20.w, color: Colors.blueGrey),
                                onPressed: () {

                                  print(doctor?.id ?? '');
                                  print(doctor?.name ?? '');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CreateSlotScreen(
                                        drId: doctor?.id ?? 0,
                                        drName: doctor?.name ?? '',
                                        role: doctor?.role ?? '',
                                        token: widget.token,
                                      ),
                                    ),
                                  );
                                },
                              ):SizedBox(),
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
String formatString(String input) {
  return input
      .split('_')
      .map((word) =>
  word.isNotEmpty ? word[0].toUpperCase() + word.substring(1).toLowerCase() : '')
      .join(' ');
}