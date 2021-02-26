import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// (=>) usar flecha para funciones o métodos de una línea
void main() => runApp(MyApp());

// La clase main corre la app mediante el método runApp(MyApp) recordemos que MyApp no es más
// que un StatelessWidget.
// extends StatelessWidget, hace que la app en sí sea un widget, incluyendo al alignment,
// padding y el layout.
class MyApp extends StatelessWidget {
  //El widget MyApp, tiene un método build() que desctibre como mostar el
  // widget en relación a los otros widget de nivel más bajo
  @override
  Widget build(BuildContext context) {
    //(Deprecado)
    //  Crea una constante WordPair con un par de palabras aleatorio devuelto por WordPair.random()
    //  final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter',
      // El widget Scaffold, de la librería Material, provee:
      // 1-una AppBar
      // 2-body que mantiene el árbol de widgets para la pantalla home screen.
      //
      home: Scaffold(
        //appBar: widget de la barra superior.
        appBar: AppBar(
          title: Text('Creador de nombres_v1 by Nacho'),
        ),
        body: Center(
          // body: subárbol de widgets:
          child: RandomWords(), // Crea un widget statefulWidget
        ),
      ),
    );
  }
}

// RandomWords es un extiende (es) un StatefulWidget
class RandomWords extends StatefulWidget {
  @override
  // Crea la clase llamada _RandomWordsState mediante createState()
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    //
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}
