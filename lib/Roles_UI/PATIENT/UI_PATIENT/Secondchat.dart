// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:http/http.dart' as http;
// import 'package:lottie/lottie.dart';
// import 'package:uuid/uuid.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../utils/Constants.dart';
// import '../../../utils/color_util.dart';
// import '../../UI/Common_Widget/popups.dart';
//
// class ChatScreen2 extends StatefulWidget {
//   final String role;
//   final int userid;
//   final String name;
//   final String date;
//   final String patientId;
//   final String tokenPatient;
//
//   const ChatScreen2({
//     super.key,
//     required this.role,
//     required this.name,
//     required this.date,
//     required this.patientId,
//     required this.tokenPatient, required this.userid,
//   });
//
//   @override
//   _ChatScreen2State createState() => _ChatScreen2State();
// }
//
// class _ChatScreen2State extends State<ChatScreen2> {
//   bool _isAwaitingResponse = false;
//
//   final TextEditingController _messageController = TextEditingController();
//   List<types.Message> _messages = [];
//   final _user = types.User(id: '1');
//   final _otherUser = types.User(id: '2', firstName: 'MetroMind AI');
//   // final String _apiUrl = "http://192.168.1.29:8000/accounts/psychiatrist_chat/";
//   final String _apiUrl = "https://metromind-web-backend-euh0gkdwg9deaudd.uaenorth-01.azurewebsites.net/accounts/preliminary-chat/";
//
//   String? sessionId;
//
//   void _sendMessage(types.PartialText message, {bool switchPress = false}) async {
//     print("Sending: ${message.text}");
//
//     final msg = types.TextMessage(
//       id: const Uuid().v4(),
//       author: _user,
//       text: message.text,
//       createdAt: DateTime.now().millisecondsSinceEpoch,
//     );
//
//     setState(() {
//       _messages.insert(0, msg);
//     });
//
//     final typingIndicator = types.TextMessage(
//       id: 'typing',
//       author: _otherUser,
//       text: 'Typing...',
//       createdAt: DateTime.now().millisecondsSinceEpoch,
//     );
//
//     setState(() {
//       _messages.insert(0, typingIndicator);
//     });
//
//     Map<String, dynamic> requestBody = {
//       'message': message.text,
//     };
//
//     if (sessionId != null && sessionId!.isNotEmpty) {
//       requestBody['session_id'] = sessionId;
//       requestBody['switch_press'] = switchPress;
//     }
//
//     final response = await http.post(
//       Uri.parse(_apiUrl),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer ${widget.tokenPatient}',
//       },
//       body: jsonEncode(requestBody),
//     );
//
//     if (response.statusCode == 200) {
//       final responseData = jsonDecode(utf8.decode(response.bodyBytes));
//       print("Response: $responseData");
//
//       sessionId = responseData['session_id'];
//
//       // Remove the typing indicator
//       setState(() {
//         _messages.removeWhere((msg) => msg.id == 'typing');
//       });
//
//       final replyMsg = types.TextMessage(
//         id: const Uuid().v4(),
//         author: _otherUser,
//         text: responseData['message'],
//         createdAt: DateTime.now().millisecondsSinceEpoch,
//       );
//
//       setState(() {
//         _messages.insert(0, replyMsg);
//       });
//
//       if (responseData['switch_press'] == true) {
//         // Navigator.pushReplacement(
//         //   context,
//         //   MaterialPageRoute(
//         //     builder: (context) => PageIndexNavigationPatient(
//         //       tokenPatient: Get.find<UserAuthController>()
//         //           .loginData
//         //           .value
//         //           ?.data
//         //           ?.accessToken ??
//         //           "",
//         //       role: widget.role,
//         //       name: widget.name,
//         //       date: widget.date,
//         //       patientId: widget.patientId,
//         //       userid: widget.userid,
//         //     ),
//         //   ),
//         // );
// Get.back();
//         ProductAppPopUps.submit(
//           title: "Success",
//           message:
//           "Thanks for your valuable input. Please wait while our therapist reviews your report. We will notify you soon!",
//           actionName: "Close",
//           iconData: Icons.done,
//           iconColor: Colorutils.userdetailcolor,
//         );
//       }
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: systemUiOverlayStyleDark,
//       child: Scaffold(
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 130.h,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(
//                     width: 0.2, color: Colorutils.userdetailcolor),
//                 gradient: LinearGradient(
//                   colors: [Colors.blue.shade50, Colors.white],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.blue.withOpacity(0.3),
//                     blurRadius: 0.1,
//                     spreadRadius: 0.1,
//                     offset: Offset(0, 1),
//                   ),
//                 ],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 50),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         SizedBox(width: 12.w),
//                         SizedBox(width: 12.w),
//                         CircleAvatar(
//                           radius:20,
//                           backgroundColor: Colors.transparent,
//                           backgroundImage: AssetImage('assets/images/Utaram3d_Logo.png',),
//                         ),
//                         SizedBox(width: 10.w),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'MetroMind Bot',
//                                 style: TextStyle(
//                                   fontFamily: 'Inter',
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 18.h,
//                                   color: Colors.black.withOpacity(0.9),
//                                 ),
//                               ),
//                               Text(
//                                 'online',
//                                 style: TextStyle(
//                                   fontFamily: 'Inter',
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14.h,
//                                   color: Colorutils.userdetailcolor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(width: 12.w),
//                         GestureDetector(
//                           onTap: (){
//                             // Navigator.pushReplacement(
//                             //   context,
//                             //   MaterialPageRoute(
//                             //     builder: (context) => PageIndexNavigationPatient(
//                             //       tokenPatient: Get.find<UserAuthController>()
//                             //           .loginData
//                             //           .value
//                             //           ?.data
//                             //           ?.accessToken ??
//                             //           "",
//                             //       role: widget.role,
//                             //       name: widget.name,
//                             //       date: widget.date,
//                             //       patientId: widget.patientId, userid: widget.userid,
//                             //     ),
//                             //   ),
//                             // );
//                             FocusScope.of(context).unfocus();
//
//                             _sendMessage(
//                               types.PartialText(text: "Generate utharamAI report"),
//                               switchPress: true,
//                             );
//                           },
//                           child: Card(
//                             color: Colors.white,
//
//                             elevation: 4,
//                             shape: RoundedRectangleBorder(
//
//                               borderRadius: BorderRadius.circular(40), // circular for round shape
//                             ),
//                             child: Container(
//                               width: 50,
//                               height: 50,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(40),
//                               ),
//                               child: Lottie.asset(
//                                 "assets/images/genAI (1).json",
//                                 fit: BoxFit.fitHeight,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 18.w),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Chat(
//                 showUserAvatars: true,
//                 showUserNames: true,
//                 inputOptions: InputOptions(
//                   sendButtonVisibilityMode: SendButtonVisibilityMode.always,
//                 ),
//                 messages: _messages,
//                 onSendPressed: (_) {}, // Not needed because we use a custom input
//                 user: _user,
//                 theme: const DefaultChatTheme(
//                   primaryColor: Colorutils.userdetailcolor,
//                   sentMessageBodyTextStyle: TextStyle(color: Colors.white),
//                   receivedMessageBodyTextStyle: TextStyle(color: Colors.black),
//                 ),
//                 customBottomWidget: _buildCustomInputField(),
//                 emptyState: Center(
//                   child: Text(
//                     "Healing begins with utharam....",
//                     style: TextStyle(color: Colors.grey, fontSize: 15),
//                   ),
//                 ),
//                 avatarBuilder: _customAvatarBuilder,
//               ),
//             ),
//           ],
//         ),
//         // floatingActionButton:  GestureDetector(
//         //   onDoubleTap: () {
//         //     // Navigator.push(context, MaterialPageRoute(builder: (context) { return
//         //     //   ChatScreen(patientToken:widget.tokenPatient,);
//         //     //
//         //     // },));
//         //   },
//         //   child: GestureDetector(
//         //     onTap: (){
//         //       _sendMessage(
//         //         types.PartialText(text: ""),
//         //         switchPress: true,
//         //       );
//         //     },
//         //     child: Padding(
//         //       padding: const EdgeInsets.only(bottom: 200),
//         //       child: Card(
//         //         color: Colors.white,
//         //
//         //         elevation: 4,
//         //         shape: RoundedRectangleBorder(
//         //
//         //           borderRadius: BorderRadius.circular(40), // circular for round shape
//         //         ),
//         //         child: Container(
//         //           width: 65,
//         //           height: 65,
//         //           decoration: BoxDecoration(
//         //             borderRadius: BorderRadius.circular(40),
//         //           ),
//         //           child: Lottie.asset(
//         //             "assets/images/Splash ScreenLQ.json",
//         //             fit: BoxFit.fitHeight,
//         //           ),
//         //         ),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//         // floatingActionButton: Padding(
//         //   padding: const EdgeInsets.only(bottom: 80),
//         //   child: FloatingActionButton.extended(
//         //     onPressed: () {
//         //       _sendMessage(
//         //         types.PartialText(text: ""),
//         //         switchPress: true,
//         //       );
//         //     },
//         //     label: Text('Generate Report'),
//         //     backgroundColor: Colors.blue,
//         //   ),
//         // ),
//       ),
//     );
//   }
//
//   Widget _buildCustomInputField() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
//         decoration: BoxDecoration(
//           color: Colors.grey[900],
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: Row(
//           children: [
//             SizedBox(width: 10),
//             Expanded(
//               child: TextField(
//                 controller: _messageController,
//                 decoration: const InputDecoration(
//                   hintText: "Message",
//                   hintStyle: TextStyle(color: Colors.white54),
//                   border: InputBorder.none,
//                 ),
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             Container(
//               decoration: const BoxDecoration(
//                 color: Colorutils.userdetailcolor,
//                 shape: BoxShape.circle,
//               ),
//               child: IconButton(
//                 icon: const Icon(Icons.send_sharp, color: Colors.white),
//                 onPressed: () {
//                   if (_messageController.text.trim().isNotEmpty) {
//                     _sendMessage(
//                       types.PartialText(text: _messageController.text),
//                     );
//                     _messageController.clear();
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// Widget _customAvatarBuilder(types.User user) {
//   if (user.id == '2') {
//     return Padding(
//       padding: const EdgeInsets.only(right: 4),
//       child: CircleAvatar(
//         radius: 12,
//         backgroundColor: Colors.white,
//         backgroundImage: AssetImage('assets/images/Utaram3d_Logo.png',),
//       ),
//     );
//   } else {
//     return CircleAvatar(
//       backgroundColor: Colors.grey,
//       child: Text(
//         user.firstName?.substring(0, 1).toUpperCase() ?? 'U',
//         style: TextStyle(color: Colors.white),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Model/ChatModel.dart';
import '../../../Service/SharedPreference.dart';
import '../../../utils/Constants.dart';
import '../../../utils/color_util.dart';

import '../../UI/Common_Widget/popups.dart';

class ChatScreen2 extends StatefulWidget {
  final String role;
  final int userid;
  final String name;
  final String date;
  final String patientId;
  final String tokenPatient;

  const ChatScreen2({
    super.key,
    required this.role,
    required this.name,
    required this.date,
    required this.patientId,
    required this.tokenPatient,
    required this.userid,
  });

  @override
  _ChatScreen2State createState() => _ChatScreen2State();
}

class _ChatScreen2State extends State<ChatScreen2> {
  bool _isAwaitingResponse = false;

  final TextEditingController _messageController = TextEditingController();
  List<types.Message> _messages = [];
  final _user = types.User(id: '1');
  final _otherUser = types.User(id: '2', firstName: 'MetroMind AI');

  // final String _apiUrl = "http://192.168.1.29:8000/accounts/psychiatrist_chat/";
  final String _apiUrl =
      "https://metromind-web-backend-euh0gkdwg9deaudd.uaenorth-01.azurewebsites.net/accounts/preliminary-chat/";

  String? sessionId2;
  Future<void> _loadChatHistory() async {
    final url = "https://metromind-web-backend-euh0gkdwg9deaudd.uaenorth-01.azurewebsites.net/accounts/diagnosis/chat-history/${widget.userid}/";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${widget.tokenPatient}',
        },
      );
      print("RESPONSE STATUS: ${response.statusCode}");
      print("RESPONSE BODY: ${utf8.decode(response.bodyBytes)}");
      if (response.statusCode == 200) {
        final data = ChatHistoryModel.fromJson(jsonDecode(response.body));

        if (data.message != null) {
          final historyMessages = data.message!.map((msg) {

            return types.TextMessage(
              id: const Uuid().v4(),
              author: msg.role == "user" ? _user : _otherUser,
              text: msg.content?.toString().replaceAll(RegExp(r'[^\x00-\x7F]'), '') ?? "",

              createdAt: DateTime.now().millisecondsSinceEpoch,
            );
          }).toList();

          setState(() {
            _messages.insertAll(0, historyMessages.reversed); // oldest first
          });
        }
      } else {
        print("Failed to load chat history: ${response.statusCode}");
      }
    } catch (e) {
      print("Error loading chat history: $e");
    }
  }
  @override
  void initState() {
    _loadChatHistory();

    _loadSessionId2();
    super.initState();
  }

  // void _sendMessage(types.PartialText message, {bool switchPress = false}) async {
  //   if (_isAwaitingResponse) return; // prevent sending if awaiting response
  //   _isAwaitingResponse = true;
  //
  //   final msg = types.TextMessage(
  //     id: const Uuid().v4(),
  //     author: _user,
  //     text: message.text,
  //     createdAt: DateTime.now().millisecondsSinceEpoch,
  //   );
  //
  //   setState(() {
  //     _messages.insert(0, msg);
  //   });
  //
  //   final typingIndicator = types.TextMessage(
  //
  //     id: 'typing',
  //     author: _otherUser,
  //     text: 'Thinking...',
  //     createdAt: DateTime.now().millisecondsSinceEpoch,
  //   );
  //
  //   setState(() {
  //     _messages.insert(0, typingIndicator);
  //   });
  //
  //   Map<String, dynamic> requestBody = {'message': message.text};
  //
  //   if (sessionId != null && sessionId!.isNotEmpty) {
  //     requestBody['session_id'] = sessionId;
  //     requestBody['switch_press'] = switchPress;
  //   }
  //
  //   try {
  //     final response = await http.post(
  //       Uri.parse(_apiUrl),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer ${widget.tokenPatient}',
  //       },
  //       body: jsonEncode(requestBody),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final responseData = jsonDecode(utf8.decode(response.bodyBytes));
  //       sessionId = responseData['session_id'];
  //
  //       setState(() {
  //         _messages.removeWhere((msg) => msg.id == 'typing');
  //       });
  //
  //       final replyMsg = types.TextMessage(
  //         id: const Uuid().v4(),
  //         author: _otherUser,
  //         text: responseData['message'],
  //         createdAt: DateTime.now().millisecondsSinceEpoch,
  //       );
  //
  //       setState(() {
  //         _messages.insert(0, replyMsg);
  //       });
  //
  //       if (responseData['switch_press'] == true) {
  //         Get.back();
  //         // Navigator.pushReplacement(
  //         //   context,
  //         //   MaterialPageRoute(
  //         //     builder: (context) => PageIndexNavigationPatient(
  //         //       tokenPatient: Get.find<UserAuthController>()
  //         //           .loginData
  //         //           .value
  //         //           ?.data
  //         //           ?.accessToken ??
  //         //           "",
  //         //       role: widget.role,
  //         //       name: widget.name,
  //         //       date: widget.date,
  //         //       patientId: widget.patientId,
  //         //       userid: widget.userid,
  //         //     ),
  //         //   ),
  //         // );
  //
  //         ProductAppPopUps.submit(
  //           title: "Success",
  //           message:
  //           "Thanks for your valuable input. Please wait while our therapist reviews your report. We will notify you soon!",
  //           actionName: "Close",
  //           iconData: Icons.done,
  //           iconColor: Colorutils.userdetailcolor,
  //         );
  //       }
  //     }
  //   } catch (e) {
  //     print("Error sending message: $e");
  //   } finally {
  //     _isAwaitingResponse = false;
  //   }
  // }

  void _loadSessionId2() async {
    sessionId2 = await SharedPrefrence2().getSessionId2();
  }

  void _sendMessage(types.PartialText message,
      {bool switchPress = false}) async {
    if (_isAwaitingResponse) return;
    _isAwaitingResponse = true;

    final msg = types.TextMessage(
      id: const Uuid().v4(),
      author: _user,
      text: message.text,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    setState(() {
      _messages.insert(0, msg);
    });

    final typingIndicator = types.TextMessage(
      id: 'typing',
      author: _otherUser,
      text: 'Thinking...',
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );

    setState(() {
      _messages.insert(0, typingIndicator);
    });

    Map<String, dynamic> requestBody = {'message': message.text};

    if (sessionId2 != null && sessionId2!.isNotEmpty) {
      requestBody['session_id'] = sessionId2;
      requestBody['switch_press'] = switchPress;
    }

    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${widget.tokenPatient}',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(utf8.decode(response.bodyBytes));
        sessionId2 = responseData['session_id'];

        // Save session ID
        await SharedPrefrence2().setSessionId2(sessionId2!);

        setState(() {
          _messages.removeWhere((msg) => msg.id == 'typing');
        });

        final replyMsg = types.TextMessage(
          id: const Uuid().v4(),
          author: _otherUser,
          text: responseData['message'],
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );

        setState(() {
          _messages.insert(0, replyMsg);
        });

        if (responseData['switch_press'] == true) {
          await SharedPrefrence2().clearSessionId2();
          Get.back();

          ProductAppPopUps.submit(
            title: "Success",
            message:
                "Thanks for your valuable input. Please wait while our therapist reviews your report. We will notify you soon!",
            actionName: "Close",
            iconData: Icons.done,
            iconColor: Colorutils.userdetailcolor,
          );
        }
      }
    } catch (e) {
      print("Error sending message: $e");
    } finally {
      _isAwaitingResponse = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return ProductAppPopUps.chatStopDialog(context: context);
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: systemUiOverlayStyleDark,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 130.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border.all(width: 0.2, color: Colorutils.userdetailcolor),
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade50, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 0.1,
                      spreadRadius: 0.1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 12.w),
                          SizedBox(width: 12.w),
                          GestureDetector(
                            onTap: () async {
                              await SharedPrefrence2().clearSessionId2();                          },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage(
                                'assets/images/Utaram3d_Logo.png',
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'MetroMind AI',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.h,
                                    color: Colors.black.withOpacity(0.9),
                                  ),
                                ),
                                Text(
                                  'online',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.h,
                                    color: Colorutils.userdetailcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 2.w),
                          GestureDetector(child: Icon(Icons.info_outline,color: Colors.grey,),onTap: (){

                            Get.dialog(
                              AlertDialog(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                title:  Text(
                                  "Instructions",
                                  style: TextStyle(
                                    fontSize: 20.h,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  [
                                      Text(
                                        "1.Start by sharing your feelings and thoughts with this psychologist chatbot.",
                                        style: TextStyle(fontSize: 15.h, color: Colors.black),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "2.The chatbot needs sufficient data from your conversation to generate a meaningful report",
                                        style: TextStyle(fontSize:15.h, color: Colors.black),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "3.Generate Report button will become active only after enough interaction",
                                        style: TextStyle(fontSize: 15.h, color: Colors.black),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "4.Once the report is generated, you'll be redirected to your dashboard",
                                        style: TextStyle(fontSize: 15.h, color: Colors.black),
                                      ),

                                    ],
                                  ),
                                ),
                                actionsAlignment: MainAxisAlignment.center,
                                actions: [
                                  FilledButton(
                                    onPressed: () {
                                      Get.back(); // close dialog
                                    },
                                    child: const Text(
                                      "Got it!",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            );

                          },),
                          SizedBox(width: 12.w),

                          GestureDetector(
                            onTap: () {
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => PageIndexNavigationPatient(
                              //       tokenPatient: Get.find<UserAuthController>()
                              //           .loginData
                              //           .value
                              //           ?.data
                              //           ?.accessToken ??
                              //           "",
                              //       role: widget.role,
                              //       name: widget.name,
                              //       date: widget.date,
                              //       patientId: widget.patientId, userid: widget.userid,
                              //     ),
                              //   ),
                              // );
                              FocusScope.of(context).unfocus();

                              _sendMessage(
                                types.PartialText(
                                    text: "Generate utharamAI report"),
                                switchPress: true,
                              );
                            },
                            child: Card(
                              color: Colors.white,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    40), // circular for round shape
                              ),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Lottie.asset(
                                  "assets/images/genAI (1).json",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 18.w),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Chat(
                  showUserAvatars: true,
                  showUserNames: true,
                  inputOptions: InputOptions(
                    sendButtonVisibilityMode: SendButtonVisibilityMode.always,
                  ),
                  messages: _messages,
                  onSendPressed: (_) {},
                  // Not needed because we use a custom input
                  user: _user,
                  theme: const DefaultChatTheme(
                    primaryColor: Colorutils.userdetailcolor,
                    sentMessageBodyTextStyle: TextStyle(color: Colors.white),
                    receivedMessageBodyTextStyle: TextStyle(color: Colors.black),
                  ),
                  customBottomWidget: _buildCustomInputField(),
                  emptyState: Center(
                    child: Text(
                      "Healing begins with utharam....",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                  avatarBuilder: _customAvatarBuilder,
                ),
              ),
            ],
          ),
          // floatingActionButton:  GestureDetector(
          //   onDoubleTap: () {
          //     // Navigator.push(context, MaterialPageRoute(builder: (context) { return
          //     //   ChatScreen(patientToken:widget.tokenPatient,);
          //     //
          //     // },));
          //   },
          //   child: GestureDetector(
          //     onTap: (){
          //       _sendMessage(
          //         types.PartialText(text: ""),
          //         switchPress: true,
          //       );
          //     },
          //     child: Padding(
          //       padding: const EdgeInsets.only(bottom: 200),
          //       child: Card(
          //         color: Colors.white,
          //
          //         elevation: 4,
          //         shape: RoundedRectangleBorder(
          //
          //           borderRadius: BorderRadius.circular(40), // circular for round shape
          //         ),
          //         child: Container(
          //           width: 65,
          //           height: 65,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(40),
          //           ),
          //           child: Lottie.asset(
          //             "assets/images/Splash ScreenLQ.json",
          //             fit: BoxFit.fitHeight,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // floatingActionButton: Padding(
          //   padding: const EdgeInsets.only(bottom: 80),
          //   child: FloatingActionButton.extended(
          //     onPressed: () {
          //       _sendMessage(
          //         types.PartialText(text: ""),
          //         switchPress: true,
          //       );
          //     },
          //     label: Text('Generate Report'),
          //     backgroundColor: Colors.blue,
          //   ),
          // ),
        ),
      ),
    );
  }

  Widget _buildCustomInputField() {
    return Padding(
      padding: const EdgeInsets.only(left: 8,right: 8,bottom: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  hintText: "Message",
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: _isAwaitingResponse
                    ? Colors.grey
                    : Colorutils.userdetailcolor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.send_sharp,
                  color: _isAwaitingResponse ? Colors.white : Colors.white,
                ),
                onPressed: _isAwaitingResponse
                    ? null
                    : () {
                        if (_messageController.text.trim().isNotEmpty) {
                          _sendMessage(
                            types.PartialText(text: _messageController.text),
                          );
                          _messageController.clear();
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

Widget _customAvatarBuilder(types.User user) {
  if (user.id == '2') {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: CircleAvatar(
        radius: 12,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(
          'assets/images/Utaram3d_Logo.png',
        ),
      ),
    );
  } else {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      child: Text(
        user.firstName?.substring(0, 1).toUpperCase() ?? 'U',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
