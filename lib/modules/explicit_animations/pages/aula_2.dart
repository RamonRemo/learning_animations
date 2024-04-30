import 'package:flutter/material.dart';

class AnimationControllerExample2 extends StatefulWidget {
  const AnimationControllerExample2({Key? key}) : super(key: key);

  @override
  _AnimationControllerExample2State createState() =>
      _AnimationControllerExample2State();
}

/// animation status listener
/// estudo do animatedStatusListener e como criar animaçoes o utilizando
class _AnimationControllerExample2State
    extends State<AnimationControllerExample2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double _width = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller
      ..addListener(() {
        _setWidth(_controller.value * 300);
      })
      ..addStatusListener(_animationStatus);
  }

  void _animationStatus(AnimationStatus status) {
    print(status);
    if (status == AnimationStatus.completed) {
      _controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      _controller.forward();
    }
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
        const Text('Aula 2'),
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
                _controller.forward();
              },
              child: const Text('Forward'),
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
