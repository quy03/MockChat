import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String email;
  final String fullname;
  final String uid;

  const UserData({
    required this.email,
    required this.fullname,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "fullname": fullname,
        "uid": uid,
        'createdAt': DateTime.now(),
      };

  static UserData fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    // lấy dữ liệu từ DocumentSnapshot trả về dữ liệu của tài liệu Firestore dưới dạng Map<String, dynamic>
    return UserData(
      email: snapshot['email'],
      fullname: snapshot['fullname'],
      uid: snapshot['uid'],
    );
  }
}
