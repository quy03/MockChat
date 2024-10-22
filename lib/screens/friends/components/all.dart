import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:mock_chat/models/message.dart';

import '../../../contants.dart';

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Map<String, List<Message>> groupedFriends =
        _groupFriendsByName(demoMessage);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: groupedFriends.keys.length,
            itemBuilder: (context, index) {
              String firstLetter = groupedFriends.keys.elementAt(index);
              List<Message> friendsInGroup = groupedFriends[firstLetter]!;
              return Column(
                children: [
                  Container(
                    width: size.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    color: const Color.fromRGBO(246, 246, 246, 1),
                    child: Text(
                      firstLetter,
                      style: styleBody,
                    ),
                  ),
                  ...friendsInGroup.map((friend) {
                    return BuildAll(
                      image: friend.image,
                      fullname: friend.friendName,
                      isFriend: friend.isFriend,
                      requestSent: friend.requestSent,
                    );
                  }),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

Map<String, List<Message>> _groupFriendsByName(List<Message> friends) {
  // Tạo một bản sao của danh sách bạn bè tránh bị thay đổi
  List<Message> friendsCopy = List.from(friends);

  // Hàm sắp xếp bản sao theo chữ cái đầu tiền của tên
  friendsCopy.sort((a, b) {
    return _getName(a.friendName).compareTo(_getName(b.friendName));
  });

  // Tạo nhóm bạn bè theo chữ cái đầu tiên
  Map<String, List<Message>> groupedFriends = {};

  // kiểm tra và sắp xếp danh sách
  for (var friend in friendsCopy) {
    // Lấy tên
    String name = _getName(friend.friendName);

    // Lấy chữ cái đầu tiên
    String firstLetter = _removeDiacritics(name[0]).toUpperCase();

    // Them vào danh sách nhóm theo chữ cái
    if (!groupedFriends.containsKey(firstLetter)) {
      groupedFriends[firstLetter] = [];
    }
    groupedFriends[firstLetter]!.add(friend);
  }
  return groupedFriends;
}

// Hàm để lấy tên trả về một kiểu String
String _getName(String fullname) {
  List<String> nameParts = fullname.split(' ');
  return nameParts.last;
}

// Hàm loại bỏ dấu khi lấy chữ cái đầu tránh lấy cả hai sử dụng thư viện "Diacritics"
String _removeDiacritics(String input) {
  return removeDiacritics(input);
}

class BuildAll extends StatefulWidget {
  const BuildAll({
    super.key,
    required this.image,
    required this.fullname,
    required this.isFriend,
    required this.requestSent,
  });

  final String image, fullname;
  final bool isFriend, requestSent;

  @override
  State<BuildAll> createState() => _BuildAllState();
}

class _BuildAllState extends State<BuildAll> {
  late bool _requestSent;

  @override
  void initState() {
    super.initState();
    _requestSent = widget.requestSent;
  }

  void _toggleFriendRequest() {
    if (!_requestSent) {
      // Hiển thị hộp thoại xác nhận
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text(
              'Xác nhận',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            content: Text(
              "Bạn có chắc chắn muốn hủy kết bạn?",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Không",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _requestSent = !_requestSent;
                  });
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Có",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        _requestSent = !_requestSent;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 5,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
                width: 35,
                height: 35,
              ),
            ),
          ),
          SizedBox(width: size.width / 50),
          Text(
            widget.fullname,
            style: styleBody,
          ),
          Spacer(),
          if (widget.isFriend)
            GestureDetector(
              onTap: _toggleFriendRequest,
              child: Container(
                alignment: Alignment.center,
                width: 80,
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: _requestSent ? kSecondaryColor : kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary),
                ),
                child: Text(
                  _requestSent ? "Kết bạn" : "Hủy",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: _requestSent ? kPrimaryLightColor : kSecondaryColor,
                  ),
                ),
              ),
            ),
          SizedBox(width: size.width / 30),
        ],
      ),
    );
  }
}
