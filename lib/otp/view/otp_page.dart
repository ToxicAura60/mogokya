import 'package:app1/otp/cubit/otp_cubit.dart';
import 'package:app1/otp/view/otp_view.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpPage extends StatelessWidget {
  const OtpPage(
      {required this.phoneNumber, required this.verificationId, super.key});

  final String phoneNumber;
  final String verificationId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OtpCubit(
          authenticationRepository: context.read<AuthenticationRepository>(),
          verificationId: verificationId),
      child: OtpView(),
    );
  }
}
