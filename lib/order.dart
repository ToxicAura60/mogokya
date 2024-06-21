import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class KeranjangSayaPage extends StatefulWidget {
  @override
  _KeranjangSayaPageState createState() => _KeranjangSayaPageState();
}

class _KeranjangSayaPageState extends State<KeranjangSayaPage> {
  List<Map<String, dynamic>> cartItems = [
    {
      'storeName': 'Anugrah Bakti',
      'productName': 'Rantai motor',
      'price': 53000,
      'quantity': 1,
      'image': 'lib/assets/rantai_motor.png', // Ganti dengan path gambar Anda
    },
    {
      'storeName': 'Anugrah Bakti',
      'productName': 'Gir belakang',
      'price': 70000,
      'quantity': 1,
      'image': 'lib/assets/gir_belakang.png', // Ganti dengan path gambar Anda
    },
    {
      'storeName': 'Yamaha Pengumben',
      'productName': 'Aki Motor',
      'price': 270000,
      'quantity': 1,
      'image': 'lib/assets/aki_motor.png', // Ganti dengan path gambar Anda
    },
  ];

  double totalHarga = 0; // Total price variable

  @override
  void initState() {
    super.initState();
    calculateTotalHarga(); // Calculate initial total price
  }

  void calculateTotalHarga() {
    setState(() {
      totalHarga = 0;
      for (var item in cartItems) {
        totalHarga += (item['price'] * item['quantity']).toInt();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final groupedCartItems = groupBy(cartItems, (item) => item['storeName']);

    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang Saya'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: groupedCartItems.length,
        itemBuilder: (context, index) {
          final storeName = groupedCartItems.keys.elementAt(index);
          final storeItems = groupedCartItems[storeName];

          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    storeName!, // Assuming storeName cannot be null
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:
                      storeItems!.length, // Assuming storeItems cannot be null
                  itemBuilder: (context, productIndex) {
                    final item = storeItems[productIndex];
                    return Row(
                      // Use Row for horizontal layout
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset(item['image']),
                        ),
                        SizedBox(width: 16), // Space between image and details
                        Expanded(
                          // Allow details to take remaining space
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['productName'],
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Rp ${item['price'].toStringAsFixed(0)}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Quantity controls remain in trailing of the ListTile
                        Container(
                          width: 125,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {},
                              ),
                              Text(item['quantity'].toString()),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rp ${totalHarga.toStringAsFixed(0)}',
                style: TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  Icon(Icons.shopping_cart), // Shopping cart icon
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: Text('Beli'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
