import 'package:flutter/material.dart';
import './random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //An application that uses material design.
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.red[400],
          backgroundColor: Colors.grey[800],
        ),
        debugShowCheckedModeBanner: false,
        //This is the route that is displayed first when the application is started normally
        home: RandomWords()
        //Stful porque cambia su estado durante ejecución
        );
  }
}
