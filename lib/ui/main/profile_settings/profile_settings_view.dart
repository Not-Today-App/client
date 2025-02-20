import 'package:client/ui/core/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:client/domain/models/user/user.dart';
import 'package:provider/provider.dart';

class ProfileSettingsView extends StatelessWidget {
  const ProfileSettingsView({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // User Name and Edit Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                user.username,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),

          // User Email
          Text(
            user.email,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 32),

          // Theme Selection
          Text(
            'Theme',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          Column(
            children: [
              RadioListTile<ThemeMode>(
                title: const Text('Light'),
                value: ThemeMode.light,
                groupValue: themeController.themeMode,
                onChanged: (value) {
                  if (value != null) themeController.toggleTheme(value);
                },
              ),
              RadioListTile<ThemeMode>(
                title: const Text('Dark'),
                value: ThemeMode.dark,
                groupValue: themeController.themeMode,
                onChanged: (value) {
                  if (value != null) themeController.toggleTheme(value);
                },
              ),
              RadioListTile<ThemeMode>(
                title: const Text('System Default'),
                value: ThemeMode.system,
                groupValue: themeController.themeMode,
                onChanged: (value) {
                  if (value != null) themeController.toggleTheme(value);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
