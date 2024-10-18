import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mock_chat/models/message.dart';
import 'package:mock_chat/screens/message/components/list_friends.dart';

import '../../../components/my_search.dart';

class CreateNewMessage extends StatelessWidget {
  const CreateNewMessage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
            ),
            Positioned(
              child: Container(
                height: size.height / 3,
                padding: EdgeInsets.symmetric(
                  horizontal: size.height / 50,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF4356B4),
                      Color(0xFF3DCFCF),
                    ],
                    stops: [0.1, 1],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: size.height / 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(
                            "assets/icons/backward-arrow.svg",
                            height: 24,
                            width: 24,
                            // ignore: deprecated_member_use
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                        Text(
                          'Tạo tin nhắn',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.surface,
                            fontSize: 18,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Hủy",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.surface,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height / 30),
                    GestureDetector(
                      onTap: () => {},
                      child: MySearch(
                        hintText: 'Tìm kiếm tin nhắn...',
                        onSearchToggleMySearch: (value) => {},
                      ),
                    ),
                  ],
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
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.height / 50,
                  ),
                  child: _buildListFriends(size),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildListFriends(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height / 50,
        ),
        Text(
          "DANH SÁCH BẠN BÈ",
          style: TextStyle(
            color: Color.fromRGBO(153, 153, 153, 1),
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: demoMessage.length,
            itemBuilder: (BuildContext context, int index) {
              final message = demoMessage[index];
              return ListFriends(
                image: message.image,
                fullname: message.friendName,
              );
            },
          ),
        ),
      ],
    );
  }
}
