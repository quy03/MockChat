import 'package:flutter/material.dart';
import 'package:mock_chat/models/message.dart';
import 'package:mock_chat/screens/message/components/list_friends.dart';

import '../../../components/secondary_screen_appbar.dart';

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
              child: SecondaryScreenAppbar(),
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
                    horizontal: 12,
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
          height: 20,
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
