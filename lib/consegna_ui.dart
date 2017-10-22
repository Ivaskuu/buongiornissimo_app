import 'package:flutter/material.dart';
import 'colors.dart';

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
      backgroundColor: colorCaffe,
      body: new Center
      (
        child: new Text("Consegna UI"),
      )
    );
  }
}