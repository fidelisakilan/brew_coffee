import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screen/authenticate/authenticate.dart';
import 'package:brew_crew/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import "package:brew_crew/screen/home/home.dart";
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user =Provider.of<User>(context);
    //return either home or authenticate
      if(user==null){
        return Authenticate();

      }
      else{
        return Home();
      }
  }
}
