import 'package:client/domain/models/diary/diary.dart';
import 'package:client/ui/core/themes/sizes.dart';
import 'package:client/ui/main/diary/diaries_view_model.dart';
import 'package:client/ui/main/diary/widgets/diary_card.dart';
import 'package:client/ui/main/diary/widgets/diary_form.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DiariesView extends StatelessWidget {
  const DiariesView({super.key, required this.viewModel});

  final DiariesViewModel viewModel;

  bool _isLastDiaryLessThanADayAgo(List<Diary> diaries) {
    if (diaries.isEmpty) return false;

    final lastDiary = diaries.last;
    final now = DateTime.now().toUtc();
    final difference = now.difference(lastDiary.createdAt!);

    return difference.inHours < 24;
  }

  @override
  Widget build(BuildContext context) {
    final Diary skelData = Diary(
      userId: 'defaultUserId',
      title: 'Fake Title',
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      mood: Mood.HAPPY.toString(),
      createdAt: DateTime.now(),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Diaries'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.p16),
            child: IconButton.filledTonal(
              onPressed: () {
                if (_isLastDiaryLessThanADayAgo(viewModel.diaries)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('You already created a diary today'),
                    ),
                  );
                } else {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: DiaryForm(viewModel: viewModel),
                      );
                    },
                  );
                }
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.p16),
        child: ListenableBuilder(
          listenable:
              Listenable.merge([viewModel.loadDiaries, viewModel.createDiary]),
          builder: (context, _) {
            if (viewModel.loadDiaries.error) {
              return const Center(
                child: Text(
                  'Failed to load diaries',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }

            if (viewModel.diaries.isEmpty && !viewModel.loadDiaries.running) {
              return const Center(
                child: Text('You have no diaries yet, create one!'),
              );
            }

            return Skeletonizer(
              enabled: viewModel.loadDiaries.running,
              child: ListView.builder(
                itemCount: viewModel.loadDiaries.running
                    ? 2
                    : viewModel.diaries.length,
                itemBuilder: (context, index) {
                  final diary = viewModel.loadDiaries.running
                      ? skelData
                      : viewModel.diaries[index];
                  return DiaryCard(diary: diary);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
