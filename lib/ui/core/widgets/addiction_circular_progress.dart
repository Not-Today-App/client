import 'package:client/ui/core/widgets/badge.dart';
import 'package:client/utils/addiction_utils.dart';
import 'package:flutter/material.dart';

class AddictionCircularProgress extends StatelessWidget {
  final double progress;
  final bool isLarge;
  final int level;

  const AddictionCircularProgress(
      {super.key,
      required this.progress,
      this.isLarge = false,
      this.level = 1});

  static const largeScale = 1.25;
  static const double offset = 8;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: isLarge ? 96 * largeScale : 96,
          height: isLarge ? 96 * largeScale : 96,
          child: CircularProgressIndicator(
            value: progress,
            backgroundColor:
                Theme.of(context).colorScheme.surfaceContainerHighest,
            valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.onSurface),
            strokeWidth: isLarge ? offset * largeScale : offset,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: isLarge ? offset * largeScale : offset),
          child: Text(
            "${(progress * 100).toInt()}%",
            style: isLarge
                ? Theme.of(context).textTheme.headlineMedium
                : Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Positioned(
          bottom: isLarge ? -offset * largeScale : -offset,
          child: CustomBadge(
            label: 'Level $level',
            color: AddictionUtils.getBadgeColor(context, level),
            isLarge: isLarge,
          ),
        ),
      ],
    );
  }
}
