import 'package:flutter/material.dart';
import 'package:mock_chat/screens/friends/friend_screen.dart';
import 'package:mock_chat/screens/message/message_screen.dart';
import 'package:mock_chat/screens/personal/personal_screen.dart';

import '../components/custom_bottom_nav_bar.dart';
import '../enums.dart';

class BodyChange extends StatefulWidget {
  const BodyChange({super.key});

  @override
  State<BodyChange> createState() => _BodyChangeState();
}

class _BodyChangeState extends State<BodyChange> {
  int _selectedIndex = 0;

  void _onItemTappped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const MessageScreen(),
    const FriendScreen(),
    const PersonalScreen()
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          elevation: 0, // Loại bỏ shadow nếu muốn
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          vertical: size.height / 60,
          horizontal: size.width / 30,
        ),
        color: const Color.fromRGBO(246, 246, 246, 1),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: size.height / 60,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: CustomBottomNavBar(
            selectedMenu: MenuState.values[_selectedIndex],
            onItemTapped: _onItemTappped,
            messageBadgeCount: 3,
          ),
        ),
      ),
    );
  }
}
