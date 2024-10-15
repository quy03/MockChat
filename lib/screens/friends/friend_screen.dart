import 'package:flutter/material.dart';
import 'package:mock_chat/models/massage.dart';
import 'package:mock_chat/screens/friends/components/body_friend.dart';
import 'package:mock_chat/screens/friends/components/friend_head.dart';
import 'package:mock_chat/screens/friends/components/friend_search.dart';

class FriendScreen extends StatefulWidget {
  const FriendScreen({super.key});

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  bool _isSearching = false;

  // Hàm để chuyển đổi trạng thái tìm kiếm
  void _toggleSearch(bool value) {
    setState(() {
      _isSearching = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            FriendHead(
              size: size,
              onSearchToggle: _toggleSearch,
            ),
            Positioned(
              top: size.height / 5,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: _isSearching ? _buildSearchFriend(size) : BodyFriend(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildSearchFriend(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height / 40),
        Padding(
          padding: EdgeInsets.only(left: size.width / 30),
          child: Text(
            "BẠN BÈ",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: demoMassage.length,
            itemBuilder: (context, index) {
              final friend = demoMassage[index];
              return FriendSearch(
                size: size,
                image: friend.image,
                friendName: friend.friendName,
              );
            },
          ),
        ),
      ],
    );
  }
}
