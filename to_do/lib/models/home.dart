import 'package:flutter/material.dart';
import 'package:to_do/models/todo_list.dart';
import 'todo.dart';
//import 'displaydialog.dart';

class HomeD extends StatefulWidget {
  @override
  Home createState() => Home();
}

class Home extends State<HomeD> {
  final _textFieldController = TextEditingController();
  final GlobalKey<TodoList> _key = GlobalKey();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _textFieldController.dispose();
    super.dispose();
  }

  _displayDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Insert Your to do'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "ie. Wash dishes"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('ADD'),
                onPressed: () {
                  //var todo = new Todo(title: _textFieldController.value.text);
                  //  todol.setTodo(todo);
                  //todol.setState(() {});
                  _key.currentState
                      .setTodo(Todo(title: _textFieldController.text));
                  setState(() {});
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.pink[100],
        centerTitle: true,
        title: new Text('Todo List'),
      ),
      body: TodoListS(key: _key),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _displayDialog(context),
          backgroundColor: Colors.blue[300]),
    );
  }
}
