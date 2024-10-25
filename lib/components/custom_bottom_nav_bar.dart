import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mock_chat/core/locale_keys.dart';
import 'package:mock_chat/provider/tab_provider.dart';
import 'package:provider/provider.dart';

import '../enums.dart';
import '../provider/color_provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.selectedMenu,
    required this.messageBadgeCount,
  });
  final MenuState selectedMenu;
  final int messageBadgeCount;

  @override
  Widget build(BuildContext context) {
    final iconColorProvider = Provider.of<ColorProvider>(context);
    final tabProvider = Provider.of<TabProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Tin nhắn
        GestureDetector(
          onTap: () => tabProvider.setSelectedIndex(0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    "assets/icons/chat_nav_bar.svg",
                    // ignore: deprecated_member_use
                    color: MenuState.message == selectedMenu
                        ? iconColorProvider.selectedColor
                        : iconColorProvider.unselectedColor,
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
                          padding: const EdgeInsets.all(1),
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
                tr(LocaleKeys.Messages),
                style: TextStyle(
                  color: MenuState.message == selectedMenu
                      ? iconColorProvider.selectedColor
                      : iconColorProvider.unselectedColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),

        // Bạn bè
        GestureDetector(
          onTap: () => tabProvider.setSelectedIndex(1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                "assets/icons/friend_nav_bar.svg",
                // ignore: deprecated_member_use
                color: MenuState.friend == selectedMenu
                    ? iconColorProvider.selectedColor
                    : iconColorProvider.unselectedColor,
                height: 28,
                width: 28,
              ),
              Text(
                tr(LocaleKeys.Friends),
                style: TextStyle(
                  color: MenuState.friend == selectedMenu
                      ? iconColorProvider.selectedColor
                      : iconColorProvider.unselectedColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),

        // Trang cá nhân
        GestureDetector(
          onTap: () => tabProvider.setSelectedIndex(2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                "assets/icons/user_nav_bar.svg",
                // ignore: deprecated_member_use
                color: MenuState.personal == selectedMenu
                    ? iconColorProvider.selectedColor
                    : iconColorProvider.unselectedColor,
                height: 28,
                width: 28,
              ),
              Text(
                tr(LocaleKeys.Profile),
                style: TextStyle(
                  color: MenuState.personal == selectedMenu
                      ? iconColorProvider.selectedColor
                      : iconColorProvider.unselectedColor,
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
