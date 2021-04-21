import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _listaParesPalabras = <WordPair>[];
  Widget _generarLista() {
    return ListView.builder(
      //Contiene las ListTiles
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, item) {
        //Si el item actual es impar, devuelve un divisor
        if (item.isOdd) return Divider();

        //La cantidad de pares mostrada menos los divisores
        final indice = item ~/ 2;

        //Si el indice (pares mostrados) supera o iguala a la cantidad de
        //Pares en el arreglo _listaParesPalabras, agrega 10 al arreglo
        if (indice >= _listaParesPalabras.length) {
          _listaParesPalabras.addAll(generateWordPairs().take(10));
        }

        //Si el item actual no es impar, corresponde a mostrar un par de pal.
        //Por ende devuelve un Widget que obtiene como parámetro el pair actual
        //Y devuelve una ListTile o Row, que contiene un widget de texto, que
        //Tiene como título el pair.asPascalCase()
        return _buildRow(_listaParesPalabras[indice]);
        //min 40:39 https://www.youtube.com/watch?v=1gDhl4leEzA&ab_channel=TraversyMedia
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Generador de palabras"), centerTitle: true),
        body: _generarLista());
  }
}

Widget _buildRow(WordPair pair) {
  return ListTile(
    title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18.0)),
  );
}
