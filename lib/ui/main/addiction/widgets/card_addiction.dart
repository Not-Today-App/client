import 'package:flutter/material.dart';
import 'package:client/domain/models/addiction/addiction.dart';

class CardAddiction extends StatelessWidget {
  const CardAddiction({super.key, required this.addiction});

  final Addiction addiction;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const CircleAvatar(
              child: Icon(Icons.local_florist),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  addiction.name, // Now uses real data
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "8 days (hardcoded)", // Now dynamic
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
