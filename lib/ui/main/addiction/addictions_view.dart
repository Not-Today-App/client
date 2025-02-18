import 'package:client/ui/core/themes/sizes.dart';
import 'package:client/ui/main/addiction/addictions_view_model.dart';
import 'package:client/ui/main/addiction/widgets/addiction_bottom_sheet.dart';
import 'package:client/ui/main/addiction/widgets/card_addiction.dart';
import 'package:flutter/material.dart';

class AddictionsView extends StatelessWidget {
  const AddictionsView({super.key, required this.viewModel});

  final AddictionsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
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
            // RUNNING
            if (viewModel.load.running) {
              return const Center(child: CircularProgressIndicator());
            }
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
            return ListView.separated(
              shrinkWrap: true,
              itemCount: viewModel.userAddictions.length,
              itemBuilder: (_, index) {
                return CardAddiction(
                  addiction: viewModel.userAddictions[index],
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: AppSizes.p16,
              ),
            );
          },
        ),
      ),
    );
  }

  void _openAddictionBottomSheet(BuildContext context) {
    // Extract only the names from the addictions list
    final List<String> addictionNames =
        viewModel.addictions.map((addiction) => addiction.name).toList();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => CreateAddictionSheet(options: addictionNames),
    );
  }
}
