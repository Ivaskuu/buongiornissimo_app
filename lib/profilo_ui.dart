import 'package:flutter/material.dart';
import 'custom_colors.dart';
import 'main.dart';

class ProfiloUI extends StatefulWidget
{
  @override
  ProfiloUIState createState() => new ProfiloUIState();
}

class ProfiloUIState extends State<ProfiloUI>
{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      appBar: new AppBar
      (
        title: new Text("Ivascu Adrian"),
        actions: <Widget>
        [
          new IconButton
          (
            icon: new Icon(Icons.exit_to_app),
            onPressed: () => null,
          )
        ],
      ),
      backgroundColor: colorCaffe,
      body: new ListView
      (
        children: <Widget>
        [
          new Container
          (
            margin: new EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: new Card
            (
              child: new Container
              (
                margin: new EdgeInsets.symmetric(vertical: 24.0),
                child: new Column
                (
                  children: <Widget>
                  [
                    new CircleAvatar /* User image */
                    (
                      radius: 40.0,
                      backgroundImage: new NetworkImage(googleSignIn.currentUser.photoUrl)
                    ),
                    new Container
                    (
                      margin: new EdgeInsets.only(top: 16.0),
                      child: new Text(googleSignIn.currentUser.displayName, style: Theme.of(context).textTheme.title.copyWith(color: Colors.black), textScaleFactor: 1.4),
                    ),
                    new Text("52 punti onestà")
                  ],
                ),
              ),
            ),
          ),
          new Container
          (
            margin: new EdgeInsets.symmetric(horizontal: 24.0),
            child: new Card
            (
              child: new Column
              (
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>
                [
                  new Container
                  (
                    margin: new EdgeInsets.all(16.0),
                    child: new Text("Ultimi 5 ordini"),
                  ),
                  new ListTile
                  (
                    leading: new Icon(Icons.local_cafe),
                    title: new Text("Caffe espresso"),
                    subtitle: new Text("09:58h 24/10/2017"),
                  ),
                  new ListTile
                  (
                    leading: new Icon(Icons.local_cafe),
                    title: new Text("Caffe espresso"),
                    subtitle: new Text("09:58h 24/10/2017"),
                  ),
                  new ListTile
                  (
                    leading: new Icon(Icons.local_cafe),
                    title: new Text("Caffe espresso"),
                    subtitle: new Text("09:58h 24/10/2017"),
                  ),
                  new ListTile
                  (
                    leading: new Icon(Icons.local_cafe),
                    title: new Text("Caffe espresso"),
                    subtitle: new Text("09:58h 24/10/2017"),
                  ),
                  new ListTile
                  (
                    leading: new Icon(Icons.local_cafe),
                    title: new Text("Caffe espresso"),
                    subtitle: new Text("09:58h 24/10/2017"),
                  ),
                ],
              ),
            ),
          ),
          new Container
          (
            margin: new EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: new Card
            (
              child: new Column
              (
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>
                [
                  new Container
                  (
                    margin: new EdgeInsets.all(16.0),
                    child: new Text("Ultime 5 consegne"),
                  ),
                  new ListTile
                  (
                    leading: new Icon(Icons.local_cafe),
                    title: new Text("Caffe espresso"),
                    subtitle: new Text("09:58h 24/10/2017"),
                  ),
                  new ListTile
                  (
                    leading: new Icon(Icons.local_cafe),
                    title: new Text("Caffe espresso"),
                    subtitle: new Text("09:58h 24/10/2017"),
                  ),
                  new ListTile
                  (
                    leading: new Icon(Icons.local_cafe),
                    title: new Text("Caffe espresso"),
                    subtitle: new Text("09:58h 24/10/2017"),
                  ),
                  new ListTile
                  (
                    leading: new Icon(Icons.local_cafe),
                    title: new Text("Caffe espresso"),
                    subtitle: new Text("09:58h 24/10/2017"),
                  ),
                  new ListTile
                  (
                    leading: new Icon(Icons.local_cafe),
                    title: new Text("Caffe espresso"),
                    subtitle: new Text("09:58h 24/10/2017"),
                  ),
                ],
              )
            )
          ),
        ],
      )
    );
  }
}