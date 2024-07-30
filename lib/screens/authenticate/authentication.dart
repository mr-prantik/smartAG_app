import 'package:example/screens/authenticate/register.dart';
import 'package:example/screens/authenticate/signin.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  bool showSignIn = true;
  toggleView(){
    setState(() =>
      showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
   if(showSignIn){
     return signIn(toggleView:toggleView);
   }
   else{
     return Register(toggleView:toggleView);
   }
  }
}
