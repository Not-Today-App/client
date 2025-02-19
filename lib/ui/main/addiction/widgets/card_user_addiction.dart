import 'package:client/domain/models/userAddiction/user_addiction.dart';
import 'package:client/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardUserAddiction extends StatelessWidget {
  const CardUserAddiction({super.key, required this.userAddiction});

  final UserAddiction userAddiction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.push(AppRoutes.addictionWithName(userAddiction.addiction)),
      child: Card(
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
                    userAddiction.addiction, // Now uses real data
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
      ),
    );
  }
}
