import 'package:app1/login/login.dart';
import 'package:app1/phone_verification/cubit/phone_verification_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pinput/pinput.dart';

class PhoneVerificationView extends StatelessWidget {
  const PhoneVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Verifikasi Nomor \nTelepon",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 28),
                  Text(
                    "Kami telah mengirimkan 6 digit kode OTP ke nomor telepon berikut.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 28),
                  Text(
                      "+${context.read<LoginCubit>().state.phoneCode} ${context.read<LoginCubit>().state.phoneNumber}"),
                  Pinput(
                    length: 6,
                    onCompleted: (pin) {
                      context.read<PhoneVerificationCubit>().verifyPhoneNumber(
                            verificationId:
                                context.read<LoginCubit>().state.verificationId,
                            context: context,
                          );
                    },
                    onChanged: (value) {
                      context.read<PhoneVerificationCubit>().pinChanged(value);
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
              ),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Tidak menerima kode OTP?  ',
                        style:
                            TextStyle(color: Color(0xFF242831), fontSize: 16),
                      ),
                      TextSpan(
                        text: 'Kirim Ulang',
                        style: TextStyle(
                            color: Color(0xFFFF8324),
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Tambahkan logika untuk mengirim ulang kode OTP
                          },
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: BlocBuilder<PhoneVerificationCubit,
                          PhoneVerificationState>(
                        builder: (context, state) {
                          if (state.status == FormzSubmissionStatus.initial) {
                            return Text('Lanjutkan',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ));
                          } else {
                            return LoadingAnimationWidget.waveDots(
                              color: Color(0xFFFFFFFF),
                              size: 20,
                            );
                          }
                        },
                      ),
                      onPressed: () {
                        context
                            .read<PhoneVerificationCubit>()
                            .verifyPhoneNumber(
                                verificationId: context
                                    .read<LoginCubit>()
                                    .state
                                    .verificationId,
                                context: context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF262626),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
