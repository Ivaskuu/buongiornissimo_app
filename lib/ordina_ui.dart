import 'package:flutter/material.dart';
import 'colors.dart';

class OrdinaUI extends StatefulWidget
{
  @override
  OrdinaUIState createState() => new OrdinaUIState();
}

class OrdinaUIState extends State<OrdinaUI>
{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      backgroundColor: colorCaffe,
      body: new Center
      (
        child: new Text("ORdina UI"),
      )
    );
  }
}