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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
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
    );
  }
}
