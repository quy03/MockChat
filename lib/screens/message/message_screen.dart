import 'package:flutter/material.dart';
import 'package:mock_chat/models/message.dart';
import 'package:mock_chat/screens/message/components/message_details.dart';
import 'package:mock_chat/screens/message/components/message_head.dart';
import 'package:mock_chat/screens/message/components/message_list.dart';
import 'package:mock_chat/screens/message/components/mesage_search.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  bool _isSearching = false;

  // Hàm để chuyển đổi trạng thái tìm kiếm
  void _toggleSearch(bool value) {
    setState(() {
      _isSearching = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
            ),
            Positioned(
              child: MessageHead(
                size: size,
                onSearchToggle: _toggleSearch,
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
                  padding: EdgeInsets.symmetric(horizontal: size.height / 50),
                  child: _isSearching
                      ? _buildMessageSearch(size)
                      : _buildMessageList(size),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Hiển thị danh sách tìm kiếm
  Column _buildMessageSearch(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height / 50),
        Text(
          "TIN NHẮN",
          style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 14,
              fontWeight: FontWeight.w800),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: demoMessage.length,
            itemBuilder: (BuildContext context, int index) {
              final message = demoMessage[index];
              return MessageSearch(
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

  // Hiển thị danh sách tin nhắn
  Column _buildMessageList(Size size) {
    return Column(
      children: [
        SizedBox(height: size.height / 50),
        Expanded(
          child: ListView.builder(
            itemCount: demoMessage.length,
            itemBuilder: (BuildContext context, int index) {
              final message = demoMessage[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MessageDetail(
                        friendName: message.friendName,
                        messageContent: message.messageContent,
                        image: message.image,
                      ),
                    ),
                  );
                },
                child: MessageList(
                  size: size,
                  image: message.image,
                  friendName: message.friendName,
                  messageContent: message.messageContent,
                  story: message.story,
                  badge: message.badge,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
