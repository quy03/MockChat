import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mock_chat/contants.dart';

import '../localization/app_localization.dart';

class MySearch extends StatefulWidget {
  // ignore: use_super_parameters
  const MySearch({
    Key? key,
    required this.hintText,
    required this.onSearchToggleMySearch,
  }) : super(key: key);

  final String hintText;
  final ValueChanged<bool> onSearchToggleMySearch;

  @override
  State<MySearch> createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  bool _isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _isSearching ? size.width * 0.7 : size.width,
                    child: TextField(
                      onTap: () {
                        _isSearching = true;
                        widget.onSearchToggleMySearch(true);
                      },
                      controller: searchController,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: widget.hintText,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isSearching)
          TextButton(
            onPressed: () {
              _isSearching = false;
              widget.onSearchToggleMySearch(false);
              searchController.clear();
              FocusScope.of(context).unfocus();
            },
            child: Text(
              AppLocalization.of(context).translate('Cancel'),
              style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 16,
              ),
            ),
          ),
      ],
    );
  }
}
