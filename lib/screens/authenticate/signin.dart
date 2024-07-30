
import 'package:example/services/auth.dart';
import 'package:flutter/material.dart';
class signIn extends StatefulWidget {
  final Function toggleView;

  const signIn({super.key,required this.toggleView});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();


  String email = '';
  String password = '';
  String err = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.white60,
        elevation: 0.0,
        title: Text('Sign in'),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label:Text('Register'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val)=>
                  val!.isEmpty ? "Enter Email" : null
                  ,
                  onChanged: (val){
                      setState(() {
                        email = val;
                      });
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  validator: (val)=> val!.length < 6 ? "Enter a password longer than 6" : null,
                  onChanged: (val){
                      setState(() {
                        password = val;
                      });
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  child: Text('Sign In'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent),
                    textStyle: MaterialStateProperty.all(TextStyle(color:Colors.white))
                  ),
                  onPressed: () async{
                    if(_formKey.currentState!.validate()){
                      dynamic result = await _auth.signInWithEmailandPass(email, password);
                      if(result == null) {
                        setState(() =>
                        err = 'Invalid Credentials');
                      }
                    }
                  },
                ),
                SizedBox(height: 12.0),
                Text(
                  err,
                  style: TextStyle(color: Colors.black87,fontSize: 14.0),
                )
              ],
            ),
          )
        )
      );
  }
}
