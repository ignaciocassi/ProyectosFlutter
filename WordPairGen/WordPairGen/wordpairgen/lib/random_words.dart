import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _listaParesPalabras = <WordPair>[]; //Lista
  final _guardadas = <WordPair>{}; //Conjunto

  //El método build es el encargado de devolver el widget que se mostrará en pantalla.
  //En este caso devuelve un Scaffold, el cual corresponde al parámetro home: del MaterialApp widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Generador de palabras"),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.list),
                onPressed: _pushearGuardados,
              )
            ]),
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
        //El método map devuelve un iterable que contiene el resultado de ejecutar una función sobre cada item del mismo.
        //En este caso, para cada WordPair en _guardadas, devuelve un ListTile con el título de la WordPair actual, en PascalCase.
        //Cada uno de los ListTile que devuelve por cada elemento de _guardadas, se almacena en el Iterable tiles
        final tiles = _guardadas.map(
          (WordPair pair) {
            return ListTile(
              title: Text(
                pair.asPascalCase,
              ),
            );
          },
        );

        //Agrega un divisor por cada Tile en tiles y guarda la nueva lista  de widgets en divided, llamado por .toList()
        final divididas = ListTile.divideTiles(
          context: context,
          tiles: tiles,
        ).toList();

        //En esta nueva ruta se muestra (devuelve) un Scaffold que contiene el título de la appbar y como body: simplemente un
        //widget de ListView que tiene como children a divididas
        return Scaffold(
          appBar: AppBar(
            title: Text('Saved Suggestions'),
          ),
          body: ListView(children: divididas),
        );
      },
    ));
  }

  Widget _generarLista() {
    return ListView.builder(
      padding: const EdgeInsets.all(6),
      itemBuilder: (context, item) {
        //Cuando el item es impar, devuelve un Divider()
        if (item.isOdd) return Divider();

        //La cantidad de WordPairs mostrada, sin incluir los Dividers
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
