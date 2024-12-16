import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mock_chat/provider/color_provider.dart';
import 'package:mock_chat/screens/friends/friend_screen.dart';
import 'package:mock_chat/screens/message/message_screen.dart';
import 'package:mock_chat/screens/personal/personal_screen.dart';
import 'package:provider/provider.dart';

import '../components/custom_bottom_nav_bar.dart';
import '../enums.dart';
import '../provider/tab_provider.dart';

class BodyChange extends StatefulWidget {
  const BodyChange({super.key});

  @override
  State<BodyChange> createState() => _BodyChangeState();
}

class _BodyChangeState extends State<BodyChange> {
  final List<Widget> _pages = [
    const MessageScreen(),
    const FriendScreen(),
    const PersonalScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
      statusBarIconBrightness: Brightness.dark,
    ));

    return SafeArea(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ColorProvider>(create: (_) => ColorProvider()),
          ChangeNotifierProvider<TabProvider>(create: (_) => TabProvider()),
        ],
        child: Consumer<TabProvider>(
          builder:
              (BuildContext context, TabProvider tabProvider, Widget? child) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: IndexedStack(
                index: tabProvider.selectedIndex,
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
                    selectedMenu: MenuState.values[tabProvider.selectedIndex],
                    messageBadgeCount: 4,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
