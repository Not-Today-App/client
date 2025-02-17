import 'package:client/data/repositories/addiction/addiction_repository.dart';
import 'package:client/data/repositories/addiction/addiction_repository_remote.dart';
import 'package:client/data/repositories/auth/auth_repository.dart';
import 'package:client/data/repositories/auth/auth_repository_remote.dart';
import 'package:client/data/services/api/api_client.dart';
import 'package:client/data/services/api/auth_api_client.dart';
import 'package:client/data/services/shared_preferences_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../data/services/local/local_data_service.dart';

/// Shared providers
// List<SingleChildWidget> _sharedProviders = [];

List<SingleChildWidget> get providersLocal {
  return [
    Provider.value(value: LocalDataService()),
    //..._sharedProviders,
  ];
}

List<SingleChildWidget> get providersRemote {
  return [
    Provider<AuthApiClient>(create: (context) => AuthApiClient()),
    Provider<ApiClient>(create: (context) => ApiClient()),

    Provider<SharedPreferencesService>(
      create: (context) => SharedPreferencesService(),
    ),

    ChangeNotifierProvider<AuthRepository>(
      create: (context) {
        return AuthRepositoryRemote(
          authApiClient: context.read<AuthApiClient>(),
          sharedPreferencesService: context.read<SharedPreferencesService>(),
        );
      },
    ),

    Provider<AddictionRepository>(
      create: (context) =>
          AddictionRepositoryRemote(apiClient: context.read<ApiClient>()),
    ),
    //..._sharedProviders,
  ];
}
