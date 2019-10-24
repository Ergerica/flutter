//literally just defining a todo
import 'package:flutter/material.dart';

class Todo {
 Todo({this.title, todo_done = false, icons});
   
    Icon icons = new Icon(Icons.check, color: Colors.red);
    
    String title;
    bool todo_done;
  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        title: json["title"] == null ? null : json["title"],
        icons: json["icons"] == null? null : json["icons"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "icons": icons == null? null: icons,
      };
}