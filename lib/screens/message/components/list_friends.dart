import 'package:flutter/material.dart';

import '../../../components/button_checkbox.dart';

class ListFriends extends StatelessWidget {
  const ListFriends({
    super.key,
    required this.image,
    required this.fullname,
  });
  final String image, fullname;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: 35,
                  height: 35,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        fullname,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      ButtonCheckbox(),
                    ],
                  ),
                  SizedBox(height: 20),
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
