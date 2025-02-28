import 'package:client/routing/routes.dart';
import 'package:client/ui/core/widgets/badge.dart';
import 'package:client/utils/diary_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:client/ui/core/themes/sizes.dart';
import 'package:client/domain/models/diary/diary.dart';

class DiaryCard extends StatelessWidget {
  final Diary diary;

  const DiaryCard({
    super.key,
    required this.diary,
  });

  String _formatDate(DateTime date) {
    return DateFormat.yMMMMd().format(date);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppSizes.p16),
      onTap: () {
        context.go(AppRoutes.diaryWithId(diary.id!));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                diary.title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: AppSizes.p8),
              Text(
                diary.content,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: AppSizes.p12),
              Row(
                children: [
                  Text(
                    _formatDate(diary.createdAt ?? DateTime.now()),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const Spacer(),
                  CustomBadge(
                    label: diary.mood,
                    color: DiaryUtils.getBadgeColor(
                        context, DiaryUtils.getMoodFromString(diary.mood)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
