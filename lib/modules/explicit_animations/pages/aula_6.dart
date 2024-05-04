import 'package:flutter/material.dart';

class ScaleSomething extends StatefulWidget {
  const ScaleSomething({Key? key}) : super(key: key);

  @override
  _ScaleSomethingState createState() => _ScaleSomethingState();
}

class _ScaleSomethingState extends State<ScaleSomething>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            _controller.forward().then((value) => _controller.reverse());
          },
          child: const Text('Play'),
        ),
        ScaleSomethingWidget(
          translation: _controller,
          child: Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ), // pass in any child widget
        ),
      ],
    );
  }
}

class ScaleSomethingWidget extends AnimatedWidget {
  ScaleSomethingWidget({
    Key? key,
    required Animation<double> translation,
    required this.child,
  }) : super(
          key: key,
          listenable: Tween<double>(
            begin: 1,
            end: 1.2,
          ).animate(
            CurvedAnimation(parent: translation, curve: Curves.ease),
          ),
        );

  final Widget child;

  Animation<double> get _translation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _translation,
      child: child,
    );
  }
}
class SlideSomething extends StatefulWidget {
  const SlideSomething({Key? key}) : super(key: key);

  @override
  _SlideSomethingState createState() => _SlideSomethingState();
}

class _SlideSomethingState extends State<SlideSomething>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            _controller.forward(from: 0);
          },
          child: const Text('Play'),
        ),
        SlideSomethingWidget(
          translation: _controller,
          child: Text('hello'), // pass in any child widget
        ),
      ],
    );
  }
}

class SlideSomethingWidget extends AnimatedWidget {
  SlideSomethingWidget({
    Key? key,
    required Animation<double> translation,
    required this.child,
  }) : super(
          key: key,
          listenable: Tween<Offset>(
            begin: const Offset(0, 0),
            end: const Offset(0, 1),
          ).animate(
            CurvedAnimation(parent: translation, curve: Curves.bounceOut),
          ),
        );

  final Widget child;

  Animation<Offset> get _translation => listenable as Animation<Offset>;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: _translation.value,
      child: child,
    );
  }
}
