import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../contants.dart';
import '../../../models/message.dart';

class BodyMessageDetails extends StatelessWidget {
  const BodyMessageDetails({
    super.key,
    required this.image,
    required this.messageContent,
    required this.size,
  });

  final String image;
  final List<MessageContent> messageContent;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: 42,
              width: 42,
            ),
          ),
        ),
        const SizedBox(width: 10),
        // Hiển thị danh sách tin nhắn
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: messageContent.length,
            itemBuilder: (context, index) {
              final message = messageContent[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width / 20,
                      vertical: size.height / 50,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(246, 246, 246, 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      message.content,
                      style: TextStyle(
                        fontSize: 16,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('HH:mm').format(message.time),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
