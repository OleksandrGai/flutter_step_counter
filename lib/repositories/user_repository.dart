import 'package:firebase_auth/firebase_auth.dart';

class UserRepository{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserRepository();

  Future<User?> singUp(String email, String password) async {
    try {
      var auth = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return  auth.user;
    } catch(e) {
      print(e.toString());
    }
  }
  Future<User?> singIn(String email, String password) async {
    try {
      var auth = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return  auth.user;
    } catch(e) {
      print(e.toString());
    }
  }

  Future<void> singOut() async{
    await firebaseAuth.signOut();
  }

  Future<bool> isSignedIn() async{
   var currentUser = firebaseAuth.currentUser;
   return currentUser != null;
  }
  Future<User?> getCurrentUser() async{
   return await firebaseAuth.currentUser;
  }
}

