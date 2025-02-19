import 'package:flutter/material.dart';
import 'package:client/ui/core/themes/sizes.dart';

class InfoListCard extends StatelessWidget {
  final List<String> info;

  const InfoListCard({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.p16),
        child: Column(
          children: info.map((symptom) {
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        symptom,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
                if (symptom != info.last) const SizedBox(height: AppSizes.p16),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
