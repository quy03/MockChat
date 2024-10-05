import 'package:flutter/material.dart';

class MySearch extends StatefulWidget {
  const MySearch({
    super.key,
    required this.hintText,
  });
  final String hintText;

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
          child: AnimatedContainer(
            duration: const Duration(microseconds: 300),
            width: _isSearching ? size.width * 0.7 : size.width,
            child: TextField(
              onTap: () {
                setState(() {
                  _isSearching = true;
                });
              },
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(255, 255, 255, 1),
                hintText: widget.hintText,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color.fromRGBO(67, 86, 180, 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
        ),
        if (_isSearching)
          TextButton(
            onPressed: () {
              setState(() {
                _isSearching = false;
                searchController.clear();
              });
              FocusScope.of(context).unfocus();
            },
            child: Text(
              "Hủy",
              style: TextStyle(
                color: Theme.of(context).colorScheme.background,
                fontSize: 16,
              ),
            ),
          ),
      ],
    );
  }
}
