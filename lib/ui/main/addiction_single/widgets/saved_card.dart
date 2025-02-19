import 'package:client/domain/models/userAddiction/user_addiction.dart';

import 'package:flutter/material.dart';

class SavedCardAddiction extends StatelessWidget {
  const SavedCardAddiction({super.key, required this.addiction});

  final UserAddiction addiction;

  @override
  Widget build(BuildContext context) {
    final bool isTimeAddiction = addiction.timeSpentPerDay != null;
    final IconData headerIcon = isTimeAddiction ? Icons.schedule : Icons.euro;

    // Calculate the saved amount (time or money)
    final double savedAmount = isTimeAddiction
        ? (addiction.timeSpentPerDay ?? 0) * 8
        : (addiction.costPerDay ?? 0) * 8;

    // Format the saved amount with appropriate unit
    final String formattedAmount = isTimeAddiction
        ? '${savedAmount.toStringAsFixed(0)}h'
        : '${savedAmount.toStringAsFixed(0)}€';

    return InkWell(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                child: Icon(headerIcon),
              ),
              const SizedBox(width: 16),
              Text(
                isTimeAddiction ? 'Hours Saved' : 'Money Saved',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              Text(
                formattedAmount,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
