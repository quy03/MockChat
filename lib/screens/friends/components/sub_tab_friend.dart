import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mock_chat/core/locale_keys.dart';
import 'package:mock_chat/enums.dart';
import 'package:provider/provider.dart';

import '../../../provider/color_provider.dart';
import '../../../provider/friend_tab_provider';

class SubTabFriend extends StatelessWidget {
  const SubTabFriend({
    super.key,
    required this.selectedFriend,
    required this.badge,
  });

  final FriendState selectedFriend;
  final int badge;

  @override
  Widget build(BuildContext context) {
    final iconColorProvider = Provider.of<ColorProvider>(context);
    final friendTabProvider = Provider.of<FriendTabProvider>(context);

    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Tab "BẠN BÈ"
            GestureDetector(
              onTap: () {
                friendTabProvider.setSelectedIndex(0);
              },
              child: Column(
                children: [
                  Text(
                    tr(LocaleKeys.Friends),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedFriend == FriendState.friends
                          ? iconColorProvider.selectedColor
                          : iconColorProvider.unselectedColor,
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            // Tab "TẤT CẢ"
            GestureDetector(
              onTap: () {
                friendTabProvider.setSelectedIndex(1);
              },
              child: Column(
                children: [
                  Text(
                    tr(LocaleKeys.All),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedFriend == FriendState.all
                          ? iconColorProvider.selectedColor
                          : iconColorProvider.unselectedColor,
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            // Tab "YÊU CẦU"
            GestureDetector(
              onTap: () {
                friendTabProvider.setSelectedIndex(2);
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        tr(LocaleKeys.Requests),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedFriend == FriendState.request
                              ? iconColorProvider.selectedColor
                              : iconColorProvider.unselectedColor,
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
                    ? iconColorProvider.selectedColor
                    : iconColorProvider.unselectedColor,
              ),
            ),
            Expanded(
              child: Container(
                height: 2,
                color: selectedFriend == FriendState.all
                    ? iconColorProvider.selectedColor
                    : iconColorProvider.unselectedColor,
              ),
            ),
            Expanded(
              child: Container(
                height: 2,
                color: selectedFriend == FriendState.request
                    ? iconColorProvider.selectedColor
                    : iconColorProvider.unselectedColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
