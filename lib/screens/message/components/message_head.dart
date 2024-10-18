import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mock_chat/screens/message/components/create_new_message.dart';

import '../../../components/my_search.dart';

class MessageHead extends StatelessWidget {
  const MessageHead({
    super.key,
    required this.size,
    required this.onSearchToggle,
  });

  final Size size;
  final ValueChanged<bool> onSearchToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 3,
      padding: EdgeInsets.symmetric(horizontal: size.height / 50),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF4356B4),
            Color(0xFF3DCFCF),
          ],
          stops: [0.1, 1],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: size.height / 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tin nhắn',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 30,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateNewMessage(),
                    ),
                  );
                },
                child: SvgPicture.asset(
                  "assets/icons/create new message.svg",
                ),
              ),
            ],
          ),
          SizedBox(height: size.height / 50),
          GestureDetector(
            onTap: () => {},
            child: MySearch(
              hintText: 'Tìm kiếm tin nhắn...',
              onSearchToggleMySearch: onSearchToggle,
            ),
          ),
        ],
      ),
    );
  }
}
