import 'package:flutter/material.dart';
import 'package:diacritic/diacritic.dart'; // Thêm import này
import 'package:mock_chat/models/message.dart';

class Friends extends StatelessWidget {
  const Friends({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Nhóm danh sách bạn bè theo chữ cái đầu của từ cuối cùng trong tên
    Map<String, List<Message>> groupedFriends =
        _groupFriendsByName(demoMessage);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: groupedFriends.keys.length,
            itemBuilder: (context, index) {
              String firstLetter = groupedFriends.keys.elementAt(index);
              List<Message> friendsInGroup = groupedFriends[firstLetter]!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tiêu đề nhóm theo chữ cái đầu của từ cuối cùng trong tên
                  Container(
                    width: size.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width / 30,
                      vertical: size.height * 0.005,
                    ),
                    color: const Color.fromRGBO(246, 246, 246, 1),
                    child: Text(
                      firstLetter,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Danh sách bạn bè trong nhóm
                  ...friendsInGroup.map((friend) {
                    return BuildFriends(
                      image: friend.image,
                      fullname: friend.friendName,
                    );
                    // ignore: unnecessary_to_list_in_spreads
                  }).toList(),
                ],
              );
            },
          ),
        ),
      ],
    );
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
}

class BuildFriends extends StatelessWidget {
  const BuildFriends({
    super.key,
    required this.image,
    required this.fullname,
  });
  final String image, fullname;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: 35,
              height: 35,
            ),
          ),
        ),
        Text(
          fullname,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
