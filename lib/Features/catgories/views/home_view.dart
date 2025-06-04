import 'package:flutter/material.dart';
import 'package:test_app/Features/catgories/views/favourites_view.dart';
import 'package:test_app/Features/catgories/views/product_view.dart';
import 'package:test_app/Features/catgories/views/profile_view.dart';

import '../../../widgets/bottom_nav_widget.dart';
import 'categories_view.dart';

final Key mapKey = UniqueKey();

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Default to Resources tab

  // List of screens shown on tabs
  final List<Widget> _screens = [
    const ProductView(),
    CategoriesView(),
    FavouritesView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[_currentIndex], 
      bottomNavigationBar: BottomNavBarExact(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; 
          });
        },
      ),
    );
  }
}

