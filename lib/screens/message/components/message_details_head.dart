import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../contants.dart';

class MessageDetailsHead extends StatelessWidget {
  const MessageDetailsHead({
    super.key,
    required this.size,
    required this.image,
    required this.friendName,
  });

  final Size size;
  final String image;
  final String friendName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                "assets/icons/backward-arrow.svg",
                height: 24,
                width: 24,
              ),
            ),
            SizedBox(width: 20),
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
            SizedBox(width: 20),
            Text(
              friendName,
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
