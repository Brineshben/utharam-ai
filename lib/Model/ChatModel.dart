class ChatHistoryModel {
  String? status;
  List<ChatMessage>? message;

  ChatHistoryModel({this.status, this.message});

  ChatHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['message'] != null) {
      message = <ChatMessage>[];
      json['message'].forEach((v) {
        message!.add(ChatMessage.fromJson(v));
      });
    }
  }
}

class ChatMessage {
  String? role;
  String? content;

  ChatMessage({this.role, this.content});

  ChatMessage.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    content = json['content'];
  }
}
