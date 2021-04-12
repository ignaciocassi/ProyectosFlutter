import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //MaterialApp: title, theme, home
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
  //Llamado por myApp, en body
  final List<String> _todoList = <String>[]; //Arreglo de cadenas
  final TextEditingController _controladorCampoTexto =
      TextEditingController(); //Controlador de campo de texto
  @override
  Widget build(BuildContext context) {
    //Construye el widget
    return Scaffold(
      //Devuelve un Scaffold
      appBar: AppBar(
        title: const Text("Mis tareas"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: _obtenerItems(),
        //la List<widget> que devuelve _obtenerItems()
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
    //Devuelve una List<widget>
    final List<Widget> _widgetsTareas =
        <Widget>[]; //Crea un List<widget> _widgetsTareas
    for (String title in _todoList) {
      //Para cada String title en _todoList
      _widgetsTareas.add(_buildItemTarea(title)); //Agrega a _widgetsTareas
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
              decoration: const InputDecoration(hintText: ""),
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
                child: const Text('Cancelar'),
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
        focusColor: Colors.orangeAccent,
        enabled: true,
        selected: false,
        trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _borrarItemTareas(titulo);
            }));
  }

  void _anadirItemTareas(String titulo) {
    setState(() {
      _todoList.add(titulo);
    });
    _controladorCampoTexto.clear();
  }

  void _borrarItemTareas(String titulo) {
    setState(() {
      _todoList.remove(titulo);
    });
  }
}
