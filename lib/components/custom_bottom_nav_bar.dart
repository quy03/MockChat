import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.selectedMenu,
    required this.onItemTapped,
  });
  final MenuState selectedMenu;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    int messageBadgeCount = 3;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Tin nhắn
        GestureDetector(
          onTap: () => onItemTapped(0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    "assets/icons/chat_nav_bar.svg",
                    color: MenuState.message == selectedMenu
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.inversePrimary,
                    height: 28,
                    width: 28,
                  ),
                  if (messageBadgeCount > 0)
                    Positioned(
                      right: -12,
                      top: -5,
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            messageBadgeCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Text(
                "Tin nhắn",
                style: TextStyle(
                  color: MenuState.message == selectedMenu
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),

        // Bạn bè
        GestureDetector(
          onTap: () => onItemTapped(1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                "assets/icons/friend_nav_bar.svg",
                color: MenuState.friend == selectedMenu
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.inversePrimary,
                height: 28,
                width: 28,
              ),
              Text(
                "Bạn bè",
                style: TextStyle(
                  color: MenuState.friend == selectedMenu
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),

        // Trang cá nhân
        GestureDetector(
          onTap: () => onItemTapped(2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                "assets/icons/user_nav_bar.svg",
                color: MenuState.personal == selectedMenu
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.inversePrimary,
                height: 28,
                width: 28,
              ),
              Text(
                "Trang cá nhân",
                style: TextStyle(
                  color: MenuState.personal == selectedMenu
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
