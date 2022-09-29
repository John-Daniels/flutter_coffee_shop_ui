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
          top: 30.0,
          right: 18,
          left: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyAppBar(),
            Text(
              'Find the best\ncoffee for you',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            const MySearchBar(),
            const SizedBox(height: 30),

            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: MyTabs(
                      tabController: tabController,
                    ),
                  )
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
  MyTabs({super.key, required this.tabController});

  List tabs = [
    {'title': 'Cappuccinno'},
    {'title': 'Espresso'},
    {'title': 'Late'},
    {'title': 'Flat'}
  ];

  @override
  Widget build(BuildContext context) {
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
          tabs: [
            // loop through the tabs
            for (var tab in tabs) Tab(text: tab['title']),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: TabBarView(
              controller: tabController,
              children: [
                for (var tab in tabs) CoffeeTab(title: tab['title']),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CoffeeTab extends StatelessWidget {
  const CoffeeTab({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
// fetch an api with that title and get some data related to that

  @override
  Widget build(BuildContext context) {
    List<Coffee> tabData = [
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
        FirstTabSection(data: tabData)
        // more sections here
      ],
    );
  }
}

class FirstTabSection extends StatelessWidget {
  const FirstTabSection({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Coffee> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (_, index) {
          var coffee = data[index];

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
