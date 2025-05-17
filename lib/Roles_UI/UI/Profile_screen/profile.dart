import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color_util.dart';

class UserProfileScreen extends StatelessWidget {
  final String name;
  final String userType;
  final String profilePicture;
  final String Email;
  final int phone;
  const UserProfileScreen({super.key, required this.name, required this.userType, required this.profilePicture, required this.Email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                ),
                child: CachedNetworkImage(
                  width:  double.infinity,
                  imageUrl:
                  "https://media.istockphoto.com/id/1468678603/photo/portrait-of-a-black-woman-doctor-happy-with-internship-opportunity-healthcare-career-and.jpg?s=612x612&w=0&k=20&c=t0VMbPOYv8YKezQoegsKibwKPOnaomBemK6MIEgYmjY=",
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      Image.asset("https://media.istockphoto.com/id/1468678603/photo/portrait-of-a-black-woman-doctor-happy-with-internship-opportunity-healthcare-career-and.jpg?s=612x612&w=0&k=20&c=t0VMbPOYv8YKezQoegsKibwKPOnaomBemK6MIEgYmjY=", fit: BoxFit.cover),
                  errorWidget: (context, url, error) =>
                      Image.asset("https://media.istockphoto.com/id/1468678603/photo/portrait-of-a-black-woman-doctor-happy-with-internship-opportunity-healthcare-career-and.jpg?s=612x612&w=0&k=20&c=t0VMbPOYv8YKezQoegsKibwKPOnaomBemK6MIEgYmjY=", fit: BoxFit.cover),
                ),
                // child: Image.network(
                //   "https://t4.ftcdn.net/jpg/02/10/96/95/360_F_210969565_cIHkcrIzRpWNZzq8eaQnYotG4pkHh0P9.jpg",
                //   height: 150.h,
                //   width: double.infinity,
                //   fit: BoxFit.cover,
                // ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, top: 25, bottom: 5),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "PROFILE DETAILS",
                  style: GoogleFonts.heebo(
                    color: Colorutils.userdetailcolor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                buildInfoRow(
                    "NAME",  name),
                const SizedBox(
                  height: 5,
                ),
                buildInfoRow(
                    "EMAIL",Email),
                const SizedBox(
                  height: 5,
                ),
                buildInfoRow(
                    "PHONE NO", "${phone.toString()}"),


              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              onPressed: () {},
              child: const Text("LOG OUT",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 100.w,
                child: Text(
                  label,
                  style: GoogleFonts.orbitron(
                      color: Colors.black,
                      fontSize: 15.h,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                ":  ",
                style: GoogleFonts.orbitron(
                    color: Colors.black,
                    fontSize: 20.h,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Expanded(
            // Ensures that the value text takes available space
            child: Text(
              value.toUpperCase(),
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              overflow: TextOverflow.visible, // Allows text to wrap
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

}
