import 'dart:async';
import 'package:example/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //fetching only uid

  MyUser? _userFromFireBase(User user){
    return user != null ? MyUser(uid:user.uid) : null;
  }

  Stream<MyUser?> get user{
    return _auth.authStateChanges().map((User? user)=>_userFromFireBase(user!));
  }

  //anon
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFireBase(user!);
    }
    catch(err){
      print(err.toString());
      return null;
    }
  }


  //sign in

  Future signInWithEmailandPass(String email,String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFireBase(user!);
    }
    catch(err){
      print(err.toString());
      return null;
    }
  }

  //register
  Future  registerWithEmailandPass(String email,String password) async{
      try{
            UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
            User? user = result.user;
            return _userFromFireBase(user!);
      }
      catch(err){
          print(err.toString());
          return null;
      }
  }

  //sign out

  Future signOut() async {
    try{
      return await _auth.signOut();
    }
    catch(err){
      print(err.toString());
      return null;
    }
}
}