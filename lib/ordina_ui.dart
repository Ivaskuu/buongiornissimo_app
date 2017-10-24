import 'package:flutter/material.dart';
import 'custom_colors.dart';
import 'main.dart';
import 'ordina_list_ui.dart';

class OrdinaUI extends StatefulWidget
{
  @override
  OrdinaUIState createState() => new OrdinaUIState();
}

class OrdinaUIState extends State<OrdinaUI> with SingleTickerProviderStateMixin
{
  TabController controller;

  @override
  void initState()
  {
    super.initState();
    controller = new TabController(vsync: this, length: 4);
  }

  @override
  void dispose()
  {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      appBar: new TabBar
      (
        controller: controller,
        tabs: <Tab>
        [
          new Tab(icon: new Icon(Icons.local_cafe)),
          new Tab(icon: new Icon(Icons.local_drink)),
          new Tab(icon: new Icon(Icons.local_dining)),
          new Tab(icon: new Icon(Icons.restaurant)),
        ]
      ),
      backgroundColor: colorCaffe,
      body: new Container
      (
        margin: new EdgeInsets.symmetric(horizontal: 16.0),
        child: new Column
        (
          children: <Widget>
          [
            new ListTile
            (
              leading: new Icon(Icons.local_cafe, color: Colors.white),
              title: new Text("Machinetta Caffè", style: new TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
            ),
            new SizedBox.fromSize(size: new Size.fromHeight(150.0), child: new GridView.count
            (
              crossAxisCount: 1,
              scrollDirection: Axis.horizontal,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              children: <Widget>
              [
                new GridTile
                (
                  child: new Container(decoration: new BoxDecoration(image: new DecorationImage(image: new NetworkImage("http://www.fondazionebellaria.it/wp-content/uploads/2014/09/CAFFE-MEMORIA.jpg"), fit: BoxFit.cover))),
                  footer: new GridTileBar
                  (
                    backgroundColor: Colors.black.withAlpha(200),
                    title: new Text("Caffè espresso"),
                    subtitle: new Text("0.25 €"),
                  ),
                ),
                new GridTile
                (
                  child: new Container(decoration: new BoxDecoration(image: new DecorationImage(image: new NetworkImage("http://www.fondazionebellaria.it/wp-content/uploads/2014/09/CAFFE-MEMORIA.jpg"), fit: BoxFit.cover))),
                  footer: new GridTileBar
                  (
                    backgroundColor: Colors.black.withAlpha(200),
                    title: new Text("Caffè lungo"),
                    subtitle: new Text("0.25 €"),
                  ),
                ),
                new GridTile
                (
                  child: new Container(decoration: new BoxDecoration(image: new DecorationImage(image: new NetworkImage("http://www.fondazionebellaria.it/wp-content/uploads/2014/09/CAFFE-MEMORIA.jpg"), fit: BoxFit.cover))),
                  footer: new GridTileBar
                  (
                    backgroundColor: Colors.black.withAlpha(200),
                    title: new Text("Caffè macchiato"),
                    subtitle: new Text("0.25 €"),
                  ),
                )
              ],),
            ),
            new ListTile
            (
              leading: new Icon(Icons.invert_colors, color: Colors.white),
              title: new Text("Machinetta Acqua", style: new TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
            ),
            new SizedBox.fromSize(size: new Size.fromHeight(150.0), child: new GridView.count
            (
              crossAxisCount: 1,
              scrollDirection: Axis.horizontal,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              children: <Widget>
              [
                new GridTile
                (
                  child: new Container(decoration: new BoxDecoration(image: new DecorationImage(image: new NetworkImage("http://www.humanitasalute.it/wp-content/uploads/2016/06/acqua_naturale_acqua_frizzante.jpg"), fit: BoxFit.cover))),
                  footer: new GridTileBar
                  (
                    backgroundColor: Colors.black.withAlpha(200),
                    title: new Text("Acqua naturale"),
                    subtitle: new Text("0.30 €"),
                  ),
                ),
                new GridTile
                (
                  child: new Container(decoration: new BoxDecoration(image: new DecorationImage(image: new NetworkImage("https://www.piuvivi.com/images/immagini/nutrizione/acqua-gassata-frizzante-fa-male-fa-bene.jpg"), fit: BoxFit.cover))),
                  footer: new GridTileBar
                  (
                    backgroundColor: Colors.black.withAlpha(200),
                    title: new Text("Acqua frizzante"),
                    subtitle: new Text("0.30 €"),
                  ),
                ),
                new GridTile
                (
                  child: new Container(decoration: new BoxDecoration(image: new DecorationImage(image: new NetworkImage("http://www.couverture-fb.com/wp-content/uploads/2012/05/couverture-facebook-canette-pepsi.jpg"), fit: BoxFit.cover))),
                  footer: new GridTileBar
                  (
                    backgroundColor: Colors.black.withAlpha(200),
                    title: new Text("Pepsi"),
                    subtitle: new Text("0.30 €"),
                  ),
                )
              ],),
            ),
          ],
        )
      )
    );
  }
  
  //Navigator.of(context).push(new MaterialPageRoute(builder: (_) => new OrdinaListUI())).then((Task task){if( task != null ){addTask(task);}})

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