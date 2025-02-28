import 'package:client/domain/models/userAddiction/user_addiction.dart';
import 'package:client/routing/routes.dart';
import 'package:client/ui/core/themes/sizes.dart';
import 'package:client/ui/core/widgets/addiction_circular_progress.dart';
import 'package:client/utils/addiction_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CardUserAddiction extends StatelessWidget {
  const CardUserAddiction({super.key, required this.userAddiction});

  final UserAddiction userAddiction;

  @override
  Widget build(BuildContext context) {
    double progress = 0.75;
    return InkWell(
      borderRadius: BorderRadius.circular(AppSizes.p16),
      onTap: () =>
          context.push(AppRoutes.addictionWithName(userAddiction.addiction)),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSizes.p16,
            left: AppSizes.p16,
            right: AppSizes.p16,
            bottom: 20, //because of the circular progress badge
          ),
          child: Row(
            children: [
              CircleAvatar(
                child: Skeleton.ignore(
                    child: Icon(
                        AddictionUtils.getIconsFor(userAddiction.addiction))),
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
              AddictionCircularProgress(
                progress: progress,
                level: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
