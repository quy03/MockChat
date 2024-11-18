import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:mock_chat/models/message.dart';

class BodyMessageDetails extends StatelessWidget {
  final String conversationId;
  final String friendName;
  final String image;
  final Size size;

  const BodyMessageDetails({
    super.key,
    required this.conversationId,
    required this.friendName,
    required this.image,
    required this.size,
    required List<MessageContent> messageContent,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // Lắng nghe dữ liệu tin nhắn từ Firebase Realtime Database
      stream: FirebaseDatabase.instance
          .ref("messages/$conversationId")
          .orderByChild("timestamp")
          .onValue,
      builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
        if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
          // Chuyển đổi dữ liệu tin nhắn từ dạng Map thành List để hiển thị
          final messages =
              (snapshot.data!.snapshot.value as Map).values.toList();

          // Sắp xếp tin nhắn theo thời gian
          messages.sort((a, b) => a['timestamp'].compareTo(b['timestamp']));

          return ListView.builder(
            padding: EdgeInsets.only(bottom: size.height * 0.1),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              final isSentByCurrentUser = message['senderId'] ==
                  'currentUserId'; // Kiểm tra nếu tin nhắn là của người dùng hiện tại
              final timestamp = DateTime.parse(message['timestamp']);
              final formattedTime = DateFormat('HH:mm').format(timestamp);

              return Align(
                alignment: isSentByCurrentUser
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: isSentByCurrentUser ? Colors.blue : Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message['content'],
                        style: TextStyle(
                          color:
                              isSentByCurrentUser ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        formattedTime,
                        style: TextStyle(
                          fontSize: 10,
                          color: isSentByCurrentUser
                              ? Colors.white70
                              : Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          // Hiển thị khi không có tin nhắn
          return Center(
            child: Text("Không có tin nhắn nào"),
          );
        }
      },
    );
  }
}
