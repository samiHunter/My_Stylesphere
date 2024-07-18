import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_styleshpere1/cart.dart';
import 'package:my_styleshpere1/customize1_page.dart';
import 'package:my_styleshpere1/customize3_page.dart';
import 'package:my_styleshpere1/customize4_page.dart';
import 'package:my_styleshpere1/customize_page.dart';
import 'package:my_styleshpere1/firebase_options.dart';
import 'package:my_styleshpere1/navigation.dart';
import 'login.dart';
import 'signup.dart';
import 'store.dart';
import 'customize2_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(  MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Stylesphere',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/nav': (context) => Navigation(),
        '/store': (context) => StorePage(onAddToCart: (CartItem item) {
          // Implement your logic here
          print('Item added to cart: ${item}');
        }),
        '/customize': (context) => CustomizePage(item: 'assets/shirt.png', price: 20,),
        '/customize1': (context) => Customize1Page(item: 'assets/shirt1.png', price: 10,),
        '/customize2': (context) => Customize2Page(item: 'assets/shirt2.png', price: 15,),
        '/customize3': (context) => Customize3Page(item: 'assets/shirt3.png', price: 25,),
        '/customize4': (context) => Customize4Page(item: 'assets/shirt4.png', price: 30,),
      },
    );
  }
}
