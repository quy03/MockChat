import 'package:flutter/material.dart';
import 'package:diacritic/diacritic.dart'; // Thêm import này
import 'package:mock_chat/models/massage.dart';

class Friends extends StatelessWidget {
  const Friends({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Nhóm danh sách bạn bè theo chữ cái đầu của từ cuối cùng trong tên
    Map<String, List<Massage>> groupedFriends =
        _groupFriendsByLastName(demoMassage);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: groupedFriends.keys.length,
            itemBuilder: (context, index) {
              String firstLetter = groupedFriends.keys.elementAt(index);
              List<Massage> friendsInGroup = groupedFriends[firstLetter]!;

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
                  }).toList(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Map<String, List<Massage>> _groupFriendsByLastName(List<Massage> friends) {
    // Tạo một bản sao của danh sách bạn bè trước khi sắp xếp
    List<Massage> friendsCopy = List.from(friends);

    // Sắp xếp bản sao theo từ cuối cùng trong tên
    friendsCopy.sort((a, b) {
      return _getLastName(a.friendName).compareTo(_getLastName(b.friendName));
    });

    Map<String, List<Massage>> groupedFriends = {};

    for (var friend in friendsCopy) {
      // Sử dụng bản sao đã sắp xếp
      String lastName =
          _getLastName(friend.friendName); // Lấy từ cuối cùng trong tên
      String firstLetter = _removeDiacritics(lastName[0])
          .toUpperCase(); // Lấy chữ cái đầu và loại bỏ dấu
      if (!groupedFriends.containsKey(firstLetter)) {
        groupedFriends[firstLetter] = [];
      }
      groupedFriends[firstLetter]!.add(friend);
    }

    return groupedFriends;
  }

  // Hàm để lấy từ cuối cùng trong tên đầy đủ
  String _getLastName(String fullName) {
    List<String> nameParts = fullName.split(' ');
    return nameParts.last; // Trả về từ cuối cùng
  }

  // Hàm để loại bỏ dấu trong chữ cái
  String _removeDiacritics(String input) {
    return removeDiacritics(input); // Sử dụng thư viện diacritic để loại bỏ dấu
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
      crossAxisAlignment: CrossAxisAlignment.center,
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
        const SizedBox(width: 16), // Khoảng cách giữa avatar và tên
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
