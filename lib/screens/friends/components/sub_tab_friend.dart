import 'package:flutter/material.dart';
import 'package:mock_chat/enums.dart';

class SubTabFriend extends StatelessWidget {
  const SubTabFriend({
    super.key,
    required this.selectedFriend,
    required this.onItemTapped,
    required this.badge,
  });

  final FriendState selectedFriend;
  final Function(int) onItemTapped;
  final int badge;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(height: size.height / 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Tab "BẠN BÈ"
            GestureDetector(
              onTap: () {
                onItemTapped(0);
              },
              child: Column(
                children: [
                  Text(
                    "BẠN BÈ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedFriend == FriendState.friends
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            // Tab "TẤT CẢ"
            GestureDetector(
              onTap: () {
                onItemTapped(1);
              },
              child: Column(
                children: [
                  Text(
                    "TẤT CẢ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedFriend == FriendState.all
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            // Tab "YÊU CẦU"
            GestureDetector(
              onTap: () {
                onItemTapped(2);
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "YÊU CẦU",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedFriend == FriendState.request
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "$badge",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
        // Đường kẻ bên dưới
        Row(
          children: [
            Expanded(
              child: Container(
                height: 2,
                color: selectedFriend == FriendState.friends
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Expanded(
              child: Container(
                height: 2,
                color: selectedFriend == FriendState.all
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Expanded(
              child: Container(
                height: 2,
                color: selectedFriend == FriendState.request
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
