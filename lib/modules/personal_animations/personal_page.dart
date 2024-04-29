import 'package:flutter/material.dart';
import 'package:learning_animations/modules/personal_animations/bounce_curved.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Personal animations'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: PageView(
          children: [
            BounceCurved(),
          ],
        ),
      ),
    );
  }
}
