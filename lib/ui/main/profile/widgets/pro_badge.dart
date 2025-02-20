import 'package:flutter/material.dart';
import 'package:client/ui/core/themes/sizes.dart';

class ProBadge extends StatelessWidget {
  const ProBadge({
    super.key,
    this.visible = true,
  });

  final bool visible;

  @override
  Widget build(BuildContext context) {
    if (!visible) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(left: AppSizes.p16),
      child: Center(
        child: SizedBox(
          width: 46,
          height: 36,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xFFFFD900),
                  Color(0xFFFFAD00),
                ],
              ).createShader(bounds),
              child: Center(
                child: Text(
                  "PRO",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
