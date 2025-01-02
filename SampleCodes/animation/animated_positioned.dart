import 'package:flutter/material.dart';

class AnimatedPositionedExample extends StatefulWidget {
  const AnimatedPositionedExample({super.key});
  @override
  State<AnimatedPositionedExample> createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
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
        child: Stack(
          children: [
            AnimatedPositioned(
              left: selected ? 100 : 0,
              top: selected ? 100 : 0,
              curve: Curves.easeIn,
              duration: Duration(seconds: 1),
              child: Container(
                width: 50,
                height: 50,
                color: Colors.amber,
              ),
            )
          ],
        ),
      ),
    );
  }
}
