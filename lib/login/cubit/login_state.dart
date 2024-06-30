part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.phoneCode = "62",
    this.countryCode = "ID",
    this.phoneNumber = "",
    this.verificationId = "",
    this.smsCode = "",
    this.status = FormzSubmissionStatus.initial,
  });

  final phoneCode;
  final countryCode;
  final phoneNumber;
  final verificationId;
  final smsCode;
  final FormzSubmissionStatus status;

  @override
  List<Object?> get props => [
        phoneCode,
        countryCode,
        phoneNumber,
        verificationId,
        smsCode,
        status,
      ];

  LoginState copyWith({
    String? phoneCode,
    String? countryCode,
    String? phoneNumber,
    String? verificationId,
    String? smsCode,
    FormzSubmissionStatus? status,
  }) {
    return LoginState(
      phoneCode: phoneCode ?? this.phoneCode,
      countryCode: countryCode ?? this.countryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      verificationId: verificationId ?? this.verificationId,
      smsCode: smsCode ?? this.smsCode,
      status: status ?? this.status,
    );
  }
}
