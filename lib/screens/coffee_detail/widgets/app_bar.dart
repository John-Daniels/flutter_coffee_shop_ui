import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/my_appbar_icon.dart';

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
          vertical: 45,
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
