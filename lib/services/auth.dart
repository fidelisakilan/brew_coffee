import 'package:brew_crew/models/user.dart';
import "package:firebase_auth/firebase_auth.dart";
class AuthService {

  final FirebaseAuth _auth= FirebaseAuth.instance;

  // crete user obj based on firebase
  User _userFromFireBase(FirebaseUser user){
    return user!= null ? User(uid:user.uid):null;
  }

  //auth fire stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
    
    .map(_userFromFireBase);
    //.map((FirebaseUser user) =>_userFromFireBase(user));
  }

  //sign in anon
  Future signInAnnon () async {
    try{
     AuthResult result = await _auth.signInAnonymously();
    FirebaseUser user= result.user;
    return _userFromFireBase(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  
  //sign in with emai and pass

  //register with emia

  //sign out
  Future signOut () async {

    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;

    }


  }

}