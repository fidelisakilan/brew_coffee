import 'package:flutter/material.dart';
import 'package:brew_crew/screen/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home:Wrapper(),

    );
  }
}

