import 'package:flutter/material.dart';

class MyAppBarIcon extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  final double padding;
  const MyAppBarIcon({
    Key? key,
    required this.icon,
    required this.onTap,
    this.padding = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black38,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            color: Colors.grey.shade900,
            padding: EdgeInsets.all(padding),
            child: icon,
          ),
        ),
      ),
    );
  }
}
