class MessageContent {
  late final String content;
  late final DateTime time;

  MessageContent({
    required this.content,
    required this.time,
  });
}

class Message {
  late final String image;
  late final String friendName;
  late final List<MessageContent> messageContent;
  late final bool story;
  late final int badge;
  late final bool isFriend;
  late final bool requestSent;
  late final bool friendRequest;

  Message({
    required this.image,
    required this.friendName,
    required this.messageContent,
    required this.story,
    required this.badge,
    this.isFriend = false,
    this.requestSent = false,
    this.friendRequest = false,
  });
}

List<Message> demoMessage = [
  Message(
    image: 'assets/images/random1.png',
    friendName: 'Trịnh Bảo Quý',
    messageContent: [
      MessageContent(
        content: 'Chào bạn',
        time: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      MessageContent(
        content: 'Chào bạn, Bạn có khỏe không',
        time: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
      MessageContent(
        content: 'Hello',
        time: DateTime.now().subtract(const Duration(minutes: 15)),
      ),
    ],
    story: true,
    badge: 5,
    isFriend: true,
    requestSent: true,
    friendRequest: true,
  ),
  Message(
    image: 'assets/images/random1.png',
    friendName: 'Trịnh Bảo Thúy',
    messageContent: [
      MessageContent(
        content: 'Chào bạn',
        time: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      MessageContent(
        content: 'Chào bạn, Bạn có khỏe không',
        time: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
      MessageContent(
        content: 'Hello',
        time: DateTime.now().subtract(const Duration(minutes: 15)),
      ),
    ],
    story: true,
    badge: 0,
    isFriend: true,
    requestSent: true,
    friendRequest: true,
  ),
  Message(
    image: 'assets/images/random2.png',
    friendName: 'Phùng Như My',
    messageContent: [
      MessageContent(
        content:
            'Chào bạn, Bạn có khỏe không Chào bạn, Bạn có khỏe không Chào bạn, Bạn có khỏe không',
        time: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      MessageContent(
        content: 'Hello',
        time: DateTime.now().subtract(const Duration(hours: 1, minutes: 15)),
      ),
      MessageContent(
        content: 'Hẹn gặp lại vào tối nay.',
        time: DateTime.now().subtract(const Duration(hours: 1, minutes: 30)),
      ),
    ],
    story: true,
    badge: 0,
    friendRequest: true,
  ),
  Message(
    image: 'assets/images/random3.png',
    friendName: 'Nguyễn Văn A',
    messageContent: [
      MessageContent(
        content: 'Chào bạn, Bạn có khỏe không',
        time: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      MessageContent(
        content: 'Hello',
        time: DateTime.now().subtract(const Duration(hours: 2, minutes: 15)),
      ),
      MessageContent(
        content: 'Gửi cho bạn tài liệu hôm trước.',
        time: DateTime.now().subtract(const Duration(hours: 2, minutes: 30)),
      ),
    ],
    story: false,
    badge: 10,
    isFriend: true,
    requestSent: true,
    friendRequest: true,
  ),
  Message(
    image: 'assets/images/random1.png',
    friendName: 'Trịnh Văn Hạnh',
    messageContent: [
      MessageContent(
        content: 'Chào bạn',
        time: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      MessageContent(
        content: 'Chào bạn, Bạn có khỏe không',
        time: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
      MessageContent(
        content: 'Hello',
        time: DateTime.now().subtract(const Duration(minutes: 15)),
      ),
    ],
    story: true,
    badge: 5,
  ),
  Message(
    image: 'assets/images/random1.png',
    friendName: 'Trịnh Thanh Thúy',
    messageContent: [
      MessageContent(
        content: 'Chào bạn',
        time: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      MessageContent(
        content: 'Chào bạn, Bạn có khỏe không',
        time: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
      MessageContent(
        content: 'Hello',
        time: DateTime.now().subtract(const Duration(minutes: 15)),
      ),
    ],
    story: true,
    badge: 0,
  ),
  Message(
    image: 'assets/images/random2.png',
    friendName: 'Phùng Như Ý',
    messageContent: [
      MessageContent(
        content:
            'Chào bạn, Bạn có khỏe không Chào bạn, Bạn có khỏe không Chào bạn, Bạn có khỏe không',
        time: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      MessageContent(
        content: 'Hello',
        time: DateTime.now().subtract(const Duration(hours: 1, minutes: 15)),
      ),
      MessageContent(
        content: 'Hẹn gặp lại vào tối nay.',
        time: DateTime.now().subtract(const Duration(hours: 1, minutes: 30)),
      ),
    ],
    story: true,
    badge: 0,
    isFriend: true,
    requestSent: true,
  ),
  Message(
    image: 'assets/images/random3.png',
    friendName: 'Nguyễn Văn Anh',
    messageContent: [
      MessageContent(
        content: 'Chào bạn, Bạn có khỏe không',
        time: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      MessageContent(
        content: 'Hello',
        time: DateTime.now().subtract(const Duration(hours: 2, minutes: 15)),
      ),
      MessageContent(
        content: 'Gửi cho bạn tài liệu hôm trước.',
        time: DateTime.now().subtract(const Duration(hours: 2, minutes: 30)),
      ),
    ],
    story: false,
    badge: 10,
  ),
];
