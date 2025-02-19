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
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.psychology_outlined),
            label: 'Addictions',
          ),
          NavigationDestination(
            icon: Icon(Icons.book_outlined),
            label: 'Diaries',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
