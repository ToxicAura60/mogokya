import 'package:flutter/material.dart';

class DetailBengkelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image (shortened for brevity)
          Image.network('https://www.shutterstock.com/...',
              width: double.infinity, height: 100, fit: BoxFit.cover),

          // Content di atas gambar (AppBar replacement) (shortened for brevity)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
                child: Container(// ... isi sama seperti sebelumnya
                    )),
          ),
          // Label "Ganti Ban" (shortened for brevity)
          Positioned(
            top: 160,
            left: 0,
            right: 0,
            child: Container(// ... isi sama seperti sebelumnya
                ),
          ),

          // Scrollable content (Body)
          Positioned.fill(
            top: 200,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(// ... (isi Row Makmur Jaya sama seperti sebelumnya)
                      ),
                  Text('Jl. Digital Kreatif No. 10, Palmerah, Jakarta Barat'),
                  SizedBox(height: 16),
                  DefaultTabController(
                    // (Perbaikan DefaultTabController)
                    length: 4,
                    child: Column(
                      children: [
                        TabBar(
                          // ... (style seperti sebelumnya)
                          tabs: [
                            Tab(text: 'Tentang'),
                            Tab(text: 'Layanan'),
                            Tab(text: 'Galeri'),
                            Tab(text: 'Ulasan'),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Center(child: Text('Tentang')),
                              Center(child: Text('Layanan')),
                              Center(child: Text('Galeri')),
                              Center(child: Text('Ulasan')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  // ... (isi body lainnya sama seperti sebelumnya)
                  Text(
                    'Tentang',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.',
                    style: TextStyle(fontSize: 11),
                  ), // Deskripsi singkat
                  SizedBox(height: 24),
                  Text(
                    'Penyedia Jasa',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/a/a0/Andrzej_Person_Kancelaria_Senatu.jpg'),
                    ),
                    title: Text(
                      'Makmur Jaya',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, height: 1.2),
                    ),
                    subtitle: Text(
                      'Bengkel Mobil',
                      style: TextStyle(
                          fontSize: 10, color: Colors.black, height: 1.2),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Color(0xFFF5F5F5), shape: BoxShape.circle),
                          child: IconButton(
                              icon: Icon(Icons.chat,
                                  size: 25, color: Color(0xFFFB9548)),
                              padding: EdgeInsets.zero,
                              onPressed: () {}),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Color(0xFFF5F5F5), shape: BoxShape.circle),
                          child: IconButton(
                              icon: Icon(
                                Icons.call,
                                size: 25,
                                color: Color(0xFFFB9548),
                              ),
                              padding: EdgeInsets.zero,
                              onPressed: () {}),
                        ),
                      ],
                    ),
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
              child: Column(
                // Bungkus semua children dalam Column
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Estimasi Biaya',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                        Text('Rp. 50.000',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(height: 3),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: Color(0xFF262626),
                    ),
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(165, 45),
                              backgroundColor: Color(0xFF262626),
                              foregroundColor: (Color(0xFFFF693A)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: BorderSide(
                                width: 2.0,
                                color: Color(0xFFFF693A),
                              )),
                          onPressed: () {},
                          child: Text('Atur Jadwal',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(5),
                              fixedSize: Size(165, 45),
                              backgroundColor: Color(0xFFFF693A),
                              foregroundColor: (Color(0xFFFFFFFF)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: BorderSide(
                                width: 2.0,
                                color: Color(0xFFFF693A),
                              )),
                          onPressed: () {},
                          child: Text(
                            'Pesan Sekarang',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ), // Tutup kurung Positioned di sini
          )
        ],
      ),
    );
  }
}

  // Fungsi pembantu untuk membuat tombol lingkaran
//   Widget _buildCircleButton(IconData icon) {
//     return Container(
//       width: 40,
//       height: 40,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         shape: BoxShape.circle,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: IconButton(
//         icon: Icon(icon, color: Colors.black),
//         onPressed: () {},
//         padding: EdgeInsets.zero,
//       ),
//     );
//   }
// }










// Positioned(
//                     bottom: 0,
//                     left: 0,
//                     right: 0,
//                     child: Container(
//                       child: Column(
//                         // Bungkus semua children dalam Column
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text('Estimasi Biaya',
//                                     style: TextStyle(
//                                         fontSize: 17,
//                                         fontWeight: FontWeight.bold)),
//                                 Text('Rp. 50.000',
//                                     style: TextStyle(
//                                         fontSize: 24,
//                                         fontWeight: FontWeight.bold)),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 3),
//                           Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(15),
//                                 topRight: Radius.circular(15),
//                               ),
//                               color: Color(0xFF262626),
//                             ),
//                             padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                       fixedSize: Size(165, 45),
//                                       backgroundColor: Color(0xFF262626),
//                                       foregroundColor: (Color(0xFFFF693A)),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       side: BorderSide(
//                                         width: 2.0,
//                                         color: Color(0xFFFF693A),
//                                       )),
//                                   onPressed: () {},
//                                   child: Text('Atur Jadwal',
//                                       style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold)),
//                                 ),
//                                 ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                       padding: EdgeInsets.all(5),
//                                       fixedSize: Size(165, 45),
//                                       backgroundColor: Color(0xFFFF693A),
//                                       foregroundColor: (Color(0xFFFFFFFF)),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       side: BorderSide(
//                                         width: 2.0,
//                                         color: Color(0xFFFF693A),
//                                       )),
//                                   onPressed: () {},
//                                   child: Text(
//                                     'Pesan Sekarang',
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
