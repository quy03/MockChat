import 'package:flutter/material.dart';
import 'package:mock_chat/screens/message/components/head_massage.dart';
import 'package:mock_chat/screens/message/components/my_list_title.dart';
import 'package:mock_chat/screens/message/components/search_mesage.dart';

import '../../models/massage.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final bool _isSearching = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            HeadMassages(
              size: size,
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
                    horizontal: size.width / 30,
                  ),
                  child: _isSearching
                      ? _buildSearchResults(size)
                      : _buildMessageList(size),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // hiển thị danh sách tìm kiếm
  Column _buildSearchResults(Size size) {
    return Column(
      children: [
        SizedBox(height: size.height / 50),
        Expanded(
          child: ListView.separated(
            itemCount: demoMassage.length,
            separatorBuilder: (BuildContext context, int index) => Container(
              margin: EdgeInsets.only(left: size.width / 5),
              height: 1,
              color: Colors.grey,
            ),
            itemBuilder: (BuildContext context, int index) {
              final message = demoMassage[index];
              return SearchMessage(
                size: size,
                image: message.image,
                friendName: message.friendName,
              );
            },
          ),
        ),
      ],
    );
  }

  //  Hiển thị danh sách tin nhắn
  Column _buildMessageList(Size size) {
    return Column(
      children: [
        SizedBox(height: size.height / 50),
        Expanded(
          child: ListView.separated(
            itemCount: demoMassage.length,
            separatorBuilder: (BuildContext context, int index) => Container(
              margin: EdgeInsets.only(left: size.width / 5),
              height: 1,
              color: Colors.grey,
            ),
            itemBuilder: (BuildContext context, int index) {
              final message = demoMassage[index];
              return MyListTitle(
                size: size,
                image: message.image,
                friendName: message.friendName,
                messageContent: message.messageContent.last,
                time: message.time,
              );
            },
          ),
        ),
      ],
    );
  }
}
