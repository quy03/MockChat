import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      height: size.height,
      padding: EdgeInsets.symmetric(
        horizontal: size.width / 30,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF4356B4),
            Color(0xFF3DCFCF),
          ],
          stops: [0.1, 0.4],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: size.height / 50),
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
                onTap: () => {},
                child: SvgPicture.asset(
                  "assets/icons/create new message.svg",
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => {},
            child: MySearch(
              hintText: 'Tìm kiếm tin nhắn...',
              onSearchToggle: onSearchToggle,
            ),
          ),
        ],
      ),
    );
  }
}