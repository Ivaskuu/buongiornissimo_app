import 'package:flutter/material.dart';
import 'main_ui.dart';
import 'oggetto.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

final GoogleSignIn googleSignIn = new GoogleSignIn();
final FirebaseAnalytics analytics = new FirebaseAnalytics();
final FirebaseAuth auth = FirebaseAuth.instance;
final DatabaseReference reference = FirebaseDatabase.instance.reference().child("ordini");

void main()
{
  loadCarello();
  runApp(new MyApp());
}

List<int> carello = new List(); // int perchè metto dentro l'ID dell'oggetto (cioè la pos nella lista)
// WARNING: è molto rischioso, se la lista viene aggiornata, però non ho voglia di fare altramente
// forse nel futuro aggiungerò gli oggetti nel database e li farò scaricare

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

/* ---------------- */
/* Funzioni globali */
/* ---------------- */
loadCarello() async
{
  SharedPreferences prefs = await SharedPreferences.getInstance();

  try
  {
    List<String> carelloStringa = prefs.getStringList("carello");
    carelloStringa.forEach((String oggetto) => carello.add(int.parse(oggetto)));
  }
  catch (Exception) { /* E niente, bonasera */ }
}

salvaCarello() async
{
  List<String> carelloStringa = new List();
  carello.forEach((int oggetto) => carelloStringa.add(oggetto.toString()));

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList("carello", carelloStringa);
}

void aggiungiAlCarello(int idOggetto)
{
  carello.add(idOggetto);
  salvaCarello(); // TODO: Non è molto ottimizzato
}