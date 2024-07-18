import 'package:flutter/material.dart';
import 'package:my_styleshpere1/customize1_page.dart';
import 'package:my_styleshpere1/customize2_page.dart';
import 'package:my_styleshpere1/customize3_page.dart';
import 'package:my_styleshpere1/customize4_page.dart';
import 'package:my_styleshpere1/customize_page.dart';
import 'cart.dart';

class StorePage extends StatefulWidget {
  final Function(CartItem) onAddToCart;

  StorePage({required this.onAddToCart});

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> items = [
    {'image': 'assets/shirt.png', 'page': CustomizePage(item: 'assets/shirt.png', price: 20,)},
    {'image': 'assets/shirt1.png', 'page': Customize1Page(item: 'assets/shirt1.png', price: 10,)},
    {'image': 'assets/shirt2.png', 'page': Customize2Page(item: 'assets/shirt2.png', price: 15,)},
    {'image': 'assets/shirt3.png', 'page': Customize3Page(item: 'assets/shirt3.png', price: 25,)},
    {'image': 'assets/shirt4.png', 'page': Customize4Page(item: 'assets/shirt4.png', price: 30,)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('STYLESPHERE'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(items[selectedIndex]['image']),
            ),
          ),
          
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(items[index]['image']),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => items[selectedIndex]['page'],
                ),
              );
            },
            child: Text('Customize'),
          ),
        ],
      ),
    );
  }
}