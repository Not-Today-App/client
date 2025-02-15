import 'package:client/ui/core/themes/sizes.dart';
import 'package:client/ui/main/addiction/addictions_view_model.dart';
import 'package:client/ui/main/addiction/widgets/card_addiction.dart';
import 'package:flutter/material.dart';

class AddictionsView extends StatelessWidget {
  const AddictionsView({super.key, required this.viewModel});

  final AddictionsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSizes.p16,
        right: AppSizes.p16,
        top: AppSizes.p24,
      ),
      child: ListenableBuilder(
        listenable: viewModel.load,
        builder: (context, _) {
          if (viewModel.load.running) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.load.error) {
            return Center(
              child: Text(
                'Failed to load addictions',
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          return ListView.separated(
              shrinkWrap: true,
              itemCount: viewModel.addictions.length,
              itemBuilder: (_, index) {
                return CardAddiction(
                  addiction: viewModel.addictions[index],
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: AppSizes.p16,
                  ));
        },
      ),
    );
  }
}
