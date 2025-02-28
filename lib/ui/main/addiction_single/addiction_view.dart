import 'package:client/ui/core/themes/sizes.dart';
import 'package:client/ui/core/widgets/addiction_circular_progress.dart';
import 'package:client/ui/main/addiction_single/addiction_view_model.dart';
import 'package:client/ui/main/addiction_single/widgets/info_list_card.dart';
import 'package:client/ui/main/addiction_single/widgets/linear_percentage_indicator.dart';
import 'package:client/ui/main/addiction_single/widgets/saved_card.dart';
import 'package:client/ui/main/addiction_single/widgets/savings.dart';
import 'package:flutter/material.dart';
import 'package:client/ui/main/addiction_single/widgets/carousel.dart';

class AddictionView extends StatelessWidget {
  const AddictionView({
    super.key,
    required this.viewModel,
  });

  final AddictionViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.addictionName!),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          if (viewModel.loadAddiction.running) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.loadAddiction.error ||
              viewModel.userAddiction == null) {
            return const Center(
                child: Text('Failed to load addiction details'));
          }

          final userAddiction = viewModel.userAddiction!;
          final addiction = viewModel.addiction!;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.p16,
                vertical: AppSizes.p32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AddictionCircularProgress(
                    progress: 0.75,
                    isLarge: true,
                    level: 3,
                  ),
                  const SizedBox(height: AppSizes.p48),
                  LinearPercentageIndicator(currentValue: 8, goalValue: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppSizes.p32),
                      SavedCardAddiction(addiction: userAddiction),
                      const SizedBox(height: AppSizes.p32),
                      Text("Motivation", style: titleStyle),
                      const SizedBox(height: AppSizes.p16),
                      ImageCarousel(
                        imageUrls: List.generate(
                          5,
                          (index) =>
                              'https://picsum.photos/seed/${index + 1}/400/400',
                        ),
                      ),
                      const SizedBox(height: AppSizes.p24),
                      Text("Common Symptoms", style: titleStyle),
                      const SizedBox(height: AppSizes.p16),
                      InfoListCard(info: addiction.symptoms ?? []),
                      const SizedBox(height: AppSizes.p24),
                      Text("Common Triggers", style: titleStyle),
                      const SizedBox(height: AppSizes.p16),
                      InfoListCard(info: addiction.triggers ?? []),
                      const SizedBox(height: AppSizes.p24),
                      Text("Treatment Options", style: titleStyle),
                      const SizedBox(height: AppSizes.p16),
                      InfoListCard(info: addiction.treatmentOptions ?? []),
                      const SizedBox(height: AppSizes.p16),
                      Text("Savings Calculator", style: titleStyle),
                      const SizedBox(height: AppSizes.p16),
                      Savings(addiction: userAddiction),
                      const SizedBox(height: AppSizes.p32),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {},
                          child: Text("Reset Timer"),
                        ),
                      ),
                      const SizedBox(height: AppSizes.p32),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
