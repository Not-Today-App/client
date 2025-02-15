import 'package:client/data/services/local/local_data_service.dart';
import 'package:go_router/go_router.dart';
import 'package:client/routing/routes.dart';
import 'package:client/ui/auth/login/login_view.dart';
import 'package:client/ui/main/addiction/addictions_view.dart';
import 'package:client/ui/main/addiction/addictions_view_model.dart';
import 'package:client/ui/main/diary/diaries_view.dart';
import 'package:client/ui/main/menu_view.dart';
import 'package:client/ui/main/profile/profile_view.dart';
import 'package:provider/provider.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.loginView,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: AppRoutes.loginView,
      builder: (context, state) => const LoginView(),
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
              localDataService: LocalDataService(),
              addictionRepository: context.read(),
              userRepository: context.read(),
            );
            return AddictionsView(viewModel: viewModel);
          },
        ),
        // DiariesView
        GoRoute(
          path: AppRoutes.diariesView,
          builder: (context, state) => const DiariesView(),
        ),
        // ProfileView
        GoRoute(
          path: AppRoutes.profileView,
          builder: (context, state) => const ProfileView(),
        ),
      ],
    ),
  ],
);
