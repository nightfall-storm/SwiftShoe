import 'package:flutter/material.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.home), label: 'WishList'),
          NavigationDestination(icon: Icon(Icons.home), label: 'Cart'),
          NavigationDestination(icon: Icon(Icons.home), label: 'Category'),
          NavigationDestination(icon: Icon(Icons.home), label: 'Profile'),
        ],
      ),
    );
  }
}
