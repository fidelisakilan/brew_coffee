import 'package:brew_crew/screen/authenticate/signin.dart';
import 'package:flutter/material.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
     // padding: EdgeInsets.symmetric(vertical:20.0,horizontal:20.0),
      child: Signin(),
    );
  }
}