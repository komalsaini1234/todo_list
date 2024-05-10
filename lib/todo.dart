import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class todo extends StatefulWidget {
  const todo({super.key});

  @override
  State<todo> createState() => _todoState();
}

class _todoState extends State<todo> {
  List<String> _todos = [];

  void _addtodo() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String newTodo = "";
          return AlertDialog(
            title: Text("Add a new to do"),
            content: TextField(
              onChanged: (value) {
                newTodo = value;
              },
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (newTodo.isNotEmpty) {
                      _todos.add(newTodo);
                    }
                    Navigator.pop(context);
                  });
                },
                child: Text("add"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To do list"),
        backgroundColor: const Color.fromARGB(255, 224, 155, 236),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: ListTile(
                title: Text(
                  _todos[index],
                  style: TextStyle(fontSize: 23),
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      _todos.removeAt(index);
                    });
                  },
                  icon: Icon(Icons.delete),
                )),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addtodo,
        backgroundColor: const Color.fromARGB(255, 221, 185, 228),
        child: Icon(Icons.add),
      ),
    );
  }
}
