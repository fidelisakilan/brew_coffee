import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:brew_crew/shared/constants.dart';
class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth= AuthService();
  final _formKey =GlobalKey<FormState>();

    bool loading=false;
    String email='';
  String pass='';
  String error='';

  @override
  Widget build(BuildContext context) {
     return loading? Loading():Scaffold(
      backgroundColor: Colors.brown[100],
      appBar:AppBar(backgroundColor: Colors.brown[400],
      elevation: 0.0,
      title: Text('Sigin Up to Brew Crew'),
      actions: <Widget>[
        FlatButton.icon(onPressed: (){
          widget.toggleView();
        },
         icon: Icon(Icons.person),
          label: Text('Sign In'))
      ]
      ),
      body: Container(
        padding:EdgeInsets.symmetric(vertical:20.0,horizontal:50.0) ,
        child: Form(
          key:_formKey,
          child:Column(
          children:<Widget>[
            SizedBox(height:20.0),
            TextFormField(
              decoration:textInputDecoration.copyWith(hintText:'Email'),
              validator: (val)=>val.isEmpty?'Enter an email':null,
              onChanged:(val){
                setState(() =>email=val);
              }
            ),
            SizedBox(height: 20.0),
            TextFormField(
            decoration:textInputDecoration.copyWith(hintText:'Password'),
              validator: (val)=>val.length<8?'Enter an password 8 + char long':null,
              obscureText: true,
              onChanged: (val){
                setState(()=>pass=val);
              },
            ),
            SizedBox(height: 20.0,),
            RaisedButton(
              color: Colors.brown[900],
              child:Text(
                'Sign Up',
                style: TextStyle(
                  color:Colors.white 
                ),),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    setState(()=>loading=true);
                   dynamic result =await _auth.registerWithEmailAndPassword(email,pass);
                  if(result==null){
                    
                    setState((){
                      loading=false;
                      error='please supply a valid email';
                      });
                  }

                  }

                },

            ),
            SizedBox(height: 12.0,),
            Text(
              error,style: TextStyle(color: Colors.red,fontSize: 14.0),
            )
          ]
        ),)


      ),
    );
  }
}