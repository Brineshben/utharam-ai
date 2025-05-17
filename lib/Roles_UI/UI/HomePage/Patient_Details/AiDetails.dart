import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AiDetails extends StatelessWidget {
  AiDetails({super.key});

  final List<Map<String, String>> items = [
    {
      'name': 'Doctors diagnose diseases, provide treatment and counsel patients, their specific duties depend upon their medical speciality like cardiology, neurology, surgery, etc. To become a doctor, one should obtain a Bachelors degree in homoeopathy, allopathy or ayurvedic medicine and complete residencies before practising',
      'details': 'Anxiety Disorder | AGE : 25',
      'extra': 'Specialized in UI/UX and API integration'
    },
    {
      'name': 'Jane Smith',
      'details':'Anxiety Disorder | AGE : 25',
      'extra': 'Expert in Node.js, Python, and Databases'
    },
    {
      'name': 'Alice Brown',
      'details': 'Anxiety Disorder | AGE : 25',
      'extra': 'Specialized in Flutter and React Native'
    }, {
      'name': 'Alice Brown',
      'details': 'Anxiety Disorder | AGE : 25',
      'extra': 'Specialized in Flutter and React Native'
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(left: 8,right: 8,bottom: 1),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 2,

              child:Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "AI Diagnosis Report",
                          style: GoogleFonts.shanti(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w900,
                            fontSize: 20.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ExpansionTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide.none,
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide.none,
                    ),
                    title: Row(
                      children: [
                        Text(
                          "SUMMARY: ",
                          style: TextStyle(
                            fontSize: 15.h,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            items[index]['name']!,
                            style: TextStyle(
                              fontSize: 15.h,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Anxiety Disorder. The client has reported symptoms over a prolonged period and has been attending weekly sessions.",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "AGE: ${25}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                                Text(
                                  "SESSION: 3.00-4.00PM",
                                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )

          );
        },
      ),
    );
  }
}