import 'package:app1/app/bloc/app_bloc.dart';
import 'package:app1/app/router/router.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();

  final authenticationRepository = AuthenticationRepository();

  runApp(App(
    authenticationRepository: authenticationRepository,
  ));
}

class App extends StatelessWidget {
  const App({
    required authenticationRepository,
    super.key,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: AppView(
          router: AppRouter().router,
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  AppView({
    required GoRouter router,
    super.key,
  }) : _router = router;
  final GoRouter _router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
        ),
        fontFamily: "Montserrat",
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        appBarTheme: AppBarTheme(
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
