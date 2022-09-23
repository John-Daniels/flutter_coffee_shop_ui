import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyAppBar(),
              Text(
                'Find the best\ncoffee for you',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(
                height: 30,
              ),
              const MySearchBar(),
              const SizedBox(
                height: 30,
              ),

              TabBar(
                controller: tabController,
                isScrollable: true,
                padding: const EdgeInsets.only(bottom: 10),
                indicator: DotIndicator(
                  color: Colors.orange.shade600,
                  distanceFromCenter: 23,
                  radius: 3,
                  paintingStyle: PaintingStyle.fill,
                ),
                labelColor: Colors.orange.shade600,
                labelStyle: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.w500),
                unselectedLabelColor: Colors.grey.shade800,
                tabs: const [
                  Tab(text: 'Cappuccinno'),
                  Tab(text: 'Espresso'),
                  Tab(text: 'Latte'),
                  Tab(text: 'Flat'),
                ],
              ),

              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    ...(List.generate(
                      4,
                      (index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 240,
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (_, index) {
                                  return BestCoffeeCard(
                                    title: 'Cappuccino',
                                    addon: 'With Oat Milk',
                                    imageUrl: 'assets/images/coffee1.jpg',
                                    price: 4.20,
                                    onTap: () {},
                                    onAddToCart: () {},
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ))
                  ],
                ),
              )

              // Center(child: Image.asset('assets/images/coffee1.jpg'),),
            ],
          ),
        ),
      ),
    );
  }
}

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
      child: InkWell(
        onTap: onTap!,
        borderRadius: BorderRadius.circular(20),
        child: GlassBox(
          borderRadius: 20,
          padding: 1,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      //image
                      SizedBox(
                        width: 120,
                        height: 128,
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),

                      //rating
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.only(
                            right: 12,
                            left: 8,
                            bottom: 5,
                            top: 2,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                            ),
                            color: Colors.black54.withOpacity(0.4),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 12,
                                color: Colors.orange.shade800,
                              ),
                              const SizedBox(
                                width: 0.4,
                              ),
                              const Text(
                                '4.5',
                                style: TextStyle(fontSize: 10),
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
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                      TextSpan(
                        text: addon,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                              // fontWeight: FontWeight.w300,
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
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
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
                          TextSpan(text: '$price'),
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

class TabTitle extends StatefulWidget {
  final String title;
  final bool current;
  final int index;

  const TabTitle({
    Key? key,
    required this.current,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  State<TabTitle> createState() => _TabTitleState();
}

class _TabTitleState extends State<TabTitle> {
  @override
  Widget build(BuildContext context) {
    print('tab title component');
    print(widget.current);
    print(widget.index);

    return Column(
      children: [
        const Text('Cappuccino'),
        const SizedBox(
          height: 8,
        ),
        if (widget.current)
          Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
          )
      ],
    );
  }
}

class MyTabBarPlaceholder extends StatelessWidget {
  const MyTabBarPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text(
            'my tab',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade900.withOpacity(0.8),
        ),
        height: 45,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/search_icon.png',
              color: Colors.grey.shade800.withOpacity(0.9),
              height: 20,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextField(
                style: TextStyle(color: Colors.grey.shade700),
                decoration: InputDecoration(
                  hintText: 'Find Your Coffee',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Colors.grey.shade800),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(children: const [MyIcon(), Spacer(), MyAvater()]),
    );
  }
}

class MyAvater extends StatelessWidget {
  const MyAvater({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade800,
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(12)),
        child: Image.asset(
          'assets/images/my_avater.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MyIcon extends StatelessWidget {
  const MyIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey.shade900.withOpacity(0.5),
            Colors.grey.shade900,
          ],
        ),
      ),
      child: Icon(
        Icons.dashboard,
        color: Colors.grey.shade700,
      ),
    );
  }
}
