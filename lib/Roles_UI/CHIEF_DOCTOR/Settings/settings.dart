import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient/utils/color_util.dart';

class ProfileSettingsPage extends StatefulWidget {
  final String name;
  final String role;

  const ProfileSettingsPage({super.key, required this.name, required this.role});
  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
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
                padding: EdgeInsets.only(top: 50.h, left: 5.w, right: 10.w),
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
              buildProfileCard(widget.name,widget.role),
              SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  // buildCard('Data Access Control', [
                  //   Text("Assigned Patients"),
                  //   Text("View All Records"),
                  // ]),
                  // buildCard('AI Preferences', [
                  //   buildCheckbox("Show AI suggestions", showSuggestions, (v) {
                  //     setState(() => showSuggestions = v!);
                  //   }),
                  //   buildCheckbox("Confidence Scores", showConfidence, (v) {
                  //     setState(() => showConfidence = v!);
                  //   }),
                  //   buildCheckbox("Diagnostic probabilities", showProbabilities,
                  //       (v) {
                  //     setState(() => showProbabilities = v!);
                  //   }),
                  // ]),
                  buildCard('Interface Settings', [
                    Row(
                      children: [
                        Text("Appearance"),
                        SizedBox(width: 10),
                        Radio<String>(
                          value: 'light',
                          groupValue: appearance,
                          activeColor: Colorutils.userdetailcolor ,
                          onChanged: (value) {
                            setState(() => appearance = value!);
                          },
                        ),
                        Text("Light"),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Font Size"),
                        SizedBox(width: 10),
                        Radio<String>(
                          value: 'small',
                          activeColor: Colorutils.userdetailcolor ,
                          groupValue: fontSize,
                          onChanged: (value) {
                            setState(() => fontSize = value!);
                          },
                        ),
                        Text("Small"),
                        Radio<String>(
                          value: 'large', activeColor: Colorutils.userdetailcolor ,
                          groupValue: fontSize,
                          onChanged: (value) {
                            setState(() => fontSize = value!);
                          },
                        ),
                        Text("Large"),
                      ],
                    ),
                  ]),
                  // buildCard('Legal & Compliance', [
                  //   Text("Consent Templates"),
                  //   Text("Access Logs"),
                  // ]),
                ],
              ),
              SizedBox(height: 16),
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
        padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, children: [
                    CircleAvatar(
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
                  ],
                ),
                SizedBox(width: 16),
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
                    Row(
                      children: [
                        Text("Availability",
                            style: TextStyle(
                                fontSize: 14, color: Colors.blueGrey)),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Transform.scale(
                            scale: 0.7,
                            // Increase or decrease this value to adjust size
                            child: Switch(
                              activeColor: Colorutils.userdetailcolor,
                              value: availability,
                              onChanged: (val) =>
                                  setState(() => availability = val),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Notifications",
                            style: TextStyle(
                                fontSize: 14, color: Colors.blueGrey)),                        Row(
                          children: [
                            Checkbox(
                                value: email,checkColor:Colors.white,activeColor: Colorutils.userdetailcolor ,
                                onChanged: (val) => setState(() => email = val!)),
                            Text("Email", style: TextStyle(
                                fontSize: 12, color: Colors.blueGrey)),
                            Checkbox(
                                value: sms,checkColor:Colors.white,activeColor: Colorutils.userdetailcolor ,
                                onChanged: (val) => setState(() => sms = val!)),
                            Text("SMS", style: TextStyle(
                                fontSize: 12, color: Colors.blueGrey)),
                          ],
                        )
                      ],
                    ),

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
              Text(title, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey)),
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
        Checkbox(value: value, onChanged: onChanged,checkColor:Colors.white,activeColor: Colorutils.userdetailcolor ,),
        Expanded(child: Text(label,style: TextStyle(
          color: Colors.blueGrey
        ),)),
      ],
    );
  }
}
