part of 'phone_verification_cubit.dart';

class PhoneVerificationState extends Equatable {
  PhoneVerificationState({
    this.status = FormzSubmissionStatus.initial,
    this.smsCode = "",
  });
  final FormzSubmissionStatus status;
  final String smsCode;

  PhoneVerificationState copyWith({
    String? smsCode,
    FormzSubmissionStatus? status,
  }) {
    return PhoneVerificationState(
      smsCode: smsCode ?? this.smsCode,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        smsCode,
        status,
      ];
}
