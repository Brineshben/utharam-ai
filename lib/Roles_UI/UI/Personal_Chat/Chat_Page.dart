import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:patient/utils/color_util.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreenDoctor extends StatefulWidget {
  const ChatScreenDoctor({super.key});

  @override
  _ChatScreenDoctorState createState() => _ChatScreenDoctorState();
}

class _ChatScreenDoctorState extends State<ChatScreenDoctor> {
  final List<types.Message> _messages = [];
  final _user = types.User(
    id: '1',
    firstName: "You",
    imageUrl: "https://yourimageurl.com/user.jpg",
  );
  final _otherUser = types.User(
    id: '2',
    firstName: "John",
    imageUrl: "https://yourimageurl.com/john.jpg",
  );

  final uuid = Uuid();
  final TextEditingController _messageController = TextEditingController();

  void _handleSendPressed() {
    if (_messageController.text.trim().isEmpty) return;

    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: uuid.v4(),
      text: _messageController.text.trim(),
      metadata: {"status": "sent"},
    );

    setState(() {
      _messages.insert(0, textMessage);
    });

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Chat Header
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              height: 70.h,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios_sharp, color: Colors.grey),
                    SizedBox(width: 10),
                    CircleAvatar(
                      backgroundImage: NetworkImage(_otherUser.imageUrl!),
                      radius: 20,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("John Doe",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                        Text("Online",
                            style: TextStyle(fontSize: 14, color: Colorutils.userdetailcolor)),
                      ],
                    ),
                    Spacer(),
                    // Icon(Icons.video_camera_front_outlined, color: Colors.green),
                    SizedBox(width: 10),
                    Icon(Icons.call, color: Colorutils.userdetailcolor),
                    SizedBox(width: 10),
                    Icon(Icons.menu, color: Colorutils.userdetailcolor),
                  ],
                ),
              ),
            ),
          ),
          // Chat Body
          Expanded(
            child: Chat(
              messages: _messages,
              onSendPressed: (_) {},
              user: _user,
              theme: const DefaultChatTheme(
                inputBackgroundColor: Colors.white,
                inputTextColor: Colors.black,
                primaryColor: Colors.green,
                backgroundColor: Colors.white,
                receivedMessageBodyTextStyle: TextStyle(color: Colors.black),
                sentMessageBodyTextStyle: TextStyle(color: Colors.white),
              ),
              bubbleBuilder: (child, {required message, required nextMessageInGroup}) {
                return _buildMessageBubble(message);
              },
              customBottomWidget: _buildCustomInputField(),
            ),
          ),
        ],
      ),
    );
  }

  // Message Bubble Builder
  Widget _buildMessageBubble(types.Message message) {
    return Row(
      mainAxisAlignment: message.author.id == _user.id
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        if (message.author.id != _user.id)
          CircleAvatar(
            backgroundImage: message.author.imageUrl != null
                ? NetworkImage(message.author.imageUrl!)
                : AssetImage('assets/default_avatar.png') as ImageProvider,
            radius: 15,
          ),
        SizedBox(width: 8), // Adds spacing between avatar and bubble
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7, // Max width for the bubble
          ),
          decoration: BoxDecoration(
            color: message.author.id == _user.id ? Colors.green : Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMessageContent(message),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "12:30 PM", // Replace with actual timestamp formatting
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                    SizedBox(width: 5),
                    if (message.author.id == _user.id)
                      Icon(
                        message.metadata?["status"] == "sent"
                            ? Icons.check
                            : Icons.done_all,
                        color: message.metadata?["status"] == "seen"
                            ? Colors.blue
                            : Colors.white,
                        size: 18,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Message Content Builder
  Widget _buildMessageContent(types.Message message) {
    if (message is types.TextMessage) {
      return Text(
        message.text,
        style: TextStyle(
          color: message.author.id == _user.id ? Colors.white : Colors.black,
        ),
      );
    } else if (message is types.ImageMessage) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          message.uri,
          width: 200,
          height: 150,
          fit: BoxFit.cover,
        ),
      );
    } else if (message is types.FileMessage) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.insert_drive_file, color: Colors.white),
          SizedBox(height: 5),
          Text(
            message.name,
            style: TextStyle(
              fontSize: 14,
              color: message.author.id == _user.id ? Colors.white : Colors.black,
            ),
          ),
        ],
      );
    } else {
      return Text(
        "Unsupported message type",
        style: TextStyle(color: Colors.red),
      );
    }
  }

  // Custom Message Input Field
  Widget _buildCustomInputField() {
    return Padding(
      padding: const EdgeInsets.only(left: 5,right: 5,bottom: 2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.emoji_emotions_outlined, color: Colors.white54),
              onPressed: () {},
            ),
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
            IconButton(
              icon: const Icon(Icons.attach_file, color: Colors.white54),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.camera_alt_outlined, color: Colors.white54),
              onPressed: () {},
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colorutils.userdetailcolor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.send_sharp, color: Colors.white),
                onPressed: _handleSendPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
