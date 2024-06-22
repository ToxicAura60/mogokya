import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(
      {required this.authenticationRepository, required this.verificationId})
      : super(OtpState());

  final AuthenticationRepository authenticationRepository;
  final String verificationId;

  void otpChanged(otp) {
    emit(state.copyWith(smsCode: otp));
  }

  void submitOtp() {
    try {
      authenticationRepository.verifyOtp(
        verificationId: verificationId,
        smsCode: state.smsCode,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
