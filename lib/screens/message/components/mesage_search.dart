import 'package:flutter/material.dart';

import '../../../contants.dart';

class MessageSearch extends StatelessWidget {
  const MessageSearch({
    super.key,
    required this.size,
    required this.image,
    required this.friendName,
  });

  final Size size;
  final String image, friendName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    friendName,
                    style: styleBody,
                  ),
                  const Text(
                    "tin nhắn phù hợp",
                    style: TextStyle(
                      color: Colors.grey,
                      // 0,0,0,1       153,153,153,1
                      fontSize: 14,
                    ),
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
