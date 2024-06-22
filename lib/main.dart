import 'package:app1/app/bloc/app_bloc.dart';
import 'package:app1/dashboard/view/dashboard_page.dart';
import 'package:app1/dashboard/view/dashboard_view.dart';
import 'package:app1/login/view/view.dart';
import 'package:app1/otp/view/otp_page.dart';
import 'package:app1/otp/view/otp_view.dart';
import 'package:app1/profile/view/profile_view.dart';
import 'package:app1/settings/view/settings_view.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final authenticationRepository = AuthenticationRepository();
  runApp(App(authenticationRepository: authenticationRepository));
}

class App extends StatelessWidget {
  const App({required authenticationRepository, super.key})
      : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Montserrat",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
