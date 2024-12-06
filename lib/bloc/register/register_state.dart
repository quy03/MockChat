import 'package:equatable/equatable.dart';

enum RegisterStatus { initial, loading, success, error }

class RegisterState extends Equatable {
  const RegisterState({
    this.fullname = '',
    this.email = '',
    this.password = '',
    this.message = '',
    this.registerStatus = RegisterStatus.initial,
  });
  final String fullname;
  final String email;
  final String password;
  final String message;
  final RegisterStatus registerStatus;

  // Phương thức copyWith để tạo bản sao mới với các giá trị được cập nhật
  RegisterState copyWith({
    String? fullname,
    String? email,
    String? password,
    String? message,
    RegisterStatus? registerStatus,
  }) {
    return RegisterState(
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      registerStatus: registerStatus ?? this.registerStatus,
    );
  }

  @override
  List<Object?> get props =>
      [fullname, email, password, message, registerStatus];
}
