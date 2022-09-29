import 'package:flutter/material.dart';

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
                autofocus: false,
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
