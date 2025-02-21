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
      appBar: AppBar(
        title: const Text('Diaries'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.p16),
            child: IconButton.filledTonal(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const DiaryForm();
                  },
                );
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.p16),
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            // ERROR
            if (viewModel.load.error) {
              return const Center(
                child: Text(
                  'Failed to load diaries',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }

            // SUCCESS
            if (viewModel.diaries.isEmpty && !viewModel.load.running) {
              return const Center(
                child: Text('You have no diaries yet, create one!'),
              );
            }

            return Skeletonizer(
              enabled: viewModel.load.running,
              child: ListView.builder(
                itemCount:
                    viewModel.load.running ? 2 : viewModel.diaries.length,
                itemBuilder: (context, index) {
                  final diary = viewModel.load.running
                      ? skelData
                      : viewModel.diaries[index];
                  return DiaryCard(
                    diary: diary,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
