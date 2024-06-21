import 'dart:collection';

import 'package:app1/dashboard/cubit/dashboard_cubit.dart';
import 'package:app1/dashboard/view/dashboard_page.dart';
import 'package:app1/profile/view/profile_view.dart';
import 'package:app1/settings/view/settings_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  final pagearr = [Dashboard(), OnProgress(), OnProgress(), OnProgress()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: "tes",
                      filled: true,
                      fillColor: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg"),
                  ),
                )
              ],
            ),
          ),
          preferredSize: Size(double.infinity, 30),
        ),
        backgroundColor: Color(0xFF262626),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        onTap: (value) {
          context.read<DashboardCubit>().changePage(value);
          if (value == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsView()),
            );
          }
        },
        backgroundColor: Color(0xFF262626),
        selectedItemColor: Color(0xFFFFFFFF),
        unselectedItemColor: Color(0xFFFFFFFF),
        snakeViewColor: Color(0xFFFF693A),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: BlocBuilder<DashboardCubit, int>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(30),
            child: pagearr[state],
          );
        },
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Layanan",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            TextButton(onPressed: () {}, child: Text("Lainnya"))
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ServiceItem(
              color: Color(0xFFCCCCCC),
              icon: Icons.car_crash,
              text: "Pelayanan\nDarurat",
            ),
            ServiceItem(
              color: Color(0xFFCCCCCC),
              icon: Icons.tire_repair,
              text: "Perbaikan",
            ),
            ServiceItem(
              color: Color(0xFFCCCCCC),
              icon: Icons.shopping_bag,
              text: "Beli\nSparepart",
            ),
            ServiceItem(
              color: Color(0xFFCCCCCC),
              icon: Icons.local_car_wash,
              text: "Cuci\nkendaraan",
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          "Bengkel Terdekat",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [MechanicItem(), MechanicItem()],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Paling Banyak Dicari",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [MechanicItem(), MechanicItem()],
        ),
      ],
    );
  }
}

class ServiceItem extends StatelessWidget {
  const ServiceItem(
      {required this.color, required this.icon, required this.text});

  final Color color;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 50,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class MechanicItem extends StatelessWidget {
  const MechanicItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // delete me
      child: GestureDetector(
        onTap: () {},
        child: Card(
          elevation: 2,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        color: Color(0x40000000),
                      )
                    ],
                  ),
                  child: Image.network(
                    "https://media.istockphoto.com/id/1347150429/id/foto/mekanik-profesional-bekerja-pada-mesin-mobil-di-garasi.jpg?s=612x612&w=0&k=20&c=Uw7QwBTEc98rrQPg6j5lmWRe-HHmf7vbiKlZ0WphJHM=",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("1.95 km"),
                SizedBox(height: 10),
                Text("Bengkel Mobil"),
                Text(
                  "Makmur Jaya",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: 40,
                      color: Color(0xFFFFC700),
                    ),
                    Text(
                      "4.6",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnProgress extends StatelessWidget {
  const OnProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("WIP");
  }
}
