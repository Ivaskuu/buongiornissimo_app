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
      body: new Container
      (
        margin: new EdgeInsets.symmetric(horizontal: 16.0),
        child: new Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>
          [
            new Container
            (
              margin: new EdgeInsets.symmetric(vertical: 4.0),
              child: new Card
              (
                child: new InkWell
                (
                  onTap: () => null,
                  child: new Container
                  (
                    margin: new EdgeInsets.symmetric(vertical: 24.0),
                    child: new ListTile
                    (
                      leading: new Icon(Icons.local_cafe, color: colorCaffe),
                      title: new Text("Caffè", style: new TextStyle(color: colorCaffe)),
                    ),
                  ),
                ),
              ),
            ),
            new Container
            (
              margin: new EdgeInsets.symmetric(vertical: 4.0),
              child: new Card
              (
                child: new InkWell
                (
                  onTap: () => null,
                  child: new Container
                  (
                    margin: new EdgeInsets.symmetric(vertical: 24.0),
                    child: new ListTile
                    (
                      leading: new Icon(Icons.local_cafe, color: colorCaffe),
                      title: new Text("Acqua", style: new TextStyle(color: colorCaffe)),
                    ),
                  ),
                ),
              ),
            ),
            new Container
            (
              margin: new EdgeInsets.symmetric(vertical: 4.0),
              child: new Card
              (
                child: new InkWell
                (
                  onTap: () => null,
                  child: new Container
                  (
                    margin: new EdgeInsets.symmetric(vertical: 24.0),
                    child: new ListTile
                    (
                      leading: new Icon(Icons.local_cafe, color: colorCaffe),
                      title: new Text("Croccantelle", style: new TextStyle(color: colorCaffe)),
                    ),
                  ),
                ),
              ),
            ),
            new Container
            (
              margin: new EdgeInsets.symmetric(vertical: 4.0),
              child: new Card
              (
                child: new InkWell
                (
                  onTap: () => null,
                  child: new Container
                  (
                    margin: new EdgeInsets.symmetric(vertical: 24.0),
                    child: new ListTile
                    (
                      leading: new Icon(Icons.local_cafe, color: colorCaffe),
                      title: new Text("Panini", style: new TextStyle(color: colorCaffe)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}