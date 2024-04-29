import 'package:flutter/material.dart';

class AnimationControllerExample3 extends StatefulWidget {
  const AnimationControllerExample3({super.key});

  @override
  _AnimationControllerExample3State createState() =>
      _AnimationControllerExample3State();
}

class _AnimationControllerExample3State
    extends State<AnimationControllerExample3>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // final Tween<double> _widthTween = Tween<double>(begin: 0, end: 300);
  final Animatable<double> _curvedTween =
      Tween<double>(begin: 0, end: 300).chain(
    CurveTween(curve: Curves.bounceOut),
  );
  final ColorTween _colorTween =
      ColorTween(begin: Colors.red, end: Colors.green);

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller.addListener(_updateState);
  }

  void _updateState() {
    // This is the wrong way to update, but we will fix this later.
    setState(() {});
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
        const Text('Aula 3'),
        Row(
          children: <Widget>[
            Container(
              width: _curvedTween.evaluate(
                  _controller), // Replace with a tween that uses a Curve.
              height: 300,
              color: _colorTween.evaluate(_controller),
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
