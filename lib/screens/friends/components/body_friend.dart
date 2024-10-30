import 'package:flutter/material.dart';
import 'package:mock_chat/enums.dart';
import 'package:mock_chat/screens/friends/components/all.dart';
import 'package:mock_chat/screens/friends/components/friends.dart';
import 'package:mock_chat/screens/friends/components/request.dart';
import 'package:mock_chat/screens/friends/components/sub_tab_friend.dart';
import 'package:provider/provider.dart';

import '../../../provider/friend_tab_provider.dart';

class BodyFriend extends StatefulWidget {
  const BodyFriend({super.key});

  @override
  State<BodyFriend> createState() => _BodyFriendState();
}

class _BodyFriendState extends State<BodyFriend> {
  // int _selectedIndex = 0;
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  final List<Widget> _pages = [
    Friends(),
    All(),
    Request(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final friendTabProvider = Provider.of<FriendTabProvider>(context);

    return Column(
      children: [
        SubTabFriend(
          selectedFriend: FriendState.values[friendTabProvider.selectedIndex],
          badge: 4,
        ),
        SizedBox(height: size.height / 50),
        Expanded(
          child: IndexedStack(
            index: friendTabProvider.selectedIndex,
            children: _pages,
          ),
        ),
      ],
    );
  }
}
