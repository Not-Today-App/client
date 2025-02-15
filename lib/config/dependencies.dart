import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../data/repositories/addiction/addiction_repository.dart';
import '../data/repositories/addiction/addiction_repository_local.dart';
import '../data/repositories/user/user_repository.dart';
import '../data/repositories/user/user_repository_local.dart';
import '../data/services/local/local_data_service.dart';

/// Shared providers
List<SingleChildWidget> _sharedProviders = [];

/// Configure dependencies for local data
List<SingleChildWidget> get providersLocal {
  return [
    Provider.value(value: LocalDataService()),
    Provider(
      create: (context) =>
          AddictionRepositoryLocal(localDataService: context.read())
              as AddictionRepository,
    ),
    Provider(
      create: (context) => UserRepositoryLocal(localDataService: context.read())
          as UserRepository,
    ),
    ..._sharedProviders,
  ];
}
