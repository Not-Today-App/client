import 'package:client/utils/routes.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;

  final Map<String, WidgetBuilder> _pages = AppRoutes.getRoutes();

  Widget _getCurrentPage() {
    if (_selectedIndex == 0) {
      return _pages[AppRoutes.addictionsPage]!(context);
    } else if (_selectedIndex == 1) {
      return _pages[AppRoutes.diariesPage]!(context);
    } else {
      return _pages[AppRoutes.profilePage]!(context);
    }
  }

  String _getAppBarTitle() {
    switch (_selectedIndex) {
      case 0:
        return "Addictions";
      case 1:
        return "Diaries";
      case 2:
        return "";
      default:
        return "";
    }
  }

  // Called when a bottom navigation bar item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getAppBarTitle()), // Set the dynamic app bar title
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
              onPressed: () {
                // Add your action here
              },
              icon: const CircleAvatar(
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: _getCurrentPage(), // Display the selected page
      ),
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
