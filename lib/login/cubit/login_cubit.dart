import 'package:app1/otp/view/view.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(LoginState());

  final AuthenticationRepository _authenticationRepository;

  void countryChanged({
    required String phoneCode,
    required String countryCode,
  }) {
    emit(state.copyWith(
      phoneCode: phoneCode,
      countryCode: countryCode,
    ));
  }

  void phoneNumberChanged(String phoneNumber) {
    emit(state.copyWith(phoneNumber: phoneNumber));
  }

  Future<void> logInWithPhoneNumber() async {
    try {
      await _authenticationRepository.LogInWithPhoneNumber(
          codeSent: (verificationId) {
            emit(state.copyWith(
                status: FormzSubmissionStatus.success,
                verificationId: verificationId));
          },
          phoneNumber: "+${state.phoneCode} ${state.phoneNumber}");
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
