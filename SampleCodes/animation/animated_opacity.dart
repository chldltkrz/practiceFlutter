import 'package:flutter/material.dart';

class AnimatedOpacityExample extends StatefulWidget {
  const AnimatedOpacityExample({super.key});
  @override
  State<AnimatedOpacityExample> createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
        height: 300,
        color: Colors.blue,
        alignment: Alignment.center,
        child: AnimatedOpacity(
          opacity: selected ? 0.3 : 1,
          curve: Curves.easeIn,
          duration: Duration(seconds: 1),
          child: Container(
            width: 200,
            height: 100,
            color: Colors.amber,
            alignment: Alignment.center,
            child: Text('CHILD'),
          ),
        ),
      ),
    );
  }
}
