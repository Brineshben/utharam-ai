
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/color_util.dart';
import 'DateFormat.dart';

class AppointmentCard2 extends StatelessWidget {
  final String name;
  final String fromDate;
  final String toDate;
  final String date;
  final String role;
  const AppointmentCard2({super.key, required this.name, required this.date, required this.role, required this.fromDate, required this.toDate});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colorutils.userdetailcolor,
          width: 0.3,
        ),
      ),
      elevation: 2,
      margin: const EdgeInsets.all(16),

      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Appointment date and time
            Row(
              children: [
                const Icon(Icons.access_time, color: Colors.blueGrey, size: 20),
                const SizedBox(width: 8),
                 Text(
                  "${convertDateFormat(date)} [ $fromDate - $toDate ]",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),

              ],
            ),
            const SizedBox(height: 16),
            // Doctor info
            Row(
              children: [
                // Profile image with status
                Stack(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 26,
                      backgroundImage: AssetImage('assets/images/doctorlogo.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(2),
                        child: const CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.green,
                          child: Icon(Icons.check, size: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                // Doctor name and title
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      "DR.${name.toUpperCase()}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      role,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
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
}