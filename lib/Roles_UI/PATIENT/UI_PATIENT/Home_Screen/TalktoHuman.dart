import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Controller/Call_HumanController.dart';
import '../../../UI/Personal_Chat/Chat_Page.dart';

class TalkToHuman extends StatelessWidget {
  TalkToHuman({super.key});

  Future<void> makePhoneCall(
    final String number,
  ) async {
    final Uri uri = Uri(scheme: 'tel', path: number.toString());
    if (await canLaunchUrl(uri)) {
      print("Launching: $uri");
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } else {
      print("Could not launch $uri");
      throw 'Could not launch $uri';
    }
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 50, bottom: 20),
              child: Text(
                "TALK TO HUMAN",
                style: GoogleFonts.shanti(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.h,
                ),
              ),
            ),
            GetX<CallHumanController>(
              builder: (CallHumanController controller) {
                if (controller.callHumanList.isEmpty) {
                  return Center(
                    child: const Text(
                      "No Data Found.",
                      style: TextStyle(
                          color: Colors.red, fontStyle: FontStyle.italic),
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: controller.callHumanList.length,
                      itemBuilder: (context, index) {
                        final callHuman = controller.callHumanList[index];
                        return Column(
                          children: [
                            GestureDetector(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 30.r,
                                  child: CircleAvatar(
                                    radius: 25.r,
                                    // Ensure the radius is responsive
                                    backgroundColor: Colors.white,
                                    child: ClipOval(
                                      child: Image.asset(
                                        "assets/images/profile2.jpg",
                                        fit: BoxFit.cover,
                                        // Ensures the image is properly scaled and centered
                                        width: 54.r,
                                        // Double the inner radius to cover full area
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
                                  child: SvgPicture.asset(
                                    "assets/images/phone-call.svg",
                                    width: 25.w,
                                    height: 25.h,
                                  ),
                                ),
                              ),
                              onTap: () {
                                print("----------------------calll");
                                makePhoneCall(callHuman?.mobileNumber ?? "");
                              },
                            ),
                            Divider(
                              thickness: 0.3,
                              indent: 10, // aligns the divider with the text
                              endIndent: 10,
                            ),
                          ],
                        );
                        ;
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
