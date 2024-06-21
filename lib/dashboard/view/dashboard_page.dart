import 'package:app1/dashboard/cubit/dashboard_cubit.dart';
import 'package:app1/dashboard/view/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardCubit(),
      child: DashboardView(),
    );
  }
}
