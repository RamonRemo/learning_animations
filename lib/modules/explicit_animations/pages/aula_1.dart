import 'package:flutter/material.dart';

class AnimationControllerExample1 extends StatefulWidget {
  const AnimationControllerExample1({super.key});

  @override
  _AnimationControllerExample1State createState() =>
      _AnimationControllerExample1State();
}

/// animation controller
class _AnimationControllerExample1State
    extends State<AnimationControllerExample1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int counter = 0;
  double _width = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller.addListener(() {
      counter++;
      print('progress: ${_controller.value}');
      print('duration: ${_controller.lastElapsedDuration}');
      print('counter: $counter');
      _setWidth(_controller.value * 300);
    });
  }

  void _setWidth(double val) {
    setState(() {
      _width = val;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const Text('Aula 1'),
        Row(
          children: <Widget>[
            Container(
              width: _width,
              height: 300,
              color: Colors.red,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _controller.repeat(reverse: true);
              },
              child: const Text('Repeat'),
            ),
            ElevatedButton(
              onPressed: () {
                _controller.stop();
              },
              child: const Text('Stop'),
            )
          ],
        ),
      ],
    );
  }
}
