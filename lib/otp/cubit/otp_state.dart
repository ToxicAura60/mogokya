part of 'otp_cubit.dart';

class OtpState extends Equatable {
  const OtpState({
    this.smsCode,
    this.status = FormzSubmissionStatus.initial,
  });

  final smsCode;
  final FormzSubmissionStatus status;

  @override
  List<Object?> get props => [
        smsCode,
        status,
      ];

  OtpState copyWith({
    String? smsCode,
    FormzSubmissionStatus? status,
  }) {
    return OtpState(
      smsCode: smsCode ?? this.smsCode,
      status: status ?? this.status,
    );
  }
}
