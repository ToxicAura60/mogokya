part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.phoneCode = "62",
    this.countryCode = "ID",
    this.phoneNumber = "",
    this.verificationId = "",
    this.status = FormzSubmissionStatus.initial,
  });

  final phoneCode;
  final countryCode;
  final phoneNumber;
  final verificationId;
  final FormzSubmissionStatus status;

  @override
  List<Object?> get props => [
        phoneCode,
        countryCode,
        phoneNumber,
        verificationId,
        status,
      ];

  LoginState copyWith({
    String? phoneCode,
    String? countryCode,
    String? phoneNumber,
    String? verificationId,
    FormzSubmissionStatus? status,
  }) {
    return LoginState(
      phoneCode: phoneCode ?? this.phoneCode,
      countryCode: countryCode ?? this.countryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      verificationId: verificationId ?? this.verificationId,
      status: status ?? this.status,
    );
  }
}
