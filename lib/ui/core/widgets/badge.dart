import 'package:client/ui/core/themes/sizes.dart';
import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  final String label;
  final bool isLarge;
  final Color? color;

  const CustomBadge(
      {super.key, required this.label, this.isLarge = false, this.color});

  static const largeScale = 1.25;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: isLarge ? 64 * largeScale : 64,
      ),
      padding: EdgeInsets.symmetric(
        vertical: isLarge ? AppSizes.p8 * largeScale : AppSizes.p8,
        horizontal: isLarge ? AppSizes.p12 * largeScale : AppSizes.p12,
      ),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          label,
          style: isLarge
              ? Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontWeight: FontWeight.bold)
              : Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
