import 'package:flutter/material.dart';

class CoffeeDetailIcon extends StatelessWidget {
  final String icon;
  final String title;
  const CoffeeDetailIcon({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Image.asset(
            icon,
            color: Colors.orange.shade700,
            height: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
