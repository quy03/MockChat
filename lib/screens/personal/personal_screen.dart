// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mock_chat/contants.dart';
import 'package:mock_chat/models/userdata.dart';
import 'package:mock_chat/screens/personal/components/information_section.dart';
import 'package:mock_chat/screens/personal/components/personal_edit.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../auth/auth_page.dart';
import '../../localization/app_localization.dart';
import '../../provider/user_provider.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  late UserProvider userProvider;

  Future<void> updateData() async {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    await userProvider.refreshUser();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    updateData();
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const AuthPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    UserData? userData = userProvider.getUser;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: userData != null
          ? Stack(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
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
                              const SizedBox(width: 10),
                              Text.rich(
                                TextSpan(
                                  text: '${userData.fullname} \n',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: userData.email,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PersonalEdit(),
                                    ),
                                  );
                                },
                                child: SvgPicture.asset(
                                  "assets/icons/edit.svg",
                                  height: 16,
                                  width: 16,
                                  color: kSecondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 5,
                          color: const Color.fromRGBO(239, 238, 238, 1),
                        ),
                        ImformationSection(size: size),
                        Container(
                          height: 5,
                          color: const Color.fromRGBO(239, 238, 238, 1),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Cột Ngôn ngữ, Thông báo, Phiên bản, Đăng xuất
                                GestureDetector(
                                  onTap: logout,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/icons/logout.svg"),
                                      const SizedBox(width: 20),
                                      Text(
                                        AppLocalization.of(context)
                                            .translate('LogOut'),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Color.fromRGBO(201, 35, 35, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
