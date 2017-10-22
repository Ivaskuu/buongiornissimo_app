import 'package:flutter/material.dart';
import 'custom_colors.dart';

class MieiOrdiniUI extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      backgroundColor: colorCaffe,
      body: new Text("I miei ordini"),
    );
  }
}