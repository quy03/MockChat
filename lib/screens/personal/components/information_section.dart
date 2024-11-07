import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../contants.dart';
import '../../../core/app_localizations.dart';
import '../../../core/locale_keys.dart';
import '../../../provider/language_provider.dart';

class ImformationSection extends StatelessWidget {
  const ImformationSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                            color: kPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 150,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: Icon(Icons.language),
                                        title: Text('English'),
                                        onTap: () {
                                          context.setLocale(
                                              AppLocalizations.engLocale);
                                          Provider.of<LanguageProvider>(context,
                                                  listen: false)
                                              .changeLanguage('en');
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.language),
                                        title: Text('Tiếng Việt'),
                                        onTap: () {
                                          context.setLocale(
                                              AppLocalizations.viLocale);
                                          Provider.of<LanguageProvider>(context,
                                                  listen: false)
                                              .changeLanguage('vi');
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
                                context.locale == AppLocalizations.engLocale
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
                        SvgPicture.asset("assets/icons/right arrow.svg"),
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
                            color: Color.fromRGBO(153, 153, 153, 1),
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
    );
  }
}
