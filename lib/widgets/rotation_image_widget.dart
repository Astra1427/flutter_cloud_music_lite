import 'package:flutter/material.dart';

class RotationImageWidget extends StatelessWidget {
  const RotationImageWidget({
    Key? key,
    required this.child,
    required this.animationController,
    required this.width,
    required this.height,
    this.curve = Curves.linear,
  }) : super(key: key);

  final AnimationController animationController;
  final Curve curve;
  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: CurvedAnimation(
        parent: animationController,
        curve: curve,
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: ClipOval(
          child: child,
        ),
      ),
    );
  }
}
