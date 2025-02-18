import 'package:client/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key, required this.child});

  final Widget child;

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  int _selectedIndex = 0;

  final List<String> _routes = [
    AppRoutes.addictionsView,
    AppRoutes.diariesView,
    AppRoutes.profileView,
  ];

  // Called when a bottom navigation bar item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    context.go(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety), // Icon for Addictions
            label: 'Addictions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book), // Icon for Diaries
            label: 'Diaries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Icon for Profile
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
