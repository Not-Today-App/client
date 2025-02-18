import 'package:client/data/repositories/addiction/addiction_repository.dart';
import 'package:client/data/repositories/addiction/addiction_repository_remote.dart';
import 'package:client/data/repositories/auth/auth_repository.dart';
import 'package:client/data/repositories/auth/auth_repository_remote.dart';
import 'package:client/data/services/api/api_client.dart';
import 'package:client/data/services/api/auth_api_client.dart';
import 'package:client/data/services/shared_preferences_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providersRemote {
  return [
    Provider(create: (context) => AuthApiClient()),
    Provider(create: (context) => ApiClient()),
    Provider(create: (context) => SharedPreferencesService()),
    ChangeNotifierProvider<AuthRepository>(
        create: (context) => AuthRepositoryRemote(
              authApiClient: context.read<AuthApiClient>(),
              apiClient: context.read<ApiClient>(),
              sharedPreferencesService:
                  context.read<SharedPreferencesService>(),
            )),
    Provider<AddictionRepository>(
      create: (context) =>
          AddictionRepositoryRemote(apiClient: context.read<ApiClient>()),
    ),
  ];
}
