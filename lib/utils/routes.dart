import 'package:client/pages/addiction/addictions_page.dart';
import 'package:client/pages/diary/diaries_page.dart';
import 'package:client/pages/menu_page.dart';
import 'package:client/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // Names
  static const menuPage = "/menuPage"; // Route for MenuPage
  static const addictionsPage = "/addictionsPage";
  static const diariesPage = "/diariesPage";
  static const profilePage = "/profilePage";

  // Map Names to Pages
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      menuPage: (context) => const MenuPage(),
      addictionsPage: (context) => const AddictionsPage(),
      diariesPage: (context) => const DiariesPage(),
      profilePage: (context) => const ProfilePage(),
    };
  }
}
