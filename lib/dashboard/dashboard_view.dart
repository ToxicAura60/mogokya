import 'package:carousel_slider/carousel_slider.dart';
import 'package:firestore_repository/firestore_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: TextField(
          decoration: InputDecoration(
            hintText: "Cari layanan",
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Color(0xFFFFFFFF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(1000),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 250,
                viewportFraction: 1.0,
              ),
              items: [
                "https://snov.io/blog/wp-content/uploads/2021/08/Webp.net-resizeimage3-1024x512.png"
              ].map((i) {
                return Container(
                  child: Image.network(
                    i,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bengkel Terdekat",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      elevation: 0,
                      backgroundColor: Color(0xFFFF693A),
                    ),
                    child: Text(
                      "Lihat Semua",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: StreamBuilder(
                stream: FirestoreRepository().getMechanic(),
                builder: (context, snapshot) => Row(
                    children: snapshot.data == null
                        ? []
                        : snapshot.data!.docs.map(
                            (document) {
                              return GestureDetector(
                                onTap: () {
                                  context.go("/mechanic/da");
                                },
                                child: Card(
                                  key: ValueKey(document.id),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  color: Color(0xFFF5F5F5),
                                  child: Container(
                                    width: 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            "${document['photoURL']}",
                                            width: double.infinity,
                                            height: 150,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("1.95km"),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text("Bengkel Mobil"),
                                              Text(
                                                "${document['firstName']} ${document['lastName']}",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star_rounded,
                                                    color: Color(0xFFFFEB3B),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "${document['rating']}",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).toList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
