import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppointmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text("Upcoming",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text("Past",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.filter_list, color: Colors.black),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text("20 Mar, 2025", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return AppointmentCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.green[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 22.r,
          backgroundImage: CachedNetworkImageProvider(
              "https://media.istockphoto.com/id/1223671392/vector/default-profile-picture-avatar-photo-placeholder-vector-illustration.jpg?s=612x612&w=0&k=20&c=s0aTdmT5aU6b8ot7VKm11DeID6NctRCpB755rA1BIP0="),
          backgroundColor: Colors.white,
          onBackgroundImageError: (exception, stackTrace) {
            // Handle error (optional)
          },
        ),
        title: Text("Mr. Jack Stepenson",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14.w)),
        subtitle: Text("psychotic disorder",
            style: TextStyle(color: Colors.white, fontSize: 12.w)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              FontAwesomeIcons.phone,
              size: 22,
              color: Colors.white,
            ),
            SizedBox(width: 20),
            Icon(
              FontAwesomeIcons.comment,
              size: 22,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
