import 'package:flutter/material.dart';
import 'package:learning_animations/modules/explicit_animations/pages/aula_1.dart';
import 'package:learning_animations/modules/explicit_animations/pages/aula_2.dart';
import 'package:learning_animations/modules/explicit_animations/pages/aula_3.dart';
import 'package:learning_animations/modules/explicit_animations/pages/aula_4.dart';

class ExplicitAnimationsPage extends StatelessWidget {
  const ExplicitAnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('explicit animations'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: PageView(
          children: const [
            AnimationControllerExample4(),
            AnimationControllerExample1(),
            AnimationControllerExample2(),
            AnimationControllerExample3(),
          ],
        ),
      ),
    );
  }
}
