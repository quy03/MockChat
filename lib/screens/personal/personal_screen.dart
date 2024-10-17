// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
          ),
          Positioned(
            child: SizedBox(
              width: size.width,
              child: Image.asset(
                "assets/images/avarta.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: size.height / 2.6,
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
              child: Column(
                children: [
                  SizedBox(height: size.height / 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width / 30),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/avarta.png",
                              height: size.height / 12,
                              width: size.height / 12,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(width: size.height / 50),
                        Text.rich(
                          TextSpan(
                            text: 'Awesame chat \n',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'awesomechat@gmail.com',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          "assets/icons/edit.svg",
                          height: 16,
                          width: 16,
                          color: Color.fromRGBO(67, 86, 180, 1),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height / 30),
                  Container(
                    height: 5,
                    color: Color.fromRGBO(239, 238, 238, 1),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width / 30),
                    child: Column(
                      children: [
                        SizedBox(height: size.height / 30),
                        // Ngôn ngữ
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/icons/global.svg"),
                            SizedBox(width: size.height / 50),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Ngôn Ngữ",
                                        style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Tiếng Việt",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(width: size.height / 50),
                                      SvgPicture.asset(
                                          "assets/icons/right arrow.svg"),
                                    ],
                                  ),
                                  SizedBox(height: size.height / 50),
                                  Container(
                                    height: 1,
                                    color: Color.fromRGBO(239, 238, 238, 1),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height / 50),

                        // Thông báo
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/icons/megaphone.svg"),
                            SizedBox(width: size.height / 50),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Thông báo",
                                        style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Spacer(),
                                      SizedBox(width: size.height / 50),
                                      SvgPicture.asset(
                                          "assets/icons/right arrow.svg"),
                                    ],
                                  ),
                                  SizedBox(height: size.height / 50),
                                  Container(
                                    height: 1,
                                    color: Color.fromRGBO(239, 238, 238, 1),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height / 50),

                        // Phiên bản ứng dụng
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/icons/reuse.svg"),
                            SizedBox(width: size.height / 50),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Phiên bản ứng dụng",
                                        style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "1.0.0",
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(153, 153, 153, 1),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.height / 30),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 5,
                    color: Color.fromRGBO(239, 238, 238, 1),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width / 30),
                      child: GestureDetector(
                        onTap: () => {},
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/logout.svg"),
                            SizedBox(width: size.height / 50),
                            Text(
                              "Đăng xuất",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(201, 35, 35, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
