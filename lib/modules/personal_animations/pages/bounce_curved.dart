
import 'package:flutter/material.dart';

class BounceCurved extends StatefulWidget {
  const BounceCurved({super.key});

  @override
  State<BounceCurved> createState() => _BounceCurvedState();
}

// aqui aprendi um pouco sobre como adicionar curves a uma animaçao feita com animationController
class _BounceCurvedState extends State<BounceCurved>
    with SingleTickerProviderStateMixin {
      
  late AnimationController controller = AnimationController(
      duration: const Duration(milliseconds: 200), vsync: this);

  late final Animation<double> curve =
      CurvedAnimation(parent: controller, curve: Curves.easeIn);

  late Animation<double> alpha =
      Tween<double>(begin: 1, end: 1.2).animate(curve);

  Tween<double> test = Tween<double>(begin: 1, end: 1.2);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ScaleTransition(
            scale: alpha,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    // test.evaluate(controller);
                    controller.forward().then(
                          (value) => controller.reverse(),
                        );
                  });
                },
                child: Text('ola'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
