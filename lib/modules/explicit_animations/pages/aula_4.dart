import 'package:flutter/material.dart';

/// usou uma animation propriamente dita ao inves de usar abstraçoes da animation
class AnimationControllerExample4 extends StatefulWidget {
  const AnimationControllerExample4({Key? key}) : super(key: key);

  @override
  _AnimationControllerExample4State createState() =>
      _AnimationControllerExample4State();
}

class _AnimationControllerExample4State
    extends State<AnimationControllerExample4>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final Tween<double> _widthTween = Tween<double>(begin: 0, end: 300);

  late CurvedAnimation _curvedAnimation;

  final ColorTween _colorTween =
      ColorTween(begin: Colors.grey[50], end: Colors.black);

  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // declarado controller, para controlar a mudanca de 0 a 1
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    // declarado listener para redesenhar a tela
    _controller.addListener(() {
      _updateState();
      print(_widthTween.evaluate(_curvedAnimation));
    });

    // declarado animation, para adicoinar uma curve utilizando o controlador de valor do controller
    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
      reverseCurve: Curves.easeOut,
    );

    _colorAnimation = _colorTween.animate(_controller);
  }

  void _updateState() {
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
        Text('Aula 4'),
        Row(
          children: <Widget>[
            Container(
              // pegou uma tween que vai de 0 a 300 e enganchou nela o curved animation, q tem uma curve, e utiliza o controller para rodar o valor
              width: _widthTween.evaluate(_curvedAnimation),
              height: 300,
              color: _colorAnimation.value,
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
