import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageList extends StatelessWidget {
  const MessageList({
    super.key,
    required this.size,
    required this.image,
    required this.friendName,
    required this.time,
    required this.messageContent,
  });

  final Size size;
  final String image, friendName;
  final DateTime time;
  final String messageContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: size.height / 50),
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: 58,
                  height: 58,
                ),
              ),
            ),
            SizedBox(width: size.width / 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    friendName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    messageContent,
                    style: const TextStyle(
                      color: Colors.grey,
                      // 0,0,0,1       153,153,153,1
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Text(DateFormat('HH:mm').format(time)),
          ],
        ),
        SizedBox(height: size.height / 100),
      ],
    );
  }
}
