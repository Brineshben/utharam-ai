import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Controller/AddTalktoHumanController.dart';
import '../../../Controller/EnquiredListController.dart';
import '../../../Controller/JuniorDashoard_Controller.dart';
import '../../../Controller/RejectedController.dart';
import '../../../Service/Api_Service.dart';
import '../../../utils/color_util.dart';
import '../../JUNIOR_DOCTOR/Junior_doctorView/EnquiryList_Page.dart';
import '../../UI/Common_Widget/popups.dart';

class RejectedPatientList extends StatefulWidget {
  final String token;
  RejectedPatientList({super.key, required this.token});

  @override
  State<RejectedPatientList> createState() => _RejectedPatientListState();
}

class _RejectedPatientListState extends State<RejectedPatientList> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.white, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 50, bottom: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "REJECTED PATIENT LIST",
                  style: GoogleFonts.shanti(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w900,
                    fontSize: 20.h,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GetX<RejectedController>(
                builder: (RejectedController controller) {
                  if (controller.rejected1List.isEmpty) {
                    return Center(
                      child: Text(
                        "No Patient Details Found",
                        style: TextStyle(
                          color: Colors.red,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: controller.rejected1List.length,
                      itemBuilder: (context, index) {
                        final callHuman = controller.rejected1List[index];

                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 30.r,
                                child: CircleAvatar(
                                  radius: 25.r,
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    child: Image.asset(
                                      "assets/images/profile2.jpg",
                                      fit: BoxFit.cover,
                                      width: 54.r,
                                      height: 54.r,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                callHuman?.name ?? "",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(callHuman?.role ?? ""),
                              trailing: GestureDetector(
                                child: buildTag("APPROVE", Colorutils.userdetailcolor),
                                onTap: () async {
                                  context.loaderOverlay.show(); // Show loader before API call
                                  final resp = await ApiServices.approveEnquiredList(
                                    token: widget.token,
                                    id: callHuman?.id ?? 0,
                                  );
                                  context.loaderOverlay.hide(); // Hide loader after API call

                                  print("Approve Response: $resp");

                                  if (resp['status'] == "ok") {
                                    ProductAppPopUps.submit(
                                      title: "Success",
                                      message: "Patient Enquiry Approved Successfully.",
                                      actionName: "Close",
                                      iconData: Icons.done,
                                      iconColor: Colorutils.userdetailcolor,
                                    );
                                    await Get.find<RejectedController>().rejectedDataz(widget.token);

                                  } else {
                                    ProductAppPopUps.submit(
                                      title: "Failed",
                                      message: resp['message'] ?? 'Something went wrong.',
                                      actionName: "Close",
                                      iconData: Icons.error_outline,
                                      iconColor: Colors.red,
                                    );
                                  }
                                },
                              ),
                              onTap: () async{

                              },
                            ),
                            Divider(thickness: 0.3, indent: 10, endIndent: 10),
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
