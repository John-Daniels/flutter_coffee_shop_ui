import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoffeeDetail extends StatefulWidget {
  const CoffeeDetail({super.key});

  @override
  State<CoffeeDetail> createState() => _CoffeeDetailState();
}

class _CoffeeDetailState extends State<CoffeeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/coffee3.jpg',
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),

                    // appbar
                    const MyFloatingAppBar(),

                    // title + actions

                    Positioned(
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
                                            text: 'Cappuccino\n',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                  fontSize: 28,
                                                  color: Colors.white,
                                                ),
                                          ),
                                          TextSpan(
                                            text: 'With Oat Milk',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange.shade800,
                                          size: 23,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        RichText(
                                            text: TextSpan(children: [
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
                                        ]))
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
                                            icon:
                                                'assets/icons/coffee_icon.png'),
                                        SizedBox(width: 12),
                                        CoffeeDetailIcon(
                                          title: 'Milk',
                                          icon:
                                              'assets/icons/milk_drop_icon.png',
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
                                          fontWeight: FontWeight.w200,
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
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

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

class MyFloatingAppBar extends StatelessWidget {
  const MyFloatingAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 40,
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyAppBarIcon(
              icon: Icon(
                CupertinoIcons.back,
                color: Colors.grey.shade700,
              ),
              onTap: () => Navigator.of(context).pop(),
            ),
            MyAppBarIcon(
              icon: Padding(
                padding: const EdgeInsets.all(2),
                child: Icon(
                  Icons.favorite,
                  color: Colors.grey.shade700,
                  size: 20,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class MyAppBarIcon extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  const MyAppBarIcon({
    Key? key,
    required this.icon,
    required this.onTap,
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
            padding: const EdgeInsets.all(8),
            child: icon,
          ),
        ),
      ),
    );
  }
}

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
    return SizedBox(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          color: color,
          child: child,
        ),
      ),
    );
  }
}
