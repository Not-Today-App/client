import 'package:client/ui/core/themes/sizes.dart';
import 'package:client/ui/core/widgets/diary_form.dart';
import 'package:client/ui/main/diary/diaries_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DiaryView extends StatelessWidget {
  const DiaryView({
    super.key,
    required this.viewModel,
  });

  final DiariesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            return Text(viewModel.currentDiary?.title ?? '');
          },
        ),
        actions: [
          PopupMenuButton<String>(
            offset: const Offset(
              0,
              AppSizes.p48,
            ),
            onSelected: (value) {
              value == 'edit' ? _editDiary(context) : _deleteDiary(context);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'edit',
                child: ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Edit',
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              ),
              PopupMenuItem(
                value: 'delete',
                child: ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Delete',
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          if (viewModel.loadDiary.running) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.loadDiary.error || viewModel.currentDiary == null) {
            return const Center(child: Text('Failed to load diary'));
          }

          return Padding(
            padding: const EdgeInsets.only(
              left: AppSizes.p16,
              right: AppSizes.p16,
              top: AppSizes.p32,
            ),
            child: Column(
              children: [
                Text(
                  viewModel.currentDiary?.content ?? 'Write your diary here...',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _editDiary(BuildContext context) {
    final diary = viewModel.currentDiary;
    if (diary == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Diary not found')),
      );
      return;
    }

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DiaryForm(
            viewModel: viewModel,
            diary: diary, // for auto-fill
          ),
        );
      },
    );
  }

  void _deleteDiary(BuildContext context) async {
    final diaryId = viewModel.currentDiary?.id;
    if (diaryId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Diary ID is missing')),
      );
      return;
    }

    // Show a confirmation dialog before deleting
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Diary'),
          content: const Text('Are you sure you want to delete this diary?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirmed != true) return;

    await viewModel.deleteDiary.execute(diaryId);

    if (context.mounted) {
      GoRouter.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Diary deleted successfully')),
      );
    }
  }
}
