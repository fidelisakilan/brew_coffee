import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  final AuthService _auth= AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar:AppBar(backgroundColor: Colors.brown[400],
      elevation: 0.0,
      title: Text('Sigin in to Brew Crew'),
      centerTitle: true),
      body: Container(
        padding:EdgeInsets.symmetric(vertical:20.0,horizontal:50.0) ,
        child: RaisedButton(child: Text('Sign in anon'),
        onPressed: ()async{
          dynamic result = await _auth.signInAnnon();
          if(result ==null){
            print ('error signing in');
          }
          else{
            print('signed in ');
            print (result.uid);
          }
        },
        ),


      ),
    );
  }
}