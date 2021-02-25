import 'package:flutter/material.dart';

// (=>) usar flecha para funciones o métodos de una línea
void main() => runApp(MyApp());

// extends StatelessWidget, hace que la app en sí sea un widget, incluyendo al alignment,
// Padding y el layout.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Creador de nombres_v1 by Nacho'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
