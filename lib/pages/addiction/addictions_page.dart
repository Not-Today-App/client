import 'package:client/widgets/card_addiction.dart';
import 'package:flutter/material.dart';

class AddictionsPage extends StatelessWidget {
  const AddictionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        CardAddiction(),
      ],
    );
  }
}
