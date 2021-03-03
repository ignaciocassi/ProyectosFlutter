import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// (=>) usar flecha para funciones o métodos de una línea
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creador de nombres',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[]; //Crea una lista _suggestions de WordPairs
  final _biggerFont =
      TextStyle(fontSize: 18.0); //Variable para hacer la fuente más grande
  Widget build(BuildContext context) {
    return Scaffold(
      //Crea un layout material: contiene los widgs appbar, título,
      appBar: AppBar(
        title: Text("Creador de nombres."),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/
          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
