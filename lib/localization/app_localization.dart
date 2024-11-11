import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalization {
  AppLocalization(this.locale);

  Locale locale;

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static final Map<String, Map<String, String>> _localizedValue = {
    'en': {
      "All": "All",
      "AlreadyHaveAnAccount": "Already have an account?",
      "And": "and",
      "Cancel": "Cancel",
      "ChangeInformation": "Change Information",
      "CreateMessage": "Create Message",
      "DateOfBirth": "Date of Birth",
      "DoNotHaveAnAccount": "Don't have an account?",
      "EnterYourDateOfBirth": "Enter your date of birth",
      "EnterYourEmail": "Enter your email",
      "EnterYourFullName": "Enter your full name",
      "EnterYourPassword": "Enter your password",
      "EnterYourPhoneNumber": "Enter your phone number",
      "Experience": "Experience Awesome chat",
      "ForgotYourPassword": "Forgot your password?",
      "Friends": "Friends",
      "FriendsList": "Friends List",
      "FullName": "Full Name",
      "IagreeToThe": "I agree to the",
      "Language": "Language",
      "LogOut": "Log Out",
      "Login": "Login",
      "MatchingMessages": "matching messages",
      "Messages": "Messages",
      "Notifications": "Notifications",
      "Password": "Password",
      "PhoneNumber": "Phone Number",
      "Policies": "policies",
      "Profile": "Profile",
      "Requests": "Requests",
      "Save": "Save",
      "SearchFriends": "Search friends…",
      "SearchMessages": "Search messages…",
      "SignInNow": "Sign in now",
      "SignUp": "Sign up",
      "SignUpNow": "Sign up now",
      "Terms": "terms",
      "Version": "Version"
    },
    'vi': {
      "All": "Tất cả",
      "AlreadyHaveAnAccount": "Đã có tài khoản?",
      "And": "và",
      "Cancel": "Hủy",
      "ChangeInformation": "Chỉnh sửa thông tin",
      "CreateMessage": "Tạo tin nhắn",
      "DateOfBirth": "Ngày sinh",
      "DoNotHaveAnAccount": "Chưa có tài khoản?",
      "EnterYourDateOfBirth": "Nhập ngày sinh của bạn",
      "EnterYourEmail": "Nhập email của bạn",
      "EnterYourFullName": "Nhập họ và tên của bạn",
      "EnterYourPassword": "Nhập mật khẩu của bạn",
      "EnterYourPhoneNumber": "Nhập số điện thoại của bạn",
      "Experience": "Trải nghiệm Awesome chat",
      "ForgotYourPassword": "Quên mật khẩu?",
      "Friends": "Bạn bè",
      "FriendsList": "Danh sách bạn bè",
      "FullName": "Họ Và Tên",
      "IagreeToThe": "Tôi đồng ý với",
      "Language": "Ngôn ngữ",
      "LogOut": "Đăng xuất",
      "Login": "Đăng nhập",
      "MatchingMessages": "tin nhắn phù hợp",
      "Messages": "Tin nhắn",
      "Notifications": "Thông báo",
      "Password": "Mật khẩu",
      "PhoneNumber": "Số điện thoại",
      "Policies": "chính sách",
      "Profile": "Trang cá nhân",
      "Requests": "Yêu cầu",
      "Save": "Lưu",
      "SearchFriends": "Tìm kiếm bạn bè…",
      "SearchMessages": "Tìm kiếm tin nhắn…",
      "SignInNow": "Đăng nhập ngay",
      "SignUp": "Đăng ký",
      "SignUpNow": "Đăng ký ngay",
      "Terms": "điều khoản",
      "Version": "Phiên bản ứng dụng"
    },
  };

  String translate(String key) {
    return _localizedValue[locale.languageCode]![key] ?? '**$key not foud';
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(
      AppLocalization(locale),
    );
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}
