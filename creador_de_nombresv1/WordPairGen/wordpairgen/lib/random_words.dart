import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _listaParesPalabras = <WordPair>[];
  final _guardadas = <WordPair>{};

  Widget _generarLista() {
    return ListView.builder(
      padding: const EdgeInsets.all(6),
      itemBuilder: (context, item) {
        //Cuando el item es impar, devuelve un Divider()
        if (item.isOdd) return Divider();

        //La cantidad de pares mostrada
        final indice = item ~/ 2;

        //Agrega 10 pares si ya se mostraron todos
        if (indice >= _listaParesPalabras.length) {
          _listaParesPalabras.addAll(generateWordPairs().take(10));
        }

        //Si el item actual no es impar, corresponde a mostrar un par de pal.
        //Por ende devuelve un Widget que obtiene como parámetro el pair actual
        //Y devuelve una ListTile o Row, que contiene un widget de texto, que
        //Tiene como título el pair.asPascalCase()
        return _buildRow(_listaParesPalabras[indice]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Generador de palabras"),
            actions: [
              IconButton(
                icon: Icon(Icons.list),
                onPressed: _pushearGuardados,
              )
            ],
            centerTitle: true),
        body: _generarLista());
  }

  void _pushearGuardados() {
    //El Navigator maneja la pila de rutas.
    //Pushear una ruta a la pila del Navigator,
    //actualiza la pantalla.
    //Popear una ruta de la pila del Navigator,
    //vuelve la pantalla a la ruta anterior.

    //Construye una ruta y la envía  a la pila del Navigator.
    //Esto genera que se muestre en pantalla.
    //El contenido de la nueva página es construido en el método builder
    //de MaterialPageRoute, que es una función anónima.

    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) {
        final tiles = _guardadas.map(
          (WordPair pair) {
            return ListTile(
              title: Text(
                pair.asPascalCase,
              ),
            );
          },
        );
        final divided = ListTile.divideTiles(
          context: context,
          tiles: tiles,
        ).toList();

        return Scaffold(
          appBar: AppBar(
            title: Text('Saved Suggestions'),
          ),
          body: ListView(children: divided),
        );
      },
    ));
  }

  Widget _buildRow(WordPair pair) {
    final yaGuardado = _guardadas.contains(pair);
    return ListTile(
        title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18.0)),
        trailing: Icon(
          yaGuardado ? Icons.favorite : Icons.favorite_border,
          color: yaGuardado ? Colors.red : null,
        ),
        enabled: true,
        onTap: () {
          setState(() {
            if (yaGuardado) {
              _guardadas.remove(pair);
            } else {
              _guardadas.add(pair);
            }
          });
        });
  }
}
