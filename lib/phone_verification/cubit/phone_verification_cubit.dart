import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
part 'phone_verification_state.dart';

class PhoneVerificationCubit extends Cubit<PhoneVerificationState> {
  PhoneVerificationCubit(this._authenticationRepository)
      : super(PhoneVerificationState());

  final AuthenticationRepository _authenticationRepository;

  void pinChanged(String pin) {
    emit(state.copyWith(smsCode: pin));
  }

  void verifyPhoneNumber({
    required String verificationId,
    required BuildContext context,
  }) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authenticationRepository.verifyPhoneNumber(
        verificationId: verificationId,
        smsCode: state.smsCode,
      );
      GoRouter.of(context).go("/home");
      emit(state.copyWith(status: FormzSubmissionStatus.initial));
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
