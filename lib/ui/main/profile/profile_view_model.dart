import 'package:client/utils/results.dart';
import 'package:logging/logging.dart';
import '../../../../data/repositories/auth/auth_repository.dart';
import '../../../../utils/command.dart';

class ProfileViewModel {
  ProfileViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository {
    logout = Command0(_logout);
  }

  final AuthRepository _authRepository;
  final _log = Logger('ProfileViewModel');

  late Command0 logout;

  Future<Result<void>> _logout() async {
    final result = await _authRepository.logout();
    if (result is Error<void>) {
      _log.warning('Logout failed! ${result.error}');
    } else {
      _log.info('Logout successful.');
    }
    return result;
  }
}
