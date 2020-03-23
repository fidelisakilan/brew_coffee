import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import "package:firebase_auth/firebase_auth.dart";
class AuthService {

  final FirebaseAuth _auth= FirebaseAuth.instance;

  // crete user obj based on firebase
  User _userFromFireBaseUser(FirebaseUser user){
    return user!= null ? User(uid:user.uid):null;
  }

  //auth fire stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
    
    .map(_userFromFireBaseUser);
    //.map((FirebaseUser user) =>_userFromFireBase(user));
  }

  //sign in anon
  Future signInAnnon () async {
    try{
     AuthResult result = await _auth.signInAnonymously();
    FirebaseUser user= result.user;
    return _userFromFireBaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  
  //sign in with emai and pass
  Future signInWithEmailAndPassword(String email,String pass)async{
    try{
      AuthResult result =await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user=result.user;
      return _userFromFireBaseUser(user);

    }
    catch(e){
        print(e.toString());
        return null;
    }
  }


  //register with email
  Future registerWithEmailAndPassword(String email,String pass)async{
    try{
      AuthResult result =await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user=result.user;

      //create a new document for the user with the uid
      await DatabaseService(uid:user.uid).updateUserData('0','new crew meme',100);
      return _userFromFireBaseUser(user);

    }
    catch(e){
        print(e.toString());
        return null;
    }
  }

  

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