import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mock_chat/contants.dart';
import 'package:mock_chat/models/images.dart';
import 'package:mock_chat/models/message.dart';
import 'package:mock_chat/screens/message/components/body_message_details.dart';
import 'package:mock_chat/screens/message/components/message_details_head.dart';
import 'package:provider/provider.dart';

import '../../../provider/color_provider.dart';

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
    final iconColoProvider = Provider.of<ColorProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: kPrimaryLightColor,
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
                    color: kPrimaryLightColor,
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
                        top: 50,
                        left: 12,
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
                        color: kPrimaryLightColor,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width / 30,
                        vertical: size.height * 0.004,
                      ),
                      child: Center(
                        child: Text(
                          'Hôm nay',
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
                      color: Color.fromRGBO(221, 221, 221, 1),
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        "assets/icons/photo.svg",
                        // ignore: deprecated_member_use
                        color: _isImageVisible
                            ? iconColoProvider.selectedColor
                            : iconColoProvider.unselectedColor,
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
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(221, 221, 221, 1),
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
                              "assets/icons/smile.svg",
                              // ignore: deprecated_member_use
                              color: _isIconVisible
                                  ? iconColoProvider.selectedColor
                                  : iconColoProvider.unselectedColor,
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
                height: 230,
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
