import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyListTitle extends StatelessWidget {
  const MyListTitle({
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
              backgroundImage: AssetImage(
                image,
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
