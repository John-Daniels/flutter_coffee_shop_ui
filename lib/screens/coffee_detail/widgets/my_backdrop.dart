import 'dart:ui';
import 'package:flutter/material.dart';

class MyBackdrop extends StatelessWidget {
  final Widget child;
  final Color? color;

  const MyBackdrop({
    super.key,
    required this.child,
    this.color = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          color: color,
          child: child,
        ),
      ),
    );
  }
}
