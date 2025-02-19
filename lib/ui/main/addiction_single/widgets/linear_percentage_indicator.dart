import 'package:client/ui/core/themes/sizes.dart';
import 'package:flutter/material.dart';

class LinearPercentageIndicator extends StatelessWidget {
  const LinearPercentageIndicator({
    super.key,
    required this.currentValue,
    required this.goalValue,
    this.borderRadius = 4.0,
    this.height = 8.0,
  });

  final int currentValue;
  final int goalValue;
  final double borderRadius;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          currentValue.toString(),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(width: AppSizes.p16),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: LinearProgressIndicator(
              value: currentValue / goalValue,
              minHeight: height,
            ),
          ),
        ),
        const SizedBox(width: AppSizes.p16),
        Text(
          _getFormattedTime(goalValue),
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }

  String _getFormattedTime(int days) {
    if (days >= 365) {
      final years = (days / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'}';
    }

    if (days >= 30) {
      final months = (days / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'}';
    }

    return '$days ${days == 1 ? 'day' : 'days'}';
  }
}
