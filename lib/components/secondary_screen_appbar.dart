import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mock_chat/components/my_search.dart';

import '../contants.dart';
import '../core/locale_keys.dart';

class SecondaryScreenAppbar extends StatelessWidget {
  const SecondaryScreenAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 3,
      padding: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: const BoxDecoration(
        gradient: kPrimaryGradientColor,
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
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
                tr(LocaleKeys.CreateMessage),
                style: TextStyle(
                  color: kPrimaryLightColor,
                  fontSize: 18,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  tr(LocaleKeys.Cancel),
                  style: TextStyle(
                    color: kPrimaryLightColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () => {},
            child: MySearch(
              hintText: tr(LocaleKeys.SearchMessages),
              onSearchToggleMySearch: (value) => {},
            ),
          ),
        ],
      ),
    );
  }
}
