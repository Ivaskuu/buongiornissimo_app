import 'package:flutter/material.dart';
import 'custom_colors.dart';
import 'main.dart';
import 'oggetto.dart';

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
          new Tab(icon: new Icon(Icons.local_pizza)),
          new Tab(icon: new Icon(Icons.restaurant)),
        ]
      ),
      backgroundColor: colorCaffe,
      body: new TabBarView
      (
        controller: controller,
        children: <Widget>
        [
          gridList([
            new Oggetto("Caffè Espresso", 0.25, 0, "http://www.fondazionebellaria.it/wp-content/uploads/2014/09/CAFFE-MEMORIA.jpg"),
            new Oggetto("Caffè Lungo", 0.25, 0, "http://www.fondazionebellaria.it/wp-content/uploads/2014/09/CAFFE-MEMORIA.jpg"),
            new Oggetto("Caffè Macchiato", 0.25, 0, "http://www.fondazionebellaria.it/wp-content/uploads/2014/09/CAFFE-MEMORIA.jpg"),
            new Oggetto("Cioccolata", 0.25, 0, "http://www.costaricanewtravel.com/wp-content/uploads/2015/03/cioccolato-fuso-costa-rica-4jpg.jpg"),
          ]),
          gridList([
            new Oggetto("Acqua naturale", 0.30, 1, "http://www.veloxsrl.it/wp-content/uploads/2015/09/san-benedetto-naturale-1-5-foto.jpg"),
            new Oggetto("Acqua frizzante", 0.30, 1, "http://www.staples.it/content/images/product/34706_1_xnl.jpg"),
            new Oggetto("Pepsi", 0.70, 1, "https://www.grow-shop-italia.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/1/-/1-stash-lattina-pepsi-head-shop-gsi.jpg"),
          ]),
          gridList([
            new Oggetto("Croccantelle Ketchup", 0.40, 2, "http://www.fornodamiani.it/wp-content/uploads/2015/04/ing_CROCCANTELLE_ketchup1.jpg"),
            new Oggetto("Croccantelle Prosciutto", 0.40, 2, "https://images-na.ssl-images-amazon.com/images/I/61%2BLnxjkcZL._SX522_.jpg"),
            new Oggetto("Croccantelle Formaggio", 0.40, 2, "http://www.goccedespressione.it/390-thickbox_default/croccantelle-al-bacon-forno-damiani.jpg"),
            new Oggetto("Succo pera", 0.45, 2, "http://it.etalianfood.com/media/catalog/product/cache/2/image/1200x1200/9df78eab33525d08d6e5fb8d27136e95/y/o/yoga_pera_single_brick_1.jpg"),
            new Oggetto("Succo pesca", 0.45, 2, "https://www.bebshop.it/pimages/Succo-di-Frutta-pesca-Yoga-big-958-908.jpg"),
            new Oggetto("Kinder Bueno", 0.75, 2, "http://images.woolworthsstatic.co.za/Kinder-Bueno-Milk-Chocolate-43g-80052760.jpg?o=jcJbozOihzwzXczk8cm\$b4vTmKEj&V=L5kJ&"),
            new Oggetto("M&M's", 0.75, 2, "https://pics.drugstore.com/prodimg/318313/450.jpg"),
            new Oggetto("Twix", 0.75, 2, "https://www.poundstretcher.co.uk/media/catalog/product/cache/1/image/686x/9df78eab33525d08d6e5fb8d27136e95/2/9/292114-twix_50gm.jpg"),
          ]),
          gridList([
            new Oggetto("Panino Cotoletta", 2.00, 0, "http://www.igusto.it/98-thickbox_default/Panino-Cotoletta.jpg"),
            new Oggetto("Panino Cordon Bleu", 2.00, 0, "https://foodblogs-sympledesignllc.netdna-ssl.com/OSqzTpniBAzFVaLhcAjW5lxte9U=/800x800/smart/www.fifteenspatulas.com%2Fwp-content%2Fuploads%2F2015%2F01%2FChicken_Cordon_Bleu_Panini_Recipe_fifteenspatulas_10.jpg"),
            new Oggetto("Panino salame", 1.30, 0, "http://www.consapienza.it/wordpress/wp-content/uploads/blogger/-4pDy0Kop_ek/UIVRBkEa1eI/AAAAAAAABVE/JdGtfU_T_fU/s1600/panino%2Bal%2Blatte_salame.png"),
            new Oggetto("Pizza piegata", 1.50, 0, "http://www.prodal.eu/wp-content/uploads/2017/06/p_base_quadrata_margherita_0115-704x704.jpg"),
            new Oggetto("Calzone", 2.50, 0, "https://i1.wp.com/www.thekitchenwhisperer.net/wp-content/uploads/2014/04/UltimatePizzaCalzone1.jpg"),
          ]),
          
        ],
      )
    );
  }

  Widget gridList(List<Oggetto> oggetti)
  {
    return new Container
    (
      margin: new EdgeInsets.all(5.0),
      child: new GridView.builder
      (
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount
        (
          crossAxisCount: 2,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0
        ),
        itemBuilder: (_, int pos) => oggettoUI(oggetti[pos]),
        itemCount: oggetti.length,
      )
    );
  }
  
  Widget oggettoUI(Oggetto oggetto)
  {
    return new GridTile
    (
      child: new Container
      (
        child: new InkWell
        (
          onTap: () => null,
          child: new Container
          (
            decoration: new BoxDecoration(image: new DecorationImage(image: new NetworkImage(oggetto.image), fit: BoxFit.cover)),
          ),
        ),
      ),
      footer: new GridTileBar
      (
        backgroundColor: Colors.black87,
        title: new Text(oggetto.nome),
        subtitle: new Text("${oggetto.prezzo.toStringAsFixed(2)} €"),
      ),
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