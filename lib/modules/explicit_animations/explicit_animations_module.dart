import 'package:flutter/material.dart';
import 'package:learning_animations/modules/explicit_animations/pages/aula_1.dart';
import 'package:learning_animations/modules/explicit_animations/pages/aula_2.dart';
import 'package:learning_animations/modules/explicit_animations/pages/aula_3.dart';
import 'package:learning_animations/modules/explicit_animations/pages/aula_4.dart';
import 'package:learning_animations/modules/explicit_animations/pages/aula_5.dart';
import 'package:learning_animations/modules/explicit_animations/pages/aula_6.dart';

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
            SlideSomething(),
            ScaleSomething(),
            AnimatedBuilderExample5(),
            AnimationControllerExample4(),
            AnimationControllerExample3(),
            AnimationControllerExample2(),
            AnimationControllerExample1(),
          ],
        ),
      ),
    );
  }
}
