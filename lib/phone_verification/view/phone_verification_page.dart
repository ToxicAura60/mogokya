import 'package:app1/phone_verification/cubit/phone_verification_cubit.dart';
import 'package:app1/phone_verification/view/phone_verification_view.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneVerificationPage extends StatelessWidget {
  PhoneVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PhoneVerificationCubit(context.read<AuthenticationRepository>()),
      child: PhoneVerificationView(),
    );
  }
}
