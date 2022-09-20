//Ação da Animação para aumentar e diminuir objetos e mexer na transparência
import 'package:flutter/material.dart';

class LeftRight extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  final widthTween = Tween<double>(begin: 0, end: 230);

  LeftRight({Key key, this.animation, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Container(
            width: (widthTween.evaluate(animation) < 0.0)? 0: widthTween.evaluate(animation),
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
