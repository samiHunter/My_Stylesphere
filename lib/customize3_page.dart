import 'package:flutter/material.dart';
import 'package:my_styleshpere1/CartManager.dart';
import 'cart.dart';

class Customize3Page extends StatefulWidget {
  final String item;
  final double price;

  Customize3Page({required this.item, required this.price});

  @override
  _Customize3PageState createState() => _Customize3PageState();
}

class _Customize3PageState extends State<Customize3Page> {
  String _selectedColor = 'Red';
  String _selectedSize = 'M';
  int _quantity = 1;

  List<String> colors = ['Red', 'Blue', 'Green', 'Yellow'];
  List<String> sizes = ['S', 'M', 'L', 'XL'];

  void _addToCart() {
    CartManager().addItem(CartItem(
      widget.item,
      _selectedColor,
      _selectedSize,
      _quantity,
      widget.price,
    ));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shorts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.item),
            SizedBox(height: 10),
            Text('Select Color:'),
            DropdownButton<String>(
              value: _selectedColor,
              items: colors.map((String color) {
                return DropdownMenuItem<String>(
                  value: color,
                  child: Text(color),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedColor = newValue!;
                });
              },
            ),
            SizedBox(height: 10),
            Text('Select Size:'),
            DropdownButton<String>(
              value: _selectedSize,
              items: sizes.map((String size) {
                return DropdownMenuItem<String>(
                  value: size,
                  child: Text(size),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSize = newValue!;
                });
              },
            ),
            SizedBox(height: 10),
            Text('Quantity:'),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (_quantity > 1) _quantity--;
                    });
                  },
                ),
                Text('$_quantity'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _quantity++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              '\$${widget.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addToCart,
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
