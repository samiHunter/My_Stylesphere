import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_styleshpere1/util/exception.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> Login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    } on FirebaseException catch (e) {
      throw exceptions(e.message.toString());
    }
  }

  
  Future<void> Signup({
    required String email,
    required String password,
    required String username,
    // ignore: non_constant_identifier_names
    required String confirm_password,
  }) async {
    try{
      if(email.isNotEmpty && password.isNotEmpty && username.isNotEmpty && confirm_password.isNotEmpty){
        if(password==confirm_password){
          await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
        }else{
          throw exceptions('password and confirm password should be the same');
        }
      }else{
        throw exceptions('enter all the fields');
      }
    }on FirebaseException catch(e){
      throw exceptions(e.message.toString());
    }
  }
  Future<void> signOut() async { 
    await _auth.signOut();
}
}