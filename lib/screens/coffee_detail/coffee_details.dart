import 'package:coffee_shop_app/models/Coffee.dart';
import 'package:flutter/material.dart';

import 'widgets/body.dart';

class CoffeeDetail extends StatefulWidget {
  const CoffeeDetail({super.key, required this.coffee});
  final Coffee coffee;
  @override
  State<CoffeeDetail> createState() => _CoffeeDetailState();
}

class _CoffeeDetailState extends State<CoffeeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Body(
        coffee: widget.coffee,
      ),
    );
  }
}
