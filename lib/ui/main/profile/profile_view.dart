import 'package:client/ui/main/profile/profile_view_model.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.viewModel});

  final ProfileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text('This is the Profile Page'),
        ElevatedButton(
            onPressed: () => viewModel.logout.execute(), child: Text("Logout"))
      ],
    ));
  }
}
