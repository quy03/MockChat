import 'package:flutter/material.dart';
import 'package:mock_chat/screens/message/components/create_new_message.dart';

import '../../../components/my_search.dart';
import '../contants.dart';

class PrimaryScreenAppbar extends StatelessWidget {
  const PrimaryScreenAppbar({
    super.key,
    required this.size,
    required this.onSearchToggle,
    required this.text,
    required this.hintText,
    required this.push,
  });

  final Size size;
  final ValueChanged<bool> onSearchToggle;
  final String text, hintText;
  final Widget push;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 3,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: const BoxDecoration(
        gradient: kPrimaryGradientColor,
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: kPrimaryLightColor,
                  fontSize: 30,
                ),
              ),
              push,
            ],
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () => {},
            child: MySearch(
              hintText: hintText,
              onSearchToggleMySearch: onSearchToggle,
            ),
          ),
        ],
      ),
    );
  }
}
