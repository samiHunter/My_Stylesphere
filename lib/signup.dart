import 'package:flutter/material.dart';
import 'package:my_styleshpere1/data/firebase_auth.dart';

class SignUpPage extends StatelessWidget {
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 400),
            SizedBox(height: 2),
            TextField(
              controller: username,
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            TextField(
              controller: confirmPassword,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
           //need elevatedbutton
            ElevatedButton(
              onPressed: () async  {
                await Authentication().Signup(email: email.text, password: password.text, username: username.text, confirm_password: confirmPassword.text);
                Navigator.pushReplacementNamed(context, '/nav');
              },
               //need elevatedbutton
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
