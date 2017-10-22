import 'package:flutter/material.dart';
import 'custom_colors.dart';
import 'main.dart';
import 'ordina_list_ui.dart';

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
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (_) => new OrdinaListUI()))/*.then(
                  (Task task)
                  {
                    if( task != null )
                    {
                      addTask(task);
                    }
                  })*/,
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
                  onTap: () => _ordina(),
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

  void _ordina()
  {
    var ref = reference.push();
    ref.set
    ({
      "nome": googleSignIn.currentUser.displayName,
      "foto": googleSignIn.currentUser.photoUrl,
      "classe": "5^C",
      "aula": 24,
      "completato": false,
      "consegnatore": null,
      "id": ref.key,
      "num_oggetti": 3,
      "oggetti": 
      {
        "Caffè espresso":
        {
          "quantita": 1,
          "prezzo": 0.30,
          "macchinetta": 0
        },
        "Acqua naturale":
        {
          "quantita": 2,
          "prezzo": 0.35,
          "macchinetta": 1
        },
        "Panino salame":
        {
          "quantita": 1,
          "prezzo": 1.35,
          "macchinetta": 3
        },
        "Cordon bleu":
        {
          "quantita": 1,
          "prezzo": 2.05,
          "macchinetta": 3
        },
        "Acqua frizzante":
        {
          "quantita": 1,
          "prezzo": 0.35,
          "macchinetta": 1
        },
        "Cioccolata":
        {
          "quantita": 1,
          "prezzo": 0.30,
          "macchinetta": 0
        },
      }
    });
    analytics.logEvent(name: "nuova_richiesta");
  }
}