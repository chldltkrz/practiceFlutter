import 'package:flutter/material.dart';

class AnimatedAlignExmple extends StatefulWidget {
  const AnimatedAlignExmple({super.key});
  @override
  State<AnimatedAlignExmple> createState() => _AnimatedAlignExmpleState();
}

class _AnimatedAlignExmpleState extends State<AnimatedAlignExmple> {
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
        child: AnimatedAlign(
          curve: Curves.easeIn,
          // alignment 속성이 변경되면 애니메이션 진행
          alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
          // 애니메이션이 진행되는 시간 duration 속성에 반드시 정의
          // Duration : 초, 밀리초, 나노초 등과 같은 시간 단위를 나타내는 클래스
          duration: Duration(seconds: 1),
          child: Container(
            width: 50,
            height: 50,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
