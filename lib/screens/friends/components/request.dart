import 'package:flutter/material.dart';

import '../../../contants.dart';
import '../../../models/message.dart';

class Request extends StatelessWidget {
  const Request({super.key});

  @override
  Widget build(BuildContext context) {
    List<Message> friendRequests =
        demoMessage.where((friend) => friend.friendRequest).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "LỜI MỜI KẾT BẠN",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: friendRequests.length,
                  itemBuilder: (context, index) {
                    Message friend = friendRequests[index];
                    return BuildFriendRequest(
                      image: friend.image,
                      fullname: friend.friendName,
                      friendRequest: friend.friendRequest,
                      onDismissed: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 5,
          color: Color.fromRGBO(239, 238, 238, 1),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "LỜI MỜI KẾT BẠN",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BuildFriendRequest extends StatelessWidget {
  const BuildFriendRequest({
    super.key,
    required this.image,
    required this.fullname,
    required this.friendRequest,
    required this.onDismissed, // Callback khi vuốt để xóa
  });

  final String image, fullname;
  final bool friendRequest;
  final VoidCallback onDismissed; // Hàm gọi lại khi xóa

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Dismissible(
      key: Key(fullname),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onDismissed();
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: Text(
          "Từ chối",
          style: TextStyle(color: Colors.white),
        ),
      ),
      child: Container(
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
                  image,
                  fit: BoxFit.cover,
                  width: 35,
                  height: 35,
                ),
              ),
            ),
            SizedBox(width: 12),
            Text(
              fullname,
              style: styleBody,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                // Handle friend request acceptance
              },
              child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: kSecondaryColor),
                  ),
                  child: Text(
                    "Đồng ý",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryLightColor,
                    ),
                  )),
            ),
            SizedBox(width: size.width / 30),
          ],
        ),
      ),
    );
  }
}
