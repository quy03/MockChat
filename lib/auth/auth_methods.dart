import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/userdata.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // register
  Future<String?> registerUser({
    required String email,
    required String password,
    required String fullname,
  }) async {
    try {
      // Đăng ký người dùng với Firebase Authentication
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserData userData = UserData(
        email: email,
        fullname: fullname,
        uid: userCredential.user!.uid,
      );

      // Thêm thông tin người dùng vào Firestore
      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userData.toJson());

      return "Đăng ký thành công";
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return 'Email này đã được sử dụng';
        case 'wrong-password':
          return 'Mật khẩu không chính xác';
        case 'weak-password':
          return 'Mật khẩu quá yếu';
        case 'invalid-email':
          return 'Email không hợp lệ';
        default:
          return 'Đã xảy ra lỗi. Vui lòng thử lại sau.';
      }
    }
  }

  // login
  Future<String?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return 'Người dùng không tồn tại';
        case 'wrong-password':
          return 'Mật khẩu không chính xác';
        case 'invalid-email':
          return 'Email không hợp lệ';
        default:
          return 'Đã xảy ra lỗi. Vui lòng thử lại sau.';
      }
    }
  }

  //
  Future<UserData> getUserDetails() async {
    // lấy thông tin người dùng hiện tại đặng nhập
    User currentUser = _auth.currentUser!;
    // lưu đọc tài liệu
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return UserData.fromSnap(snap);
  }
}
