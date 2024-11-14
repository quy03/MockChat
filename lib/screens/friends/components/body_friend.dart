import 'package:flutter/material.dart';
import 'package:mock_chat/enums.dart';
import 'package:mock_chat/provider/friend_tab_provider.dart';
import 'package:mock_chat/screens/friends/components/all.dart';
import 'package:mock_chat/screens/friends/components/friends.dart';
import 'package:mock_chat/screens/friends/components/request.dart';
import 'package:mock_chat/screens/friends/components/sub_tab_friend.dart';
import 'package:provider/provider.dart';

class BodyFriend extends StatefulWidget {
  const BodyFriend({super.key});

  @override
  State<BodyFriend> createState() => _BodyFriendState();
}

class _BodyFriendState extends State<BodyFriend> {
  final List<Widget> _pages = [
    Friends(),
    All(),
    Request(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (_) => FriendTabProvider(),
      child: Column(
        children: [
          Consumer<FriendTabProvider>(
            builder: (context, friendTabProvider, child) {
              return SubTabFriend(
                selectedFriend:
                    FriendState.values[friendTabProvider.selectedIndex],
                badge: 4,
              );
            },
          ),
          SizedBox(height: size.height / 50),
          Expanded(
            child: Consumer<FriendTabProvider>(
              builder: (context, friendTabProvider, child) {
                return IndexedStack(
                  index: friendTabProvider.selectedIndex,
                  children: _pages,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
