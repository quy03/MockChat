import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mock_chat/models/images.dart';

import '../../../models/massage.dart';

class MessageDetail extends StatefulWidget {
  final String friendName;
  final List<MessageContent> messageContent;
  final String image;

  const MessageDetail({
    super.key,
    required this.friendName,
    required this.image,
    required this.messageContent,
  });

  @override
  State<MessageDetail> createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetail> {
  bool _isImageVisible = false;
  bool _isIconVisible = false;
  bool typingMessage = false;
  TextEditingController typingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: size.height,
                    padding: EdgeInsets.symmetric(
                      vertical: size.height / 50,
                      horizontal: size.height / 80,
                    ),
                    color: const Color.fromRGBO(246, 246, 246, 1),
                    child: Column(
                      children: [
                        MessageDetailsHead(
                          size: size,
                          image: widget.image,
                          friendName: widget.friendName,
                        ),
                      ],
                    ),
                  ),

                  // Positioned 1: Hiển thị tin nhắn
                  Positioned(
                    top: size.height / 10,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.only(
                        top: size.height / 20,
                        left: size.width / 50,
                        right: size.width / 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: BodyMessageDetails(
                                image: widget.image,
                                messageContent: widget.messageContent,
                                size: size,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Positioned 2: Hiển thị ngày tin nhắn
                  Positioned(
                    top: size.height / 12,
                    left: (size.width - (size.width / 5)) / 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(246, 246, 246, 1),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width / 30,
                        vertical: size.height * 0.004,
                      ),
                      child: Center(
                        child: Text(
                          'Hôm nay',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Hàng chứa TextField và các nút
            Padding(
              padding: EdgeInsets.only(
                left: size.width / 50,
                right: size.width / 50,
                bottom: size.height / 50,
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(50),
                      color: const Color.fromRGBO(246, 246, 246, 1),
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        "assets/icons/photo.svg",
                        color: _isImageVisible
                            ? Color.fromRGBO(67, 86, 180, 1)
                            : Color.fromRGBO(155, 155, 155, 1),
                      ),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        _isIconVisible = false;
                        setState(() {
                          _isImageVisible = !_isImageVisible;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: size.width / 50),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(246, 246, 246, 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              width: (typingMessage)
                                  ? size.width * 0.7
                                  : size.width,
                              child: TextField(
                                controller: typingController,
                                onTap: () {
                                  setState(() {
                                    typingMessage = true;
                                  });
                                  _isImageVisible = false;
                                  _isIconVisible = false;
                                },
                                decoration: InputDecoration(
                                  hintText: "Nhập tin nhắn...",
                                  fillColor:
                                      const Color.fromARGB(0, 123, 53, 53),
                                  // filled: true,
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: SvgPicture.asset(
                              _isIconVisible
                                  ? "assets/icons/smile 1.svg"
                                  : "assets/icons/smile.svg",
                            ),
                            onPressed: () {
                              setState(() {
                                _isIconVisible = !_isIconVisible;
                              });
                              FocusScope.of(context).unfocus();
                              _isImageVisible = false;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: size.width / 50),
                  if (typingMessage || _isIconVisible || _isImageVisible)
                    IconButton(
                      icon: SvgPicture.asset("assets/icons/send.svg"),
                      onPressed: () {},
                    ),
                ],
              ),
            ),
            if (_isImageVisible || _isIconVisible)
              SizedBox(
                height: size.height / 3,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemCount: demoImage.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.grey[200],
                      child: ClipRRect(
                        child: Image.asset(
                          demoImage[index].image,
                          height: 122,
                          width: 122,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class BodyMessageDetails extends StatelessWidget {
  const BodyMessageDetails({
    super.key,
    required this.image,
    required this.messageContent,
    required this.size,
  });

  final String image;
  final List<MessageContent> messageContent;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: 42,
              width: 42,
            ),
          ),
        ),
        const SizedBox(width: 10),
        // Hiển thị danh sách tin nhắn
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: messageContent.length,
            itemBuilder: (context, index) {
              final message = messageContent[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width / 20,
                      vertical: size.height / 50,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(246, 246, 246, 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      message.content,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('HH:mm').format(message.time),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class MessageDetailsHead extends StatelessWidget {
  const MessageDetailsHead({
    super.key,
    required this.size,
    required this.image,
    required this.friendName,
  });

  final Size size;
  final String image;
  final String friendName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: size.height * 0.015),
        Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                "assets/icons/backward-arrow.svg",
                height: 24,
                width: 24,
              ),
            ),
            SizedBox(width: size.height / 80),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: 42,
                  width: 42,
                ),
              ),
            ),
            SizedBox(width: size.height / 80),
            Text(
              friendName,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
