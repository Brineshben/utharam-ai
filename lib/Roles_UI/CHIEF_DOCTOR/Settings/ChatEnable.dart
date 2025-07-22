import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patient/utils/color_util.dart';

import '../../../Controller/ChatEnableController.dart';
import '../../../Controller/Doctor_List_Controller.dart';
import '../../../Controller/EnquiredListController.dart';
import '../../../Controller/PatientAssesmentListController.dart';
import '../../../Controller/Patient_queue_Controller.dart';
import '../../../Controller/SheduleController.dart';
import '../../../Service/Api_Service.dart';
import '../../CHIEF_DOCTOR/bottom_Navigation_Chief.dart';
import '../../UI/Assesment_therapist/Assesment_List.dart';
import '../../UI/Common_Widget/popups.dart';


class Chatenable extends StatefulWidget {
  final String token;

  const Chatenable({super.key, required this.token});

  @override
  State<Chatenable> createState() => _ChatenableState();
}

class _ChatenableState extends State<Chatenable> {
  @override
  void initState() {
    Get.find<Chatenablecontroller>().chatEnableDataz(widget.token);

    super.initState();
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
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Text(
                "ENABLE CHAT",
                style: GoogleFonts.shanti(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.h,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
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
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')), // 👈 Disallows all whitespace
                  ],
                  onChanged: (value) {
                    Get.find<Chatenablecontroller>().chatList(value);
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
            ),            Expanded(
              child: GetX<Chatenablecontroller>(
                builder: (Chatenablecontroller controller) {

                  if (controller.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colorutils.userdetailcolor,
                      ),
                    );
                  }
                  if (controller.chatEnableList.isEmpty) {
                    return Center(
                      child: const Text(
                        "No Patient details found",
                        style: TextStyle(
                            color: Colors.red,
                            fontStyle: FontStyle.italic),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.chatEnableList.length,
                      itemBuilder: (context, index) {
                        final patient = controller.chatEnableList[index];
                        final isAvailable = patient?.chatEnabled ?? false;

                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
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
                                patient?.name?.toUpperCase() ?? "No Name",
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 14.h,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                patient?.patientId ?? "No Name",
                                style: TextStyle(
                                  fontSize: 13.h,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Switch(
                                value: isAvailable,
                                onChanged: (value) async {
                                  if (value== true) {
                                    context.loaderOverlay.show();
                                    final response = await ApiServices.enableChat(patientId:  patient?.id ??0);
                                    context.loaderOverlay.hide();
                                    print('Enable Chat Response: $response');

                                    if (response['status'] == true) {
                                      Get.find<Chatenablecontroller>().chatEnableDataz(widget.token);

                                      // Get.find<EnquiredListController>().enquiryListData(widget.token);
                                      // Get.find<PatientQueueController>().patientData(widget.token);

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
                                    final response = await ApiServices.disableChat(patientId:  patient?.id ??0);
                                    context.loaderOverlay.hide();
                                    print('Enable Chat Response: $response');

                                    if (response['status'] == true) {
                                      Get.find<Chatenablecontroller>().chatEnableDataz(widget.token);


                                      ProductAppPopUps.submit(
                                        title: "Success",
                                        message: "Chat Functionality Disabled",
                                        actionName: "Close",
                                        iconData: Icons.done,
                                        iconColor: Colors.green,
                                      );
                                    }      }
                                },
                                activeColor: Colorutils.userdetailcolor.withOpacity(0.1),
                                activeTrackColor: Colorutils.userdetailcolor,
                                inactiveThumbColor: Colorutils.userdetailcolor.withOpacity(0.1),
                                inactiveTrackColor: Colors.grey.shade400,
                              ),

                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey.withOpacity(0.3),
                              endIndent: 10.0,
                              indent: 10.0,
                            ),
                          ],
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
Widget _buildTag(String text, Color bgColor) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: bgColor,
    ),
    padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 5.w),
    child: Text(
      text,
      style: GoogleFonts.nunito(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 13.h,
      ),
    ),
  );
}
