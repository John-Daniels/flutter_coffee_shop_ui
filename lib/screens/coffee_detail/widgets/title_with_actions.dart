import 'package:flutter/material.dart';

import '../../../models/Coffee.dart';
import 'coffee_detail_icon.dart';
import 'my_backdrop.dart';

class TitleAndActions extends StatelessWidget {
  const TitleAndActions({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -8,
      left: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: MyBackdrop(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${coffee.title}\n',
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      fontSize: 28,
                                      color: Colors.white,
                                    ),
                          ),
                          TextSpan(
                            text: coffee.addon,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 20,
                                      color: Colors.grey.shade400,
                                      // fontWeight: FontWeight.w300,
                                      height: 1.5,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange.shade800,
                          size: 27,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '4.5 ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      letterSpacing: 1.5,
                                      fontSize: 23,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                              ),
                              TextSpan(
                                  text: "(6.986)",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey.shade400,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    )
                  ],

                  // actions
                ),

                const Spacer(),
                // actions
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        CoffeeDetailIcon(
                            title: 'Coffee',
                            icon: 'assets/icons/coffee_icon.png'),
                        SizedBox(width: 12),
                        CoffeeDetailIcon(
                          title: 'Milk',
                          icon: 'assets/icons/milk_drop_icon.png',
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Medium Roasted',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
