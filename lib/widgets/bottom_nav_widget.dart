import 'package:flutter/material.dart';

class BottomNavBarExact extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBarExact({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  static const List<_NavItem> _items = [
    _NavItem('Product', "assets/product.png"),
    _NavItem('Categories', "assets/category.png"),
    _NavItem('Favourites', "assets/favourites.png"),
    _NavItem('Profile', "assets/person.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: Container(
        height: 90,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_items.length, (index) {
            final isSelected = index == currentIndex;
            final item = _items[index];
            final color =
                isSelected ? const Color(0xFF3B68FF) : const Color(0xFF47474F);

            return GestureDetector(
              onTap: () => onTap(index),
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    item.imageicon,
                    width: 27,
                    height: 27,
                    color: isSelected ? Colors.grey : Colors.white,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: isSelected ? Colors.grey : Colors.white,
                      fontFamily: 'Satoshi',
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItem {
  final String label;
  final String imageicon;
  const _NavItem(this.label, this.imageicon);
}
