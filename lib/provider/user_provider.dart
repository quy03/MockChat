import 'package:flutter/widgets.dart';

import '../auth/auth_methods.dart';
import '../models/userdata.dart';

class UserProvider with ChangeNotifier {
  UserData? _user;
  final AuthMethods _authMethods = AuthMethods();

  UserData? get getUser => _user;
  Future<void> refreshUser() async {
    UserData user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
