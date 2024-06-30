import 'package:app1/app/bloc/app_bloc.dart';
import 'package:app1/chat/view/chat_page.dart';
import 'package:app1/home/home_page.dart';

import 'package:app1/login/login.dart';

import 'package:app1/mechanic/view/mechanic_page.dart';

import 'package:app1/phone_verification/view/phone_verification_page.dart';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final LoginCubit _loginCubit = LoginCubit(AuthenticationRepository());

  GoRouter get router {
    return GoRouter(
      initialLocation: "/",
      routes: [
        GoRoute(
          path: '/',
          redirect: (context, state) {
            if (context.read<AppBloc>().state.status ==
                AppStatus.authenticated) {
              return "/home";
            } else {
              return null;
            }
          },
          builder: (context, state) => BlocProvider.value(
            value: _loginCubit,
            child: LoginView(),
          ),
          routes: [
            GoRoute(
              path: 'verification',
              builder: (context, state) => BlocProvider.value(
                value: _loginCubit,
                child: PhoneVerificationPage(),
              ),
            ),
          ],
        ),
        GoRoute(
          path: "/home",
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          path: '/chat/:roomId',
          builder: (context, state) => ChatPage(
            roomId: state.pathParameters['roomId'],
          ),
        ),
        GoRoute(
          path: "/mechanic/:id",
          builder: (context, state) => MechanicPage(),
        ),
      ],
    );
  }
}
