import 'package:flutter/material.dart';

void main() {
  runApp(ViewScreen());
}

class ViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple ListView Example'),
        ),
        body: Center(
          child: Image(
            image: AssetImage('assets/images/watch1.jpg'),
        ),
      ),
    ),
    );
  }
}
