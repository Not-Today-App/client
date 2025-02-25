import 'package:client/domain/models/addiction/addiction.dart';
import 'package:client/domain/models/userAddiction/user_addiction.dart';
import 'package:client/ui/core/themes/sizes.dart';
import 'package:client/ui/core/widgets/empty_state.dart';
import 'package:client/ui/main/addiction/addictions_view_model.dart';
import 'package:client/ui/main/addiction/widgets/addiction_bottom_sheet.dart';
import 'package:client/ui/main/addiction/widgets/card_user_addiction.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AddictionsView extends StatelessWidget {
  const AddictionsView({super.key, required this.viewModel});

  final AddictionsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final UserAddiction skelData = UserAddiction(
      userId: 'defaultUserId',
      id: 'defaultId',
      addiction: 'Fake Addiction',
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addictions'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.p16),
            child: IconButton.filledTonal(
              onPressed: () => _openAddictionBottomSheet(context),
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: AppSizes.p16,
          right: AppSizes.p16,
          top: AppSizes.p24,
        ),
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            // ERROR
            if (viewModel.load.error) {
              return Center(
                child: Text(
                  'Failed to load addictions',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }
            // SUCCESS
            if (viewModel.userAddictions.isEmpty && !viewModel.load.running) {
              return EmptyState(
                imagePath: 'assets/empty_state_illustration.png',
                title: 'No Addictions',
                description: 'Create an addiction to show up here.',
              );
            }
            return Skeletonizer(
              enabled: viewModel.load.running,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: viewModel.load.running
                    ? 2
                    : viewModel.userAddictions.length,
                itemBuilder: (_, index) {
                  return CardUserAddiction(
                    userAddiction: viewModel.load.running
                        ? skelData
                        : viewModel.userAddictions[index],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: AppSizes.p16,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _openAddictionBottomSheet(BuildContext context) {
    final List<String> addictionNames =
        viewModel.addictions.map((addiction) => addiction.name!).toList();

    final List<String> userAddictionNames =
        viewModel.userAddictions.map((ua) => ua.addiction).toList();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => CreateAddictionSheet(
        options: addictionNames,
        disabledOptions: userAddictionNames, // Pass already added addictions
      ),
    );
  }
}
