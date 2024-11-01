import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mock_chat/auth/auth_page.dart';
import 'package:mock_chat/contants.dart';
import 'package:mock_chat/screens/personal/components/information_section.dart';
import 'package:mock_chat/screens/personal/components/personal_edit.dart';
import 'package:provider/provider.dart';

import '../../core/locale_keys.dart';
import '../../models/userdata.dart';
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
    if (mounted) setState(() {});
  }

  @override
  // Sử dụng Provider để lấy đối tượng UserProvider.
  void initState() {
    super.initState();

    updateData();
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    UserData? userData =
        userProvider.getUser; // Lấy thông tin người dùng từ provider
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
                                  // ignore: deprecated_member_use
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
                            child: GestureDetector(
                              onTap: logout,
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/icons/logout.svg"),
                                  const SizedBox(width: 20),
                                  Text(
                                    tr(LocaleKeys.LogOut),
                                    style: const TextStyle(
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
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
