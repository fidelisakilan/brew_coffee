import 'package:flutter/material.dart';
import "package:brew_crew/screen/home/home.dart";
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either home or authenticate
        return Home();
  }
}
