import 'package:brew_crew/screen/home/settings_form.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/screen/home/brew_list.dart';
import 'package:brew_crew/models/brew.dart';
class Home extends StatelessWidget {
  final AuthService _auth= AuthService();
  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder:(context){
        return Container(
          padding:EdgeInsets.symmetric(vertical:20.0,horizontal:60.0),
          child: SettingsForm(),
        );
      });
    }


    return StreamProvider<List<Brew>>.value(
      value:DatabaseService().brews ,
          child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title:Text('Brew Crew') ,
          backgroundColor: Colors.brown[400],
          centerTitle: true,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              label: Text('Logout'),
              icon: Icon(Icons.remove_circle_outline),            
              onPressed: () async{
                await _auth.signOut();
              
              },),
              FlatButton.icon(onPressed: ()=>_showSettingsPanel(), icon: Icon(Icons.settings), label: Text('settings'))
          ],
        ),
        body: Container(
          child: BrewList(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover
            )
          ),
          ),
      ),
    );
  }
}