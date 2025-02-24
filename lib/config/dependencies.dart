import 'package:client/data/repositories/addiction/addiction_repository.dart';
import 'package:client/data/repositories/addiction/addiction_repository_remote.dart';
import 'package:client/data/repositories/auth/auth_repository.dart';
import 'package:client/data/repositories/auth/auth_repository_remote.dart';
import 'package:client/data/repositories/diary/diary_repository.dart';
import 'package:client/data/repositories/diary/diary_repository_remote.dart';
import 'package:client/data/repositories/user/user_repository.dart';
import 'package:client/data/repositories/user/user_repository_remote.dart';
import 'package:client/data/services/api/api_client.dart';
import 'package:client/data/services/api/auth_api_client.dart';
import 'package:client/data/services/shared_preferences_service.dart';
import 'package:client/ui/core/themes/theme_controller.dart';
import 'package:client/ui/main/diary/diaries_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providersLocal {
  return [
    Provider(create: (context) => SharedPreferencesService()),
    ChangeNotifierProvider<ThemeController>(
      create: (context) =>
          ThemeController(context.read<SharedPreferencesService>()),
    ),
  ];
}

List<SingleChildWidget> get providersRemote {
  return [
    Provider(create: (context) => AuthApiClient()),
    Provider(create: (context) => ApiClient()),
    ChangeNotifierProvider<AuthRepository>(
        create: (context) => AuthRepositoryRemote(
              authApiClient: context.read<AuthApiClient>(),
              apiClient: context.read<ApiClient>(),
              sharedPreferencesService:
                  context.read<SharedPreferencesService>(),
            )),
    Provider<UserRepository>(
      create: (context) => UserRepositoryRemote(
        apiClient: context.read(),
      ),
    ),
    ChangeNotifierProvider<DiaryRepository>(
      create: (context) =>
          DiaryRepositoryRemote(apiClient: context.read<ApiClient>()),
    ),
    Provider<AddictionRepository>(
      create: (context) =>
          AddictionRepositoryRemote(apiClient: context.read<ApiClient>()),
    ),
    ChangeNotifierProvider<DiariesViewModel>(
      create: (context) => DiariesViewModel(
        diaryRepository: context.read<DiaryRepository>(),
      ),
    ),
  ];
}
