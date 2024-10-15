import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/my_search.dart';

class FriendHead extends StatelessWidget {
  const FriendHead({
    super.key,
    required this.size,
    required this.onSearchToggle,
  });

  final Size size;
  final ValueChanged<bool> onSearchToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width / 50,
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
          SizedBox(height: size.height / 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Bạn bè',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 30,
                ),
              ),
              GestureDetector(
                onTap: () => {},
                child: SvgPicture.asset(
                  "assets/icons/add new friend.svg",
                ),
              )
            ],
          ),
          SizedBox(height: size.height / 50),
          GestureDetector(
            onTap: () => {},
            child: MySearch(
              hintText: 'Tìm kiếm bạn bè...',
              onSearchToggleMySearch: onSearchToggle,
            ),
          ),
        ],
      ),
    );
  }
}
