class Oggetto
{
  /* Parametri obbligatori */
  String nome;
  double prezzo;
  int macchinetta;
  String image;

  /* Parametri opzionali */
  int lvlZucchero;
  int kcal;
  int peso;

  Oggetto(this.nome, this.prezzo, this.macchinetta, this.image, {this.lvlZucchero, this.kcal, this.peso});
}