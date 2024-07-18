import 'package:flutter/material.dart';
import 'package:my_styleshpere1/CartManager.dart';

class CartItem {
  final String item;
  final String color;
  final String size;
  final int quantity;
  final double price;

  CartItem(this.item, this.color, this.size, this.quantity, this.price);
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _removeItem(int index) {
    setState(() {
      CartManager().removeItem(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = CartManager().items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset(item.item),
                      title: Text('${item.color} ${item.size}'),
                      subtitle: Text('Quantity: ${item.quantity}'),
                     trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('\$${item.price}'),
                          IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () {
                              setState(() {
                                CartManager().removeItem(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
             Padding(
  padding: const EdgeInsets.all(0),
  child: Container(
    padding: const EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Price',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        // Total price
        Text(
          'Total Price: \$${CartManager().totalPrice}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        // Row for buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                // Checkout button action
              },
              child: Text('Checkout'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/nav');
              },
              child: Text('Continue Shopping'),
            ),
          ],
        ),
      ],
    ),
  ),
)


                ],
              ),
            ),
          );
        }
      }
