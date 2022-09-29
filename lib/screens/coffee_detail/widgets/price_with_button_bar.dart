import 'package:flutter/material.dart';

class PriceAndBuyButtonBar extends StatelessWidget {
  const PriceAndBuyButtonBar({
    Key? key,
    required this.price,
  }) : super(key: key);

  final double price;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Price\n',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.2,
                          color: Colors.grey.shade400),
                    ),
                    TextSpan(
                      text: '\$',
                      style: TextStyle(
                        color: Colors.orange.shade600,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                        fontSize: 28,
                      ),
                    ),
                    TextSpan(
                      text: price.toStringAsFixed(2),
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 30,
                            letterSpacing: 1.2,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: MaterialButton(
              height: 60,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              color: Colors.orange.shade600,
              onPressed: () {},
              textColor: Colors.white,
              child: Text(
                'Buy Now',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          )
        ],
      ),
    );
  }
}
