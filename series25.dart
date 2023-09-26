import 'package:flutter/material.dart';

class Grocerystore1 extends StatelessWidget {
  const Grocerystore1({Key? key});

  @override
  Widget build(BuildContext context) {
    return Grocerystore2();
  }
}

class Grocerystore2 extends StatefulWidget {
  const Grocerystore2({Key? key});

  @override
  State<Grocerystore2> createState() => _Grocerystore2State();
}

class _Grocerystore2State extends State<Grocerystore2> {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
            child: Container(
              // Customize the bottom sheet content here
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'This is a bottom sheet!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/store.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            'Welcome to Our store!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet(context); // Show the bottom sheet when the button is pressed
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
