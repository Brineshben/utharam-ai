// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class TaskListScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> tasks = [
//     {
//       "title": "Maintenance Check - HVAC System",
//       "status": ["High", "In Progress"],
//       "dueDate": "Aug 25",
//       "assignedTo": "Rashid Al Zayd",
//       "profileImage": "assets/profile.jpg", // Replace with actual image
//       "comments": 3,
//       "bgColor": Colors.amber.shade100,
//     },
//     {
//       "title": "Inventory Audit",
//       "status": ["In Progress", "Done"],
//       "dueDate": "Aug 25",
//       "assignedTo": "Rashid Al Zayd",
//       "profileImage": "assets/profile.jpg",
//       "comments": 3,
//       "bgColor": Colors.green.shade100,
//     }
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ListView.builder(
//         itemCount: tasks.length,
//         itemBuilder: (context, index) {
//           final task = tasks[index];
//           return Container(
//             width: 349,
//             margin: EdgeInsets.only(left: 10,right: 10,bottom: 5),
//             padding: EdgeInsets.all(15),
//             decoration: BoxDecoration(
//               color: task["bgColor"],
//               borderRadius: BorderRadius.circular(14),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   task["title"],
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(height: 5),
//                 Row(
//                   children: [
//                 Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//             decoration: BoxDecoration(
//               color: color.withOpacity(0.2),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Text(
//               text,
//               style: TextStyle(color: color, fontWeight: FontWeight.bold),
//             ),
//           );
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Icon(Icons.calendar_today, size: 16),
//                     SizedBox(width: 5),
//                     Text("Due date: ${task["dueDate"]}"),
//                   ],
//                 ),
//                 SizedBox(height: 5),
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 12,
//                       backgroundImage: AssetImage(task["profileImage"]),
//                     ),
//                     SizedBox(width: 5),
//                     Text("Assigned to ${task["assignedTo"]}"),
//                     Spacer(),
//                     Icon(Icons.edit, size: 18),
//                     SizedBox(width: 5),
//                     Text(task["comments"].toString()),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }