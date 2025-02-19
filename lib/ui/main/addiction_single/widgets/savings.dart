import 'package:flutter/material.dart';
import 'package:client/ui/core/themes/sizes.dart';
import 'package:client/domain/models/userAddiction/user_addiction.dart';

class Savings extends StatelessWidget {
  final UserAddiction addiction;

  const Savings({
    super.key,
    required this.addiction,
  });

  String _formatValue(num value) {
    final bool isTimeAddiction = addiction.timeSpentPerDay != null;
    if (isTimeAddiction) {
      return '${value.round()}h';
    } else {
      return '€${value.toStringAsFixed(0)}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isTimeAddiction = addiction.timeSpentPerDay != null;
    final num valuePerDay = isTimeAddiction
        ? (addiction.timeSpentPerDay ?? 0)
        : (addiction.costPerDay ?? 0);

    final weeklyValue = valuePerDay * 7;
    final monthlyValue = valuePerDay * 30;
    final yearlyValue = valuePerDay * 365;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.p16),
        child: IntrinsicHeight(
          child: Row(
            children: [
              _buildStatColumn(context, 'Weekly', _formatValue(weeklyValue)),
              const VerticalDivider(),
              _buildStatColumn(context, 'Monthly', _formatValue(monthlyValue)),
              const VerticalDivider(),
              _buildStatColumn(context, 'Yearly', _formatValue(yearlyValue)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatColumn(BuildContext context, String label, String value) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: AppSizes.p16),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
