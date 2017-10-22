import 'package:flutter/material.dart';

Color caffeColor = new Color.fromRGBO(92, 75, 81, 1.0);

class MainUI extends StatefulWidget
{
  @override
  MainUIState createState() => new MainUIState();
}

class MainUIState extends State<MainUI>
{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      appBar: new AppBar
      (
        backgroundColor: caffeColor,
        elevation: 0.0,
        leading: new Icon(Icons.local_cafe, color: Colors.white),
        title: new Text("Buongiornissimo", style: new TextStyle(color: Colors.white)),
        actions: <Widget>
        [
          new CircleAvatar
          (
            backgroundColor: Colors.white,
            child: new Icon(Icons.account_circle, color: caffeColor),
          )
        ]
      ),
      backgroundColor: caffeColor,
      body: new Center
      (
        child: new Text("Kaffee ?"),
      ),
    );
  }
}