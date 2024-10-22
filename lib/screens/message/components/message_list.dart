import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mock_chat/models/message.dart';

import '../../../contants.dart';

class MessageList extends StatelessWidget {
  const MessageList({
    super.key,
    required this.size,
    required this.image,
    required this.friendName,
    required this.story,
    required this.badge,
    required this.messageContent,
  });

  final Size size;
  final String image, friendName;
  final List<MessageContent> messageContent;
  final bool story;
  final int badge;

  @override
  Widget build(BuildContext context) {
    // Lấy tin nhắn cuối cùng, bằng cách kiểm tra list có phần tử nào chưa
    final lastMessage = messageContent.isNotEmpty ? messageContent.last : null;

    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: story
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: kSecondaryColor,
                            width: 2,
                          ),
                        )
                      : null,
                  child: CircleAvatar(
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
                ),
                if (badge > 0)
                  Positioned(
                    right: -10,
                    top: 5,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 23,
                          minHeight: 23,
                        ),
                        child: Center(
                          child: Text(
                            badge > 9 ? "+9" : badge.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            friendName,
                            style: styleBody,
                          ),
                          Text(
                            lastMessage?.content ?? 'No messages yet',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        lastMessage != null
                            ? DateFormat('HH:mm').format(lastMessage.time)
                            : '',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
