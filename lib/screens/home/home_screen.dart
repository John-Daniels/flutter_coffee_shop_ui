import 'dart:ui';

import 'package:coffee_shop_app/models/Coffee.dart';
import 'package:coffee_shop_app/screens/home/widgets/my_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../coffee_detail/coffee_details.dart';
import 'widgets/coffee_cards/best_coffee_card.dart';
import 'widgets/my_appbar.dart';
import 'widgets/seach_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);

    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: MyGlassBoxx(
        child: MyBottomBar(index: 0, onTap: (index) {}),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50.0,
          right: 24,
          left: 24,
        ),
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

            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: MyTabs(
                      tabController: tabController,
                    ),
                  ),
                ],
              ),
            ),
            // Center(child: Image.asset('assets/images/coffee1.jpg'),),
          ],
        ),
      ),
    );
  }
}

class MyTabs extends StatelessWidget {
  final TabController tabController;
  const MyTabs({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    // first tab data;
    List<Coffee> firstTabData = [
      Coffee(
          title: 'Cappuccino',
          addon: 'With Oat Milk',
          imageUrl: 'assets/images/coffee3.jpg',
          price: 4.2),
      Coffee(
          title: 'Cappuccino',
          addon: 'With Chocolate',
          imageUrl: 'assets/images/coffee2.jpg',
          price: 3.14),
      Coffee(
          title: 'Cappuccino',
          addon: 'With Oat Milk',
          imageUrl: 'assets/images/coffee1.jpg',
          price: 4.2),
      Coffee(
          title: 'Cappuccino',
          addon: 'With Oat Milk',
          imageUrl: 'assets/images/coffee1.jpg',
          price: 4.2),
      Coffee(
          title: 'Cappuccino',
          addon: 'With Oat Milk',
          imageUrl: 'assets/images/coffee1.jpg',
          price: 4.2),
    ];
    return Column(
      children: [
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
              .copyWith(fontWeight: FontWeight.w400, fontSize: 18),
          unselectedLabelColor: Colors.grey.shade800,
          tabs: const [
            Tab(text: 'Cappuccinno'),
            Tab(text: 'Espresso'),
            Tab(text: 'Latte'),
            Tab(text: 'Flat'),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: TabBarView(
              controller: tabController,
              children: [
                Column(
                  children: [
                    Section1(firstTabData: firstTabData),
                  ],
                ),
                const Text('espress'),
                const Text('Latte'),
                const Text('Flat'),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Section1 extends StatelessWidget {
  const Section1({
    Key? key,
    required this.firstTabData,
  }) : super(key: key);

  final List<Coffee> firstTabData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: firstTabData.length,
        itemBuilder: (_, index) {
          var coffee = firstTabData[index];

          return BestCoffeeCard(
            title: coffee.title,
            addon: coffee.addon,
            imageUrl: coffee.imageUrl,
            price: coffee.price,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CoffeeDetail(),
                ),
              );
            },
            onAddToCart: () {
              showMyModal(context);
            },
          );
        },
      ),
    );
  }
}

class MyGlassBoxx extends StatelessWidget {
  final Widget child;
  const MyGlassBoxx({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 70,
          padding: const EdgeInsets.all(2),
          // color: Colors.deepPurple,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              // alignment: Alignment.ce,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

void showMyModal(context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) => BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4,
              sigmaY: 4,
            ),
            child: Container(
              color: Colors.black.withOpacity(0.9),
              height: 470,
              child: const Center(
                child: Text('More Details here'),
              ),
            ),
          ));
}
