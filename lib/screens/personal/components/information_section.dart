import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../contants.dart';
import '../../../data/default_data.dart';
import '../../../localization/app_localization.dart';
import '../../../provider/current_data.dart';

class ImformationSection extends StatelessWidget {
  const ImformationSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final DefaultData defaultData = DefaultData();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Ngôn ngữ
          _buildRow(
            context,
            iconPath: "assets/icons/global.svg",
            label: AppLocalization.of(context)!.translate('Language'),
            trailingWidget: Consumer<CurrentData>(
              builder: (BuildContext context, CurrentData currentData,
                  Widget? child) {
                return DropdownButton<String>(
                  value: currentData.currentLanguage,
                  icon: SvgPicture.asset("assets/icons/right arrow.svg"),
                  iconSize: 20,
                  elevation: 0,
                  style: const TextStyle(
                    color: kSecondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  dropdownColor: kInversePrimaryColor,
                  underline: SizedBox(),
                  items: defaultData.languageListDefault
                      .map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  onChanged: (String? value) {
                    currentData.changLocale(value!);
                  },
                );
              },
            ),
          ),
          Divider(color: Color.fromRGBO(239, 238, 238, 1)),

          // Thông báo
          _buildRow(
            context,
            iconPath: "assets/icons/megaphone.svg",
            label: AppLocalization.of(context)!.translate('Notifications'),
            trailingWidget: SvgPicture.asset("assets/icons/right arrow.svg"),
          ),
          Divider(color: Color.fromRGBO(239, 238, 238, 1)),

          // Phiên bản ứng dụng
          _buildRow(
            context,
            iconPath: "assets/icons/reuse.svg",
            label: AppLocalization.of(context)!.translate('Version'),
            trailingWidget: Text(
              "1.0.0",
              style: const TextStyle(
                color: Color.fromRGBO(153, 153, 153, 1),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context,
      {required String iconPath,
      required String label,
      required Widget trailingWidget}) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        trailingWidget,
      ],
    );
  }
}
