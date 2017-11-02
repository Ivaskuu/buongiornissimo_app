import 'oggetto.dart';

class ListaOggetti
{
  static List<Oggetto> oggetti = 
  [
    /* Macchinetta 0 (Caffè) */
      new Oggetto("Caffè Espresso", 0.25, 0, "caffe.jpg", peso: 30),
      new Oggetto("Caffè Lungo", 0.25, 0, "caffe.jpg", peso: 40),
      new Oggetto("Caffè Macchiato", 0.25, 0, "caffe.jpg"),
      new Oggetto("Cioccolata", 0.25, 0, "cioccolata.jpg", peso: 100),

    /* Macchinetta 1 (Acqua) */
      new Oggetto("Acqua naturale", 0.30, 1, "acqua_naturale.jpg", peso: 500),
      new Oggetto("Acqua frizzante", 0.30, 1, "acqua_frizzante.jpg", peso: 500),
      new Oggetto("Pepsi", 0.70, 1, "pepsi.jpg", peso: 330),
      
    /* Macchinetta 2 (Snacks) */
      new Oggetto("Croccantelle Ketchup", 0.40, 2, "croc_ketchup.jpg", kcal: 157, peso: 40),
      new Oggetto("Croccantelle Prosciutto", 0.40, 2, "croc_prosc.jpg", kcal: 169, peso: 40),
      new Oggetto("Croccantelle Formaggio", 0.40, 2, "croc_form.jpg", kcal: 180, peso: 40),
      new Oggetto("Succo pera", 0.45, 2, "succo_pera.jpg", kcal: 100, peso: 200),
      new Oggetto("Succo pesca", 0.45, 2, "succo_pesca.jpg", kcal: 100, peso: 200),
      new Oggetto("Kinder Bueno", 0.75, 2, "kinder_bueno.jpg", kcal: 244, peso: 43),
      new Oggetto("M&M's", 0.75, 2, "mnms.jpg"),
      new Oggetto("Twix", 0.75, 2, "twix.jpg"),
      
    /* Macchinetta 3 (Panini) */
      new Oggetto("Panino Cotoletta", 2.00, 3, "cotoletta.jpg"),
      new Oggetto("Panino Cordon Bleu", 2.00, 3, "cordon_bleu.jpg"),
      new Oggetto("Panino salame", 1.30, 3, "pan_salame.png", kcal: 269, peso: 100),
      new Oggetto("Pizzetta", 1.50, 3, "pizzetta.jpg"),
      new Oggetto("Calzone", 2.50, 3, "calzone.jpg", kcal: 600, peso: 250),
  ];

  static List<Oggetto> getOggettiDellaMacchinetta(int numMacchinetta)
  {
    List<Oggetto> ogg = new List();
    for (int i = 0; i < oggetti.length; i++)
    {
      if(oggetti[i].macchinetta == numMacchinetta) ogg.add(oggetti[i]);
    }

    return ogg;
  }
}