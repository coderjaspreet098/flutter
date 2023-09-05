import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Button Examples'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Elevated Button'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Text Button'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('Outlined Button'),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.star),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
              ),
              DropdownButton<String>(
                items: [
                  DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
                  DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
                  DropdownMenuItem(value: 'Option 3', child: Text('Option 3')),
                ],
                onChanged: (value) {},
                hint: Text('Select an option'),
              ),
              PopupMenuButton<String>(
                itemBuilder: (context) => [
                  PopupMenuItem(value: 'Option 1', child: Text('Option 1')),
                  PopupMenuItem(value: 'Option 2', child: Text('Option 2')),
                  PopupMenuItem(value: 'Option 3', child: Text('Option 3')),
                ],
                onSelected: (value) {},
                child: Text('Open Popup Menu'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
