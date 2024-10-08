import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessageDetail extends StatelessWidget {
  final String friendName;
  final String messageContent;
  final DateTime time;
  final String image;

  const MessageDetail({
    super.key,
    required this.friendName,
    required this.messageContent,
    required this.image,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
          elevation: 0, // Loại bỏ shadow nếu muốn
        ),
      ),
      body: SafeArea(
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
              ),
            ),
            Positioned(
              top: size.height / 10,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width / 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
