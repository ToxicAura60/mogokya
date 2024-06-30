import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
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

  void pinChanged(String pin) {
    emit(state.copyWith(smsCode: pin));
  }

  void verifyPhoneNumber() {
    try {
      _authenticationRepository.verifyPhoneNumber(
        verificationId: state.verificationId,
        smsCode: state.smsCode,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  Future<void> logInWithPhoneNumber({required context}) async {
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
    ));
    try {
      await _authenticationRepository.LogInWithPhoneNumber(
        phoneNumber: "+${state.phoneCode} ${state.phoneNumber}",
        codeSent: (verificationId) {
          emit(state.copyWith(
            status: FormzSubmissionStatus.success,
            verificationId: verificationId,
          ));
          GoRouter.of(context).go('/verification');
        },
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
