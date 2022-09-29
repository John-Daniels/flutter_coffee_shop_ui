import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/my_appbar_icon.dart';
import 'price_with_button_bar.dart';
import 'title_with_actions.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
      child: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.58,
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

                      // title + actions

                      const TitleAndActions()
                    ],
                  ),
                ),
              ),

              // more descriptions
              const SizedBox(height: 20),
              Text(
                'Description',
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 12),
              const Text(
                'A cappuccino is a coffee-based drink made primarily from espresso and milk',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  height: 1.5,
                  letterSpacing: 1.7,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Size',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: CoffeeSizeCheckBox(
                      size: 'S',
                      selected: true,
                      onChanged: (selected) {},
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: CoffeeSizeCheckBox(
                      size: 'M',
                      onChanged: (selected) {},
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: CoffeeSizeCheckBox(
                      size: 'L',
                      selected: false,
                      onChanged: (selected) {},
                    ),
                  )
                ],
              )
            ],
          ),

          // appbar
          const MyFloatingAppBar(),

          // bottom
          const PriceAndBuyButtonBar()
        ],
      ),
    );
  }
}

class CoffeeSizeCheckBox extends StatefulWidget {
  const CoffeeSizeCheckBox({
    Key? key,
    required this.size,
    this.selected,
    this.onChanged,
  }) : super(key: key);

  final String size;
  final bool? selected;
  final Function(bool selected)? onChanged;

  @override
  State<CoffeeSizeCheckBox> createState() => _CoffeeSizeCheckBoxState();
}

class _CoffeeSizeCheckBoxState extends State<CoffeeSizeCheckBox> {
  var selected = false;

  @override
  void initState() {
    // TODO: implement initState
    selected = widget.selected ?? false;
    setState(() {});
  }

  change() {
    setState(() {
      selected = !selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        change();
        widget.onChanged!(selected);
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: !selected ? Colors.grey.shade900.withOpacity(0.8) : null,

          //enabled
          border: selected
              ? Border.all(color: Colors.orange.shade500, width: 1.2)
              : null,
        ),
        child: Text(
          widget.size,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 19,
            color: selected ? Colors.orange.shade800 : Colors.white,
          ),
        ),
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
