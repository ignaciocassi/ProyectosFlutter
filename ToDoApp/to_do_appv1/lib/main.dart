import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo Appv1',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ToDolist(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ToDolist extends StatefulWidget {
  @override
  _ToDolistState createState() => _ToDolistState();
}

class _ToDolistState extends State<ToDolist> {
  final List<String> _todoList = <String>[]; //Arreglo de cadenas
  final TextEditingController _controladorCampoTexto =
      TextEditingController(); //Controlador de campo de texto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis tareas"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: _obtenerItems(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mostrarDialogo(context),
        tooltip: 'Añadir item',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  List<Widget> _obtenerItems() {
    final List<Widget> _widgetsTareas = <Widget>[];
    for (String title in _todoList) {
      _widgetsTareas.add(_buildItemTarea(title));
    }
    return _widgetsTareas;
  }

  Future<AlertDialog> _mostrarDialogo(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Agregue una tarea: "),
            content: TextField(
              controller: _controladorCampoTexto,
              decoration: const InputDecoration(hintText: "..."),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Añadir'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _anadirItemTareas(_controladorCampoTexto.text);
                },
              ),
              FlatButton(
                child: const Text('Ndeah'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget _buildItemTarea(String titulo) {
    return ListTile(
        title: Text(titulo),
        tileColor: Colors.orange[300],
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
        enabled: true,
        trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              DoNothingAction();
            }));
  }

  /*Widget _buildItemTarea(String titulo) {
    return ListTile(
        title: Text(titulo),
        tileColor: Colors.orange[300],
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
        enabled: true,
        trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              DoNothingAction();
            }));
  }*/

  void _anadirItemTareas(String titulo) {
    setState(() {
      _todoList.add(titulo);
    });
    _controladorCampoTexto.clear();
  }

  /*return ListView(padding: const EdgeInsets.all(10), children: <Widget>[
      Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.indigo, width: 3),
          borderRadius: BorderRadius.circular(8),
          color: Colors.indigo[400],
        ),
      ),
    ]);*/
}
