import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mock_chat/core/locale_keys.dart';
import 'package:mock_chat/models/message.dart';
import 'package:mock_chat/screens/friends/components/body_friend.dart';
import 'package:mock_chat/screens/friends/components/friend_search.dart';

import '../../components/primary_screen_appbar.dart';

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
            SizedBox(
              width: size.width,
              height: size.height,
            ),
            Positioned(
              child: PrimaryScreenAppbar(
                size: size,
                onSearchToggle: _toggleSearch,
                text: tr(LocaleKeys.Friends),
                hintText: tr(LocaleKeys.SearchFriends),
                push: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => CreateNewMessage(),
                    //   ),
                    // );
                  },
                  child: SvgPicture.asset(
                    "assets/icons/create new message.svg",
                  ),
                ),
              ),
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
            tr(LocaleKeys.Friends),
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: demoMessage.length,
            itemBuilder: (context, index) {
              final friend = demoMessage[index];
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
