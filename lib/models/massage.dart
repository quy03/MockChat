class Massage {
  late final String image;
  late final String friendName;
  late final List<String> messageContent;
  late final DateTime time;

  Massage({
    required this.image,
    required this.friendName,
    required this.messageContent,
    required this.time,
  });
}

List<Massage> demoMassage = [
  Massage(
    image: 'assets/images/random1.png',
    friendName: 'Trịnh Bảo Quý',
    messageContent: [
      'Chào bạn, Bạn có khỏe không',
      'Chào bạn, Bạn có khỏe không',
      'Chào bạn, Bạn có khỏe không',
      'Hello',
    ],
    time: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
  Massage(
    image: 'assets/images/random2.png',
    friendName: 'Phùng Như Ý',
    messageContent: [
      'Chào bạn, Bạn có khỏe không',
      'Chào bạn, Bạn có khỏe không',
      'Chào bạn, Bạn có khỏe không',
      'Hello',
      'Hẹn gặp lại vào tối nay.',
    ],
    time: DateTime.now().subtract(const Duration(hours: 1)),
  ),
  Massage(
    image: 'assets/images/random3.png',
    friendName: 'Nguyễn Văn A',
    messageContent: [
      'Chào bạn, Bạn có khỏe không',
      'Chào bạn, Bạn có khỏe không',
      'Chào bạn, Bạn có khỏe không',
      'Hello',
      'Hẹn gặp lại vào tối nay.',
      'Gửi cho bạn tài liệu hôm trước.',
    ],
    time: DateTime.now().subtract(const Duration(hours: 2, minutes: 30)),
  ),
];
