import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient/utils/color_util.dart';

import '../../../main.dart';
import '../../JUNIOR_DOCTOR/appoinment/PatientListr.dart';
import '../../PATIENT/UI_PATIENT/RegisterComplaints/AddComplaints.dart';
import '../../UI/AppintmentsPage/My_Appointments.dart';
import '../../UI/DoctorListSenior/doctorListSenior.dart';


class ProfilePatientsSettingsPage extends StatefulWidget {
  final String name;
  final String role;
  final String token;

  const ProfilePatientsSettingsPage(
      {super.key, required this.name, required this.role, required this.token});

  @override
  _ProfilePatientsSettingsPageState createState() => _ProfilePatientsSettingsPageState();
}

class _ProfilePatientsSettingsPageState extends State<ProfilePatientsSettingsPage> {
  bool availability = true;
  bool email = false;
  bool sms = false;
  bool showSuggestions = false;
  bool showConfidence = false;
  bool showProbabilities = false;
  String fontSize = 'small';
  String appearance = 'light';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: EdgeInsets.all(16),
          child: Column(
            children: [

              Padding(
                padding: EdgeInsets.only(top: 50.h, left: 5.w, right: 10.w),                child: buildProfileCard(widget.name, formatString(widget.role)),
              ),
              // SizedBox(height: 5),
              // Wrap(

              //   spacing: 12,
              //   runSpacing: 12,
              //   children: [
              //     // buildCard('Data Access Control', [
              //     //   Text("Assigned Patients"),
              //     //   Text("View All Records"),
              //     // ]),
              //     // buildCard('AI Preferences', [
              //     //   buildCheckbox("Show AI suggestions", showSuggestions, (v) {
              //     //     setState(() => showSuggestions = v!);
              //     //   }),
              //     //   buildCheckbox("Confidence Scores", showConfidence, (v) {
              //     //     setState(() => showConfidence = v!);
              //     //   }),
              //     //   buildCheckbox("Diagnostic probabilities", showProbabilities,
              //     //       (v) {
              //     //     setState(() => showProbabilities = v!);
              //     //   }),
              //     // ]),
              //     buildCard('Interface Settings', [
              //       Row(
              //         children: [
              //           Text("Appearance"),
              //           SizedBox(width: 10),
              //           Radio<String>(
              //             value: 'light',
              //             groupValue: appearance,
              //             activeColor: Colorutils.userdetailcolor,
              //             onChanged: (value) {
              //               setState(() => appearance = value!);
              //             },
              //           ),
              //           Text("Light"),
              //         ],
              //       ),
              //       Row(
              //         children: [
              //           Text("Font Size"),
              //           SizedBox(width: 10),
              //           Radio<String>(
              //             value: 'small',
              //             activeColor: Colorutils.userdetailcolor,
              //             groupValue: fontSize,
              //             onChanged: (value) {
              //               setState(() => fontSize = value!);
              //             },
              //           ),
              //           Text("Small"),
              //           Radio<String>(
              //             value: 'large',
              //             activeColor: Colorutils.userdetailcolor,
              //             groupValue: fontSize,
              //             onChanged: (value) {
              //               setState(() => fontSize = value!);
              //             },
              //           ),
              //           Text("Large"),
              //         ],
              //       ),
              //     ]),
              //     // buildCard('Legal & Compliance', [
              //     //   Text("Consent Templates"),
              //     //   Text("Access Logs"),
              //     // ]),
              //   ],
              // ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, left: 5.w, right: 10.w,bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SETTINGS ",
                      style: GoogleFonts.shanti(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w900,
                        fontSize: 20.h,
                      ),
                    ),
                  ],
                ),
              ),
             SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AddComplaint(token: widget.token, role: widget.role,);
                    },
                  ));
                },
                child: NameCard(
                  name: "COMPLAINTS",
                ),
              )

              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text('Save Changes',style: TextStyle(
              //     color: Colors.white
              //   ),),
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colorutils.userdetailcolor,
              //     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileCard(
      final String name,
      final String role,
      ) {
    return Card(

      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child:  ClipOval(
                        child: Image.asset(
                          "assets/images/profileimage.jpg",
                          fit: BoxFit.cover,
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name.toUpperCase(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey)),
                    Text(role,
                        style: TextStyle(fontSize: 14, color: Colors.blueGrey)),
                    // Row(
                    //   children: [
                    //     Text("Availability",
                    //         style: TextStyle(
                    //             fontSize: 14, color: Colors.blueGrey)),
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 5, right: 5),
                    //       child: Transform.scale(
                    //         scale: 0.7,
                    //         // Increase or decrease this value to adjust size
                    //         child: Switch(
                    //           activeColor: Colorutils.userdetailcolor,
                    //           value: availability,
                    //           onChanged: (val) =>
                    //               setState(() => availability = val),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     Text("Notifications",
                    //         style: TextStyle(
                    //             fontSize: 14, color: Colors.blueGrey)),
                    //     Row(
                    //       children: [
                    //         Checkbox(
                    //             value: email,
                    //             checkColor: Colors.white,
                    //             activeColor: Colorutils.userdetailcolor,
                    //             onChanged: (val) =>
                    //                 setState(() => email = val!)),
                    //         Text("Email",
                    //             style: TextStyle(
                    //                 fontSize: 12, color: Colors.blueGrey)),
                    //         Checkbox(
                    //             value: sms,
                    //             checkColor: Colors.white,
                    //             activeColor: Colorutils.userdetailcolor,
                    //             onChanged: (val) => setState(() => sms = val!)),
                    //         Text("SMS",
                    //             style: TextStyle(
                    //                 fontSize: 12, color: Colors.blueGrey)),
                    //       ],
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, List<Widget> content) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blueGrey)),
              SizedBox(height: 8),
              ...content,
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCheckbox(String label, bool value, Function(bool?)? onChanged) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          checkColor: Colors.white,
          activeColor: Colorutils.userdetailcolor,
        ),
        Expanded(
            child: Text(
              label,
              style: TextStyle(color: Colors.blueGrey),
            )),
      ],
    );
  }
}

class NameCard extends StatelessWidget {
  final String name;

  const NameCard({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(1),
      elevation: 0.1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.blueGrey,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
