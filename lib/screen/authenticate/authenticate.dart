import 'package:brew_crew/screen/authenticate/register.dart';
import 'package:brew_crew/screen/authenticate/signin.dart';
import 'package:flutter/material.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn =true;
  void toggleView(){
    setState(() =>showSignIn=!showSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return Signin(toggleView:toggleView);
    }
    else{
      return Register(toggleView:toggleView);
    }
  }
}