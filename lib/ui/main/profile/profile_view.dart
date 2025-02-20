import 'package:client/ui/core/themes/sizes.dart';
import 'package:client/ui/main/profile/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:client/ui/main/profile/widgets/pro_badge.dart';
import 'package:client/ui/main/profile/widgets/avatar.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:client/routing/routes.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.viewModel});

  final ProfileViewModel viewModel;

  String _formatDate(DateTime date) {
    return DateFormat.yMMMMd().format(date);
  }

  @override
  Widget build(BuildContext context) {
    int badgeSize = 46;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: badgeSize + AppSizes.p16,
        leading: const ProBadge(visible: true),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.p16),
            child: IconButton.filledTonal(
              onPressed: () => context.go(
                AppRoutes.profileSettings(),
                extra: viewModel.user,
              ),
              icon: const Icon(Icons.settings),
            ),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          if (viewModel.loadUser.running) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  ElevatedButton(
                    onPressed: () => viewModel.logout.execute(),
                    child: const Text("Logout"),
                  ),
                ],
              ),
            );
          }

          if (viewModel.loadUser.error) {
            return const Center(child: Text('Failed to load profile'));
          }

          return Center(
            child: Column(
              children: [
                Avatar(
                  imageUrl: viewModel.user.picture,
                  onEdit: () {},
                ),
                const SizedBox(height: AppSizes.p16),
                Text(
                  viewModel.user.username,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: AppSizes.p12),
                Text(
                  'joined on ${_formatDate(viewModel.user.createdAt)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () => viewModel.logout.execute(),
                  child: Text("Logout"),
                ),
                const SizedBox(height: AppSizes.p32),
              ],
            ),
          );
        },
      ),
    );
  }
}
