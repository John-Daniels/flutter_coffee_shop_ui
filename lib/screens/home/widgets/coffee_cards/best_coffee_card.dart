import 'dart:ui';

import 'package:flutter/material.dart';

class BestCoffeeCard extends StatelessWidget {
  final String title;
  final String addon;
  final String imageUrl;
  final double price;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;
  const BestCoffeeCard({
    Key? key,
    required this.title,
    required this.addon,
    required this.price,
    this.onTap,
    this.onAddToCart,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: 150,
        child: InkWell(
          onTap: onTap!,
          borderRadius: BorderRadius.circular(20),
          child: GlassBox(
            borderRadius: 20,
            padding: 1,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      children: [
                        //image
                        SizedBox(
                          width: double.infinity,
                          child: Hero(
                            tag: '$title $imageUrl $price',
                            child: Image.asset(
                              imageUrl,
                              fit: BoxFit.cover,
                              scale: 1.5,
                              height: 128,
                            ),
                          ),
                        ),

                        //rating
                        Positioned(
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.only(
                              right: 13,
                              left: 8,
                              bottom: 5,
                              top: 2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                              ),
                              color: Colors.black54.withOpacity(0.4),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Colors.orange.shade800,
                                ),
                                const SizedBox(
                                  width: 0.4,
                                ),
                                const Text(
                                  '4.5',
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  //title and actions
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$title\n',
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        TextSpan(
                          text: addon,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 12,
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5,
                                  ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                          children: [
                            TextSpan(
                              text: '\$',
                              style: TextStyle(
                                  color: Colors.orange.shade600,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.5),
                            ),
                            TextSpan(text: price.toStringAsFixed(2)),
                          ],
                        ),
                      ),

                      // small button
                      InkWell(
                        onTap: onAddToCart!,
                        borderRadius: BorderRadius.circular(7),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(right: 0.2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.orange.shade600,
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GlassBox extends StatelessWidget {
  final Widget child;
  final double? borderRadius;
  final double? padding;
  const GlassBox(
      {super.key,
      required this.child,
      this.borderRadius = 0,
      this.padding = 0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius!),
      child: Container(
        padding: EdgeInsets.all(padding!),
        decoration: BoxDecoration(
            color: Colors.grey.shade900.withOpacity(0.6),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white70.withOpacity(0.2),
                  Colors.grey.shade800.withOpacity(0.4),
                  Colors.grey.shade800.withOpacity(0.5),
                  Colors.grey.shade800.withOpacity(0.5),
                ])),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 2,
            sigmaY: 2,
          ),
          child: child,
        ),
      ),
    );
  }
}
