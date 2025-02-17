import 'package:flutter/material.dart';
import 'package:client/ui/core/themes/sizes.dart';

class CreateAddictionSheet extends StatelessWidget {
  const CreateAddictionSheet({super.key, required this.options});

  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: AppSizes.p24),
          ...options.map((option) => Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.abc, size: 28),
                    title: Text(option, style: TextStyle(fontSize: 16)),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(height: AppSizes.p24),
                ],
              )),
        ],
      ),
    );
  }
}
