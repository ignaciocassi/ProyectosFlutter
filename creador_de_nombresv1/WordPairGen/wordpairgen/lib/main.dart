import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.red[400],
          backgroundColor: Colors.grey[800],
        ),
        debugShowCheckedModeBanner: false,
        home: RandomWords());
  }
}

class RandomWords extends StatefulBuilder {
  @override
  RandomWordsState CreateState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pares de palabras"),
        centerTitle: true,
      ),
      body: Center(child: Text(wordPair.asPascalCase)),
    );
  }
}
