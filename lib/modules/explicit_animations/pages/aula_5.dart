import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedBuilderExample5 extends StatefulWidget {
  const AnimatedBuilderExample5({Key? key}) : super(key: key);

  @override
  _AnimatedBuilderExample5State createState() =>
      _AnimatedBuilderExample5State();
}

//esse exemplo nao precisa ficar chamando setstate, e ao usar a propriedade child do animatedbuilder eh mais eficiente e performatico
class _AnimatedBuilderExample5State extends State<AnimatedBuilderExample5>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: child,
        );
      },
      child: Center(
        child: Container(color: Colors.red, width: 100, height: 100),
      ),
    );
  }
}
