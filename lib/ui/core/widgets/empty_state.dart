import 'package:flutter/material.dart';
import 'package:client/ui/core/themes/sizes.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  final String imagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath),
          const SizedBox(height: AppSizes.p48),
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSizes.p8),
          Text(description, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
