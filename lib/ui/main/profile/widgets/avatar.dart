import 'package:flutter/material.dart';
import 'package:client/ui/core/themes/sizes.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    this.imageUrl,
    this.onEdit,
    this.radius = 60,
  });

  final String? imageUrl;
  final VoidCallback? onEdit;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
          foregroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
          child: const Icon(Icons.person),
        ),
        if (onEdit != null)
          Positioned(
            right: -8,
            top: -8,
            child: IconButton.filledTonal(
              onPressed: onEdit,
              padding: const EdgeInsets.all(AppSizes.p8),
              icon: const Icon(Icons.edit, size: AppSizes.p16),
            ),
          ),
      ],
    );
  }
}
