import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mock_chat/contants.dart';

class MySearch extends StatefulWidget {
  const MySearch({
    super.key,
    required this.hintText,
    required this.onSearchToggleMySearch,
    required this.onNavigate,
  });

  final String hintText;
  final ValueChanged<bool> onSearchToggleMySearch;
  final VoidCallback onNavigate;

  @override
  State<MySearch> createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryLightColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/search.svg",
                  ),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    onTap: () {
                      setState(() {
                        widget.onSearchToggleMySearch(true);
                        // Ngăn không cho bàn phím xuất hiện
                        FocusScope.of(context).requestFocus(FocusNode());
                      });
                      widget.onNavigate();
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
