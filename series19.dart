import 'package:flutter/material.dart';

class Animation extends StatefulWidget {
  const Animation({super.key});

  @override
  State<Animation> createState() => _AnimationState();
}

class _AnimationState extends State<Animation> {
  double _width = 50;
  double _height =50;
  Color _color1 = Colors.greenAccent;
  BorderRadiusGeometry _borderradius = BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Example'),
      ),
      body: AnimatedContainer(
       width: _width,
        height: _height,
     duration: Duration(seconds: 1),
      ),
    );
  }
}
