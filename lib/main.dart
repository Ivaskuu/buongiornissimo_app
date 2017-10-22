import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'main_ui.dart';
import 'dart:async';

final GoogleSignIn googleSignIn = new GoogleSignIn();
final FirebaseAnalytics analytics = new FirebaseAnalytics();
final FirebaseAuth auth = FirebaseAuth.instance;

void main()
{
  runApp(new MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    _ensureLoggedIn();

    return new MaterialApp
    (
      title: 'Buongiorinssimo',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MainUI(),
    );
  }

  Future<Null> _ensureLoggedIn() async
  {
    GoogleSignInAccount user = googleSignIn.currentUser;
    if (user == null) user = await googleSignIn.signInSilently(); // If already logged in
    if (user == null)
    {
      await googleSignIn.signIn(); // The first time ?
      analytics.logLogin();
    }

    if(await auth.currentUser() == null)
    {
      GoogleSignInAuthentication credentials = await googleSignIn.currentUser.authentication;
      await auth.signInWithGoogle
      (
        idToken: credentials.idToken,
        accessToken: credentials.accessToken
      );
    }
  }
}