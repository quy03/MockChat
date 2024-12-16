import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mock_chat/localization/app_localization.dart';
import 'package:mock_chat/models/message.dart';
import 'package:mock_chat/screens/message/components/appbar_message.dart';
import 'package:mock_chat/screens/message/components/create_new_message.dart';
import 'package:mock_chat/screens/message/components/mesage_search.dart';

class MessageSearchScreen extends StatefulWidget {
  const MessageSearchScreen({super.key});

  @override
  State<MessageSearchScreen> createState() => _MessageSearchScreenState();
}

class _MessageSearchScreenState extends State<MessageSearchScreen> {
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
              child: AppbarMessage(
                size: size,
                onSearchToggle: _toggleSearch,
                text: AppLocalization.of(context).translate('Messages'),
                hintText:
                    AppLocalization.of(context).translate('SearchMessages'),
                push: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateNewMessage(),
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    "assets/icons/create new message.svg",
                  ),
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
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: _buildSearchMessageList(size),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Hiển thị danh sách tin nhắn
  Column _buildSearchMessageList(Size size) {
    return Column(
      children: [
        // SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: demoMessage.length,
            itemBuilder: (context, index) {
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
}
