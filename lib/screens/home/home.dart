import 'package:example/services/auth.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {


  final AuthService _auth = AuthService();

  var state = 0;
  var text ="on";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue,
        elevation: 0.0,
        actions: <Widget>[
          ElevatedButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async{
                await _auth.signOut();
            },
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 100.0),
          child:Form(
            child: Column(

              children: <Widget>[

                SizedBox(height: 20.0),
                ElevatedButton(
                  child: Text("Click"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    textStyle: MaterialStateProperty.all(TextStyle(color:Colors.white))
                  ),
                  onPressed:  () async{
                    print("I'm clicked");
                  },
                )
              ],
            ),
          )
      ),
    );
  }
}
