import 'package:app1/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Profile Saya',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://performanceautospecialists.com/wp-content/uploads/2019/05/46212975_m.jpg"),
              child: Icon(Icons.person),
            ),
            title: Text(
              context.read<AppBloc>().state.user.name == null
                  ? "User"
                  : context.read<AppBloc>().state.user.name!,
            ),
            subtitle: Text(context.read<AppBloc>().state.user.phoneNumber!),
          ),
          Divider(), // Garis pemisah
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Activity & History'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment Methods'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Alamat'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help & Question'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Log Out',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              context.read<AppBloc>().add(AppLogoutRequested());
            },
          ),
        ],
      ),
    );
  }
}
