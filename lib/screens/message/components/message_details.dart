import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../models/massage.dart';

class MessageDetail extends StatelessWidget {
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
                    image: image,
                    friendName: friendName,
                  ),
                ],
              ),
            ),

            //Posittoned 1

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
                  color: Theme.of(context).colorScheme.background,
                ),
                child: Row(
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
                    // Column(
                    //   children: [
                    //     ListView.builder(
                    //       itemCount: demoMassage.length,
                    //       itemBuilder: (context, index) {
                    //         final message = messageContent[index];
                    //         return Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Container(
                    //               padding: EdgeInsets.symmetric(
                    //                 horizontal: size.width / 20,
                    //                 vertical: size.height / 50,
                    //               ),
                    //               decoration: BoxDecoration(
                    //                 color:
                    //                     const Color.fromRGBO(246, 246, 246, 1),
                    //                 borderRadius: BorderRadius.circular(30),
                    //               ),
                    //               child: Text(
                    //                 message.content,
                    //                 style: const TextStyle(
                    //                   fontSize: 16,
                    //                   color: Color.fromRGBO(0, 0, 0, 1),
                    //                   fontWeight: FontWeight.w500,
                    //                 ),
                    //               ),
                    //             ),
                    //             const SizedBox(height: 4),
                    //             Text(
                    //               DateFormat('HH:mm').format(message.time),
                    //               style: const TextStyle(
                    //                 fontSize: 12,
                    //                 color: Colors.grey,
                    //               ),
                    //             ),
                    //           ],
                    //         );
                    //       },
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),

            //Posittoned 2

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
    return Row(
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
    );
  }
}
