import 'package:flutter/material.dart';
import 'package:my_styleshpere1/data/firebase_auth.dart';
import 'package:my_styleshpere1/login.dart';// Import the account management page

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Order History'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderHistoryPage()),
              );
            },
          ),
          
          ListTile(
            leading: Icon(Icons.local_shipping),
            title: Text('Order Tracking'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderTrackingPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sign Out'),
             onTap: () async {
              await Authentication().signOut();
              // Navigate to the login screen or show a message
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
              // Add sign-out logic here
          ),
        ],
      ),
    );
  }
}

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: Center(
        child: Text('Order History Page'),
      ),
    );
  }
}

class OrderTrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Tracking'),
      ),
      body: Center(
        child: Text('Order Tracking Page'),
      ),
    );
  }
}
