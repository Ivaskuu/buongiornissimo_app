import 'package:flutter/material.dart';

class ConsegnaUI extends StatefulWidget
{
  @override
  ConsegnaUIState createState() => new ConsegnaUIState();
}

class ConsegnaUIState extends State<ConsegnaUI>
{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      body: new Center
      (
        child: new Text("Consegna UI"),
      )
    );
  }
}