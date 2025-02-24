import 'package:client/data/repositories/addiction/addiction_repository.dart';
import 'package:client/data/repositories/auth/auth_repository.dart';
import 'package:client/domain/models/user/user.dart';
import 'package:client/ui/auth/login/login_view.dart';
import 'package:client/ui/auth/login/login_view_model.dart';
import 'package:client/ui/main/addiction_single/addiction_view.dart';
import 'package:client/ui/main/addiction_single/addiction_view_model.dart';
import 'package:client/ui/main/diary/diaries_view_model.dart';
import 'package:client/ui/main/profile/profile_view_model.dart';
import 'package:client/ui/main/profile_settings/profile_settings_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:client/routing/routes.dart';
import 'package:client/ui/main/addiction/addictions_view.dart';
import 'package:client/ui/main/addiction/addictions_view_model.dart';
import 'package:client/ui/main/diary/diaries_view.dart';
import 'package:client/ui/main/menu_view.dart';
import 'package:client/ui/main/profile/profile_view.dart';
import 'package:provider/provider.dart';

GoRouter router(AuthRepository authRepository) => GoRouter(
      initialLocation: AppRoutes.loginView,
      debugLogDiagnostics: true,
      redirect: _redirect,
      refreshListenable: authRepository,
      routes: [
        GoRoute(
          path: AppRoutes.loginView,
          builder: (context, state) {
            return LoginView(
              viewModel: LoginViewModel(authRepository: context.read()),
            );
          },
        ),
        ShellRoute(
          builder: (context, state, child) {
            return MenuView(child: child);
          },
          // Routes inside Shell
          routes: [
            // AddictionsView
            GoRoute(
              path: AppRoutes.addictionsView,
              builder: (context, state) {
                final viewModel = AddictionsViewModel(
                  addictionRepository: context.read<AddictionRepository>(),
                );
                return AddictionsView(viewModel: viewModel);
              },
              routes: [
                GoRoute(
                  path: AppRoutes.addictionViewRelative,
                  builder: (context, state) {
                    final name =
                        Uri.decodeComponent(state.pathParameters['name']!);
                    final viewModel = AddictionViewModel(
                      addictionRepository: context.read<AddictionRepository>(),
                    );

                    // Execute the load command when creating the view
                    viewModel.loadAddiction.execute(name);

                    return AddictionView(viewModel: viewModel);
                  },
                ),
              ],
            ),
            // DiariesView
            GoRoute(
              path: AppRoutes.diariesView,
              builder: (context, state) {
                final viewModel =
                    DiariesViewModel(diaryRepository: context.read());

                return DiariesView(viewModel: viewModel);
              },
            ),
            // ProfileView
            GoRoute(
              path: AppRoutes.profileView,
              builder: (context, state) {
                final viewModel = ProfileViewModel(
                  authRepository: context.read(),
                  userRepository: context.read(),
                );
                return ProfileView(viewModel: viewModel);
              },
              routes: [
                GoRoute(
                  path: AppRoutes.profileSettingsViewRelative,
                  builder: (context, state) {
                    final user = state.extra as User;
                    return ProfileSettingsView(user: user);
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );

// From https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/redirection.dart
Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  // if the user is not logged in, they need to login
  final loggedIn = await context.read<AuthRepository>().isAuthenticated;
  final loggingIn = state.matchedLocation == AppRoutes.loginView;
  if (!loggedIn) {
    return AppRoutes.loginView;
  }

  // if the user is logged in but still on the login page, send them to
  // the home page
  if (loggingIn) {
    return AppRoutes.addictionsView;
  }

  // no need to redirect at all
  return null;
}
