import 'package:flutter/material.dart';
import 'package:mock_chat/screens/message/components/head_massage.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            HeadMassages(size: size),
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
                    vertical: size.height / 50,
                  ),
                  child: Column(
                    children: [
                      MyListTitle(size: size),
                      MyListTitle(size: size),
                    ],
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

class MyListTitle extends StatelessWidget {
  const MyListTitle({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: size.height / 50),
        Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                "assets/images/random4.png",
              ),
            ),
            SizedBox(width: size.width / 20),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Trịnh Bảo Quý",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Phùng Như Ý",
                    style: TextStyle(
                      color: Colors.grey,
                      // 0,0,0,1       153,153,153,1
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1, // Độ dày của đường kẻ
              color: Colors.grey, // Màu sắc của đường kẻ
            ),
            const Text("18:00"),
          ],
        ),
        SizedBox(height: size.height / 50),
        Container(
          margin: EdgeInsets.only(left: size.width / 5, right: 0),
          height: 1,
          color: Colors.grey,
        )
      ],
    );
  }
}
