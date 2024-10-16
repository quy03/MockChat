import 'package:flutter/material.dart';

import '../../../models/message.dart';

class Request extends StatelessWidget {
  const Request({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                padding: EdgeInsets.symmetric(horizontal: size.width / 30),
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
              SizedBox(height: size.height / 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width / 30),
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
      child: Row(
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
          SizedBox(width: size.width * 0.05), // Khoảng cách giữa avatar và tên
          Text(
            fullname,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              // Handle friend request acceptance
            },
            child: Container(
                alignment: Alignment.center,
                width: size.width * 0.22,
                padding: EdgeInsets.symmetric(vertical: size.height * 0.008),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary),
                ),
                child: Text(
                  "Đồng ý",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.surface),
                )),
          ),
          SizedBox(width: size.width / 30),
        ],
      ),
    );
  }
}
