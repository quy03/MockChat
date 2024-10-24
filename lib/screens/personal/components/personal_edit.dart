import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mock_chat/contants.dart';
import 'package:mock_chat/core/locale_keys.dart';

import '../../../components/my_textfield.dart';

class PersonalEdit extends StatefulWidget {
  const PersonalEdit({super.key});

  @override
  State<PersonalEdit> createState() => _PersonalEditState();
}

class _PersonalEditState extends State<PersonalEdit> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController bridthdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
            ),
            Positioned(
              child: Container(
                height: size.height / 3,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  gradient: kPrimaryGradientColor,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(
                            "assets/icons/backward-arrow.svg",
                            height: 24,
                            width: 24,
                            // ignore: deprecated_member_use
                            color: kPrimaryLightColor,
                          ),
                        ),
                        Text(
                          tr(LocaleKeys.ChangeInformation),
                          style: TextStyle(
                            color: kPrimaryLightColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            tr(LocaleKeys.Save),
                            style: TextStyle(
                              color: kPrimaryLightColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height / 8,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: size.height / 50),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: kPrimaryLightColor,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 70,
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/avarta.png",
                                height: size.height,
                                width: size.height,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Positioned(
                            top: size.height / 7.7,
                            left: size.height / 7.7,
                            child: Container(
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: kPrimaryLightColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: SvgPicture.asset(
                                  "assets/icons/camera.svg",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height / 20),
                      MyTextField(
                        svgIcon: 'assets/icons/user.svg',
                        labelText: tr(LocaleKeys.FullName),
                        hintText: tr(LocaleKeys.EnterYourFullName),
                        obscureText: false,
                        controller: fullnameController,
                      ),
                      SizedBox(height: size.height / 30),
                      MyTextField(
                        svgIcon: 'assets/icons/telephone.svg',
                        labelText: tr(LocaleKeys.PhoneNumber),
                        hintText: tr(LocaleKeys.EnterYourPhoneNumber),
                        obscureText: false,
                        controller: phonenumberController,
                      ),
                      SizedBox(height: size.height / 30),
                      MyTextField(
                        svgIcon: 'assets/icons/birthday-cake.svg',
                        labelText: tr(LocaleKeys.DateOfBirth),
                        hintText: tr(LocaleKeys.EnterYourDateOfBirth),
                        obscureText: false,
                        controller: fullnameController,
                      ),
                      SizedBox(height: size.height / 30),
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
