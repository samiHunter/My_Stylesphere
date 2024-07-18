import 'package:flutter/material.dart';
import 'package:my_styleshpere1/data/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  //need this
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
//need this

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          children: [
            Image.asset('assets/logo.png', height: 500),
            SizedBox(height: 30),
            TextField(
              //add controller:emailController
              controller: emailController,
              //add controller:emailController
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            TextField(
              //add controller:passwordController
              controller: passwordController,
              //add controller:passwordController
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            //need elevatedbutton
            ElevatedButton(
              onPressed: () async {
                await Authentication().Login(email: emailController.text, password: passwordController.text);
                Navigator.pushReplacementNamed(context, '/nav');
              },
              //need elevatedbutton
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('Don\'t have an Account? Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
