import 'package:client/ui/core/themes/sizes.dart';
import 'package:flutter/material.dart';
import 'package:client/domain/models/addiction/addiction.dart';

class AddictionView extends StatelessWidget {
  const AddictionView({super.key, required this.addiction});

  final Addiction addiction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(addiction.name),
        actions: [
          IconButton(
            onPressed: () {
              // Share action
            },
            icon: Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {
              // More options action
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: AppSizes.p16,
          right: AppSizes.p16,
          top: AppSizes.p24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              addiction.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSizes.p16),
            Text(
              "Details about the addiction will go here.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
