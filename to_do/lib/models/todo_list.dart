import 'package:flutter/material.dart';
import 'todo.dart';

class TodoListS extends StatefulWidget {
  TodoListS({Key key}) : super(key: key);
  @override
  TodoList createState() => TodoList();
}

class TodoList extends State<TodoListS> {
  List<Todo> todos = [Todo(title: 'Checktheicon'), Todo(title: 'Wash clothes')];

  void setTodo(Todo todo) {
    todos.add(todo);
  }
  @override
  Widget build(BuildContext context) {
    return myListView(context, todos);
  }


Widget myListView(BuildContext context, List<Todo> todos) {
  // backing data
    Icon be = new Icon(Icons.check, color: Colors.green);
    return ListView.builder(
    itemCount: todos.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(todos[index].title),
        leading: Icon(todos[index].icons.icon),
        onTap: (){todos[index].icons = be; setState(() {
          
        });},
        onLongPress: (){return showDialog( 
          context: context,
        builder: (context){
          return AlertDialog( title: Text('Are you sure you have done  ${todos[index].title}?'),actions: <Widget>[
              new FlatButton(
                child: new Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('YES'),
                onPressed: () {
                  //var todo = new Todo(title: _textFieldController.value.text);
                  //  todol.setTodo(todo);
                  //todol.setState(() {});
                  todos.remove(todos[index]);
                  setState(() {});
                  Navigator.of(context).pop();
                },
              )
            ],);
        }
        );},
      );
    },
  );
}
}