import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:patient/Roles_UI/JUNIOR_DOCTOR/Junior_doctorView/pdfViewJunior.dart';
import 'package:patient/utils/color_util.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Controller/Doctor_List_Controller.dart';
import '../../../Controller/EnquiredListController.dart';
import '../../../Controller/JuniorDashoard_Controller.dart';
import '../../../Service/Api_Service.dart';
import '../../CHIEF_DOCTOR/bottom_Navigation_Chief.dart';
import '../../UI/Common_Widget/popups.dart';
import 'Add_Doctor.dart';
import 'Second_Assesment.dart';

class EnquirylistPage extends StatefulWidget {
  final String token;
  final int doctorID;

  const EnquirylistPage({super.key, required this.token, required this.doctorID});

  @override
  State<EnquirylistPage> createState() => EnquirylistPageState();
}

class EnquirylistPageState extends State<EnquirylistPage> {
  @override
  void initState() {
    super.initState();
    Get.find<EnquiredListController>().enquiryListData(widget.token);
  }
  Future<void> makePhoneCall(
      final String number,
      ) async {
    final Uri uri = Uri(scheme: 'tel', path: number);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Text
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Text(
                "ENQUIRED PATIENT LIST",
                style: GoogleFonts.shanti(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.h,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
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
                  onChanged: (value) {
                    Get.find<EnquiredListController>().SearchEnquiredList(value);
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')), // Disallow spaces
                  ],
                  validator: (val) => val!.isEmpty ? 'Enter the Topic' : null,
                  cursorColor: Colors.grey,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.grey),
                      hintText: "Search Enquired Patients",
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
              child: GetX<EnquiredListController>(
                builder: (EnquiredListController controller) {

                  if (controller.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colorutils.userdetailcolor,
                      ),
                    );
                  }
                  if (controller.enquiryList.isEmpty) {
                    return Center(
                      child: const Text(
                        "Oops...No Enquired List Found.",
                        style: TextStyle(
                            color: Colors.red,
                            fontStyle: FontStyle.italic),
                      ),
                    );
                  } else {
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      shrinkWrap: true,
                      itemCount: controller.enquiryList.length,
                      itemBuilder: (context, index) {

                        final patientEnquired = controller.enquiryList[index];
                        final patientSummary = (patientEnquired?.diagnosis?.isNotEmpty ?? false)
                            ? patientEnquired?.diagnosis?.first.id
                            : 0;

                        final showButtons = (patientEnquired?.diagnosis?.isNotEmpty ?? false)
                            ? patientEnquired?.diagnosis?.first.isApproved
                            : false;
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
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                patientEnquired?.name?.toUpperCase() ?? "No Name",
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 15.h,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Text(
                                    patientEnquired?.mobileNumber?.toUpperCase() ?? "No Number",
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 12.h,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Row(
                                    children: [

                                      GestureDetector(

                                        child:Image.asset(
                                          "assets/images/whatsapp.png",
                                          fit: BoxFit.cover,
                                          width: 25,
                                          height: 25,
                                        ),
                                        onTap: (){
                                          // makePhoneCall( callHuman?.callId ?? 0);
                                          //
                                          openWhatsAppChat( phoneNumber: patientEnquired?.mobileNumber ??"");

                                        },
                                      ),
                                      SizedBox(width: 15,),
                                      GestureDetector(

                                        child: SvgPicture.asset(
                                          "assets/images/phone-call.svg",

                                          width: 25.w,
                                          height: 25.h,
                                        ),
                                        onTap: (){
                                          // makePhoneCall( callHuman?.callId ?? 0);
                                          //
                                          makePhoneCall(patientEnquired?.mobileNumber ??"");

                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5,),
                              (showButtons == false && patientEnquired?.hasSecondAssessment ==false) ?
                              GestureDetector(child: buildTag("Generate AI Report", Colorutils.userdetailcolor),onTap: () async{




                                context.loaderOverlay.show();
                                Map<String, dynamic> resp =
                                await ApiServices.generateReport(
                                    token: widget.token, id: patientEnquired?.id ?? 0);
                                context.loaderOverlay.hide();

                                if (resp['status'] == "ok") {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return FullScreenPdfViewerJunior( token:  widget.token, patientid:  patientEnquired?.id ?? 0, doctorID: widget.doctorID, diagnosisId: patientSummary ?? 0,);
                                  },));

                                  ProductAppPopUps.submit(
                                    title: "Success",
                                    message: "AI Report Generated Successfully",
                                    actionName: "Close",
                                    iconData: Icons.done,
                                    iconColor: Colors.green,
                                  );
                                } else {
                                  ProductAppPopUps.submit(
                                    title: "Error",
                                    message:  "Patient Not Complete the AI Chat Yet",
                                    actionName: "Close",
                                    iconData: Icons.error_outline_outlined,
                                    iconColor: Colors.red,
                                  );
                                }

                              },):SizedBox(),
                              SizedBox(height: 5,),
                              (showButtons == true &&patientEnquired?.hasSecondAssessment ==false) ?
                              GestureDetector(child: buildTag("START SECOND ASSESMENT", Colors.blue),onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return SecondAssesment(token: widget.token, userID: patientEnquired?.id ?? 0, name: patientEnquired?.name ?? "",);
                                },));
                              },) : SizedBox(),
                              SizedBox(height: 5,),
                            patientEnquired?.hasSecondAssessment ==true ?
                              Row(
                                children: [
                                  GestureDetector(
                                    child: buildTag("APPROVE", Colorutils.userdetailcolor),
                                    onTap: () async {
                                      context.loaderOverlay.show(); // Show loader before API call
                                      final resp = await ApiServices.approveEnquiredList(
                                        token: widget.token,
                                        id: patientEnquired?.id ?? 0,
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
                                        await Get.find<EnquiredListController>().enquiryListData(widget.token);
                                        await Get.find<JuniorDashboardController>().juniorData(widget.token);

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
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    child: buildTag("REJECT", Colors.red),
                                    onTap: () async {
                                      context.loaderOverlay.show();
                                      final resp = await ApiServices.rejectEnquiredList(
                                        token: widget.token,
                                        id: patientEnquired?.id ?? 0,
                                      );
                                      context.loaderOverlay.hide();

                                      print("Reject Response: $resp");

                                      if (resp['status'] == "ok") {
                                        ProductAppPopUps.submit(
                                          title: "Success",
                                          message: "Patient Enquiry Rejected Successfully.",
                                          actionName: "Close",
                                          iconData: Icons.done,
                                          iconColor: Colorutils.userdetailcolor,
                                        );
                                        Get.find<EnquiredListController>().enquiryListData(widget.token);
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
                                ],
                              ):SizedBox(),
                          // patientEnquired?.hasSecondAssessment == true
                          //     ? Row(
                          //   children: [
                          //     GestureDetector(
                          //       child: _buildTag("APPROVE", Colorutils.userdetailcolor),
                          //       onTap: () async {
                          //         context.loaderOverlay.show(); // Show loader before API call
                          //         final resp = await ApiServices.approveEnquiredList(
                          //           token: widget.token,
                          //           id: patientEnquired?.id ?? 0,
                          //         );
                          //         context.loaderOverlay.hide(); // Hide loader after API call
                          //
                          //         print("Approve Response: $resp");
                          //
                          //         if (resp['status'] == "ok") {
                          //           ProductAppPopUps.submit(
                          //             title: "Success",
                          //             message: "Patient Enquiry Approved Successfully.",
                          //             actionName: "Close",
                          //             iconData: Icons.done,
                          //             iconColor: Colorutils.userdetailcolor,
                          //           );
                          //           Get.find<EnquiredListController>().enquiryListData(widget.token);
                          //         } else {
                          //           ProductAppPopUps.submit(
                          //             title: "Failed",
                          //             message: resp['message'] ?? 'Something went wrong.',
                          //             actionName: "Close",
                          //             iconData: Icons.error_outline,
                          //             iconColor: Colors.red,
                          //           );
                          //         }
                          //       },
                          //     ),
                          //     const SizedBox(width: 8),
                          //     GestureDetector(
                          //       child: _buildTag("REJECT", Colors.red),
                          //       onTap: () async {
                          //         context.loaderOverlay.show();
                          //         final resp = await ApiServices.rejectEnquiredList(
                          //           token: widget.token,
                          //           id: patientEnquired?.id ?? 0,
                          //         );
                          //         context.loaderOverlay.hide();
                          //
                          //         print("Reject Response: $resp");
                          //
                          //         if (resp['status'] == "ok") {
                          //           ProductAppPopUps.submit(
                          //             title: "Success",
                          //             message: "Patient Enquiry Rejected Successfully.",
                          //             actionName: "Close",
                          //             iconData: Icons.done,
                          //             iconColor: Colorutils.userdetailcolor,
                          //           );
                          //           Get.find<EnquiredListController>().enquiryListData(widget.token);
                          //         } else {
                          //           ProductAppPopUps.submit(
                          //             title: "Failed",
                          //             message: resp['message'] ?? 'Something went wrong.',
                          //             actionName: "Close",
                          //             iconData: Icons.error_outline,
                          //             iconColor: Colors.red,
                          //           );
                          //         }
                          //       },
                          //     ),
                          //   ],
                          // )
                          //     : const SizedBox(),


                          ],
                          ),
                          onTap: () {},
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
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
Widget buildTag(String text, Color bgColor) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: bgColor,
    ),
    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
    child: Text(
      text,
      style: GoogleFonts.nunito(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 14.h,
      ),
    ),
  );
}