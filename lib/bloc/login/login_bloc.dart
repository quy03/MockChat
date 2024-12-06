import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_chat/auth/auth_methods.dart';
import 'package:mock_chat/bloc/login/login_event.dart';
import 'package:mock_chat/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthMethods _authMethods = AuthMethods();

  LoginBloc() : super(LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    // Reset lỗi khi email thay đổi
    emit(state.copyWith(email: event.email, loginStatus: LoginStatus.initial));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    // Reset lỗi khi mật khẩu thay đổi
    emit(state.copyWith(
        password: event.password, loginStatus: LoginStatus.initial));
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));

    // Kiểm tra email
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(state.email)) {
      emit(state.copyWith(
        loginStatus: LoginStatus.error,
        message: 'Email không hợp lệ',
      ));
      return;
    }

    // Kiểm tra mật khẩu
    if (state.password.length < 8) {
      emit(state.copyWith(
        loginStatus: LoginStatus.error,
        message: 'Mật khẩu phải có ít nhất 8 ký tự',
      ));
      return;
    }

    try {
      String? result = await _authMethods.loginUser(
        email: state.email,
        password: state.password,
      );

      if (result != null) {
        emit(state.copyWith(
          loginStatus: LoginStatus.error,
          message: result,
        ));
      } else {
        emit(state.copyWith(loginStatus: LoginStatus.success));
      }
    } catch (e) {
      emit(state.copyWith(
        loginStatus: LoginStatus.error,
        message: 'Đã xảy ra lỗi. Vui lòng thử lại sau.',
      ));
    }
  }
}
