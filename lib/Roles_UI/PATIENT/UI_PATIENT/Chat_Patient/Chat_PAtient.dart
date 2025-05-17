import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../UI/Personal_Chat/Chat_Page.dart';
import 'package:flutter_svg/svg.dart';


class ChatListPage extends StatelessWidget {
  final List<Map<String, String>> chatData = [
    {
      "name": "Alice",
      "message": "Hey, how are you?",
      "time": "10:30 AM",
      "avatar": "https://i.pravatar.cc/150?img=1"
    },
    {
      "name": "Bob",
      "message": "Let’s catch up later!",
      "time": "09:15 AM",
      "avatar": "https://i.pravatar.cc/150?img=2"
    },
    {
      "name": "Charlie",
      "message": "Got it, thanks!",
      "time": "Yesterday",
      "avatar": "https://i.pravatar.cc/150?img=3"
    },
    // Add more dummy chat data if needed
  ];

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
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 50,bottom: 10),
              child: Text(
                "CHAT LIST",
                style: GoogleFonts.shanti(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.h,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: chatData.length,
                itemBuilder: (context, index) {
                  final chat = chatData[index];
                  return  Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(chat["avatar"]!),
                          radius: 25,
                        ),
                        title: Text(
                          chat["name"]!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(chat["message"]!),
                        trailing: Text(
                          chat["time"]!,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return ChatScreenDoctor();
                          },));
                        },
                      ),
                      Divider(
                        thickness: 0.3,
                        indent: 10, // aligns the divider with the text
                        endIndent: 10,
                      ),
                    ],
                  );;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
