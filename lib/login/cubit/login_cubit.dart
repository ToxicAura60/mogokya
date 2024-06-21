import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneState extends Equatable {
  const PhoneState({
    this.phoneCode = "62",
    this.countryCode = "ID",
    this.phoneNumber = "",
  });

  final phoneCode;
  final countryCode;
  final phoneNumber;

  @override
  List<Object?> get props => [
        phoneCode,
        countryCode,
        phoneNumber,
      ];

  PhoneState copyWith({
    String? phoneCode,
    String? countryCode,
    String? phoneNumber,
  }) {
    return PhoneState(
      phoneCode: phoneCode ?? this.phoneCode,
      countryCode: countryCode ?? this.countryCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}

class LoginCubit extends Cubit<PhoneState> {
  LoginCubit() : super(PhoneState());

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
}
