import 'package:flutter/material.dart';

import 'widgets/body.dart';

class CoffeeDetail extends StatefulWidget {
  const CoffeeDetail({super.key});

  @override
  State<CoffeeDetail> createState() => _CoffeeDetailState();
}

class _CoffeeDetailState extends State<CoffeeDetail> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Body(),
    );
  }
}
