import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_chat/auth/auth_methods.dart';
import 'package:mock_chat/bloc/register/register_event.dart';
import 'package:mock_chat/bloc/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthMethods _authMethods = AuthMethods();

  RegisterBloc() : super(RegisterState()) {
    on<FullnameChanged>(_onFullnameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  void _onFullnameChanged(FullnameChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
        fullname: event.fullname, registerStatus: RegisterStatus.initial));
  }

  void _onEmailChanged(EmailChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
        email: event.email, registerStatus: RegisterStatus.initial));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
        password: event.password, registerStatus: RegisterStatus.initial));
  }

  Future<void> _onRegisterSubmitted(
      RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(registerStatus: RegisterStatus.loading));

    // Validate fullname
    if (state.fullname.isEmpty) {
      emit(state.copyWith(
        registerStatus: RegisterStatus.error,
        message: 'Họ và tên không được để trống',
      ));
      return;
    }

    // Validate email
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(state.email)) {
      emit(state.copyWith(
        registerStatus: RegisterStatus.error,
        message: 'Email không hợp lệ',
      ));
      return;
    }

    // Validate password
    if (state.password.length < 8) {
      emit(state.copyWith(
        registerStatus: RegisterStatus.error,
        message: 'Mật khẩu phải có ít nhất 8 ký tự',
      ));
      return;
    }

    try {
      String? result = await _authMethods.registerUser(
        fullname: state.fullname,
        email: state.email,
        password: state.password,
      );

      if (result != null) {
        emit(state.copyWith(
          registerStatus: RegisterStatus.error,
          message: result,
        ));
      } else {
        emit(state.copyWith(registerStatus: RegisterStatus.success));
      }
    } catch (e) {
      emit(state.copyWith(
        registerStatus: RegisterStatus.error,
        message: 'Đã xảy ra lỗi. Vui lòng thử lại sau.',
      ));
    }
  }
}
