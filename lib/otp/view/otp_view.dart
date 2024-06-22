import 'package:app1/dashboard/view/dashboard_page.dart';
import 'package:app1/otp/cubit/otp_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pinput/pinput.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.success) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => DashboardPage()),
            (route) => false, // false akan menghapus semua halaman sebelumnya
          );
        }
      },
      child: Scaffold(
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
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 28),
                    Text(
                      "Kami telah mengirimkan 6 digit kode OTP ke nomor telepon berikut.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 28),
                    Pinput(
                      length: 6,
                      onCompleted: (pin) {
                        // Tambahkan logika ketika OTP selesai diinput
                      },
                      onChanged: (value) {
                        context.read<OtpCubit>().otpChanged(value);
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
                        child: Text('Lanjutkan',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          context.read<OtpCubit>().submitOtp();
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
      ),
    );
  }
}
