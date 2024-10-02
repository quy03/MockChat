import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              // height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF4356B4),
                    Color(0xFF3DCFCF),
                  ],
                  stops: [0.1, 0.4],
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 54),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tin nhắn',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          "assets/icons/create new message.svg",
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(255, 255, 255, 1),
                      hintText: 'Tìm kiếm tin nhắn...',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color.fromRGBO(67, 86, 180, 1),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      // Cấp chiều cao cho TextField
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                ],
              ),
            ),
            // Container dưới chiếm hết phần còn lại và sát đáy
            Positioned(
              top: 200, // Vị trí bắt đầu ngay dưới container trên
              left: 0,
              right: 0,
              bottom: 0, // Sát với đáy màn hình
              child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: const Column()),
            ),
          ],
        ),
      ),
    );
  }
}
