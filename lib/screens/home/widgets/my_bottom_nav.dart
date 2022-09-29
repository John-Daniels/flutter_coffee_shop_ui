import 'package:flutter/material.dart';

class MyBottomBar extends StatelessWidget {
  final int index;
  final Function(int?) onTap;
  const MyBottomBar({super.key, required this.index, required this.onTap});

  Color colorfy(int currentIndex, int index) {
    var color =
        currentIndex == index ? Colors.orange.shade800 : Colors.grey.shade700;
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: onTap,
      selectedItemColor: Colors.orange.shade800,
      unselectedItemColor: Colors.grey[300],
      backgroundColor: Colors.transparent,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/home_icon.png',
            color: colorfy(index, 0),
            height: 28,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/shopping_bag_icon.png',
            color: colorfy(index, 1),
            height: 28,
          ),
          label: 'catalogue',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: colorfy(index, 2),
            size: 30,
          ),
          label: 'Favourites',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/notif_icon.png',
            color: colorfy(index, 3),
            height: 30.5,
          ),
          label: 'notifications',
        ),
      ],
    );
  }
}
