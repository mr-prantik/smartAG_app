import 'package:example/models/user.dart';
import 'package:example/screens/authenticate/authentication.dart';
import 'package:example/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class wrapper extends StatelessWidget {
  const wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context);
    if(user==null){
      return Auth();
    }
    else{
      return home();
    }
  }
}
