// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mock_chat/contants.dart';
import 'package:mock_chat/core/app_localizations.dart';
import 'package:mock_chat/screens/personal/components/personal_edit.dart';

import '../../core/locale_keys.dart';

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
                color: kPrimaryLightColor,
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/avarta.png",
                              height: 58,
                              width: 58,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PersonalEdit(),
                              ),
                            );
                          },
                          child: SvgPicture.asset(
                            "assets/icons/edit.svg",
                            height: 16,
                            width: 16,
                            color: Color.fromRGBO(67, 86, 180, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 5,
                    color: Color.fromRGBO(239, 238, 238, 1),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        // Ngôn ngữ
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/icons/global.svg"),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        tr(LocaleKeys.Language),
                                        style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return SizedBox(
                                                height: 150,
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      leading:
                                                          Icon(Icons.language),
                                                      title: Text('English'),
                                                      onTap: () {
                                                        context.setLocale(
                                                          AppLocalizations
                                                              .engLocale,
                                                        );
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    ListTile(
                                                      leading:
                                                          Icon(Icons.language),
                                                      title: Text('Tiếng Việt'),
                                                      onTap: () {
                                                        context.setLocale(
                                                          AppLocalizations
                                                              .viLocale,
                                                        );
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              context.locale ==
                                                      AppLocalizations.engLocale
                                                  ? "English"
                                                  : "Tiếng Việt",
                                              style: TextStyle(
                                                color: kSecondaryColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            GestureDetector(
                                              child: SvgPicture.asset(
                                                  "assets/icons/right arrow.svg"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    height: 1,
                                    color: Color.fromRGBO(239, 238, 238, 1),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        // Thông báo
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/icons/megaphone.svg"),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        tr(LocaleKeys.Notifications),
                                        style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Spacer(),
                                      SizedBox(width: 20),
                                      SvgPicture.asset(
                                          "assets/icons/right arrow.svg"),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    height: 1,
                                    color: Color.fromRGBO(239, 238, 238, 1),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        // Phiên bản ứng dụng
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/icons/reuse.svg"),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        tr(LocaleKeys.Version),
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
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: GestureDetector(
                        onTap: () => {},
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/logout.svg"),
                            SizedBox(width: 20),
                            Text(
                              tr(LocaleKeys.LogOut),
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
