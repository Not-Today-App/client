import 'package:client/ui/core/themes/sizes.dart';
import 'package:flutter/material.dart';

class DividerTextCenter extends StatelessWidget {
  const DividerTextCenter({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        SizedBox(width: AppSizes.p12),
        Text(text),
        SizedBox(width: AppSizes.p12),
        Expanded(child: Divider()),
      ],
    );
  }
}
