import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodySplash(),
    );
  }
}

class BodySplash extends StatelessWidget {
  const BodySplash({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF4356B4),
            Color(0xFF3DCFCF),
          ],
          stops: [0.0, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Hình ảnh ở phía dưới
          Positioned(
            top: size.height * 0.25,
            left: size.width * 0.25,
            child: Image.asset(
              "assets/images/logo_splash.png",
              height: 164, // Chiều cao của hình ảnh
              width: 164, // Chiều rộng của hình ảnh
            ),
          ),
          // Dòng chữ ở trên cùng hình ảnh
          const Positioned(
            child: Center(
              child: Text.rich(
                TextSpan(
                  text: 'Awesome ',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  children: [
                    TextSpan(
                      text: 'chat',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
